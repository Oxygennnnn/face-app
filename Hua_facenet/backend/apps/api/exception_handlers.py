from apps.api.exceptions import ApplicationError
from django.core.exceptions import PermissionDenied
from django.core.exceptions import ValidationError as DjangoValidationError
from django.http import Http404
from rest_framework import exceptions
from rest_framework.response import Response
from rest_framework.serializers import as_serializer_error
from rest_framework.views import exception_handler
from rest_framework_simplejwt.exceptions import InvalidToken


def custom_exception_handler(exc, ctx) -> Response:
    """使用DRF处理服务器异常以外的异常, 并返回统一的响应格式.

    响应data结构如下:
        {
            "message": "Error message",
            "extra": {}
        }

    参考:
        https://www.django-rest-framework.org/api-guide/exceptions/#custom-exception-handling
    """
    if isinstance(exc, DjangoValidationError):
        exc = exceptions.ValidationError(as_serializer_error(exc))

    if isinstance(exc, Http404):
        exc = exceptions.NotFound()

    if isinstance(exc, PermissionDenied):
        exc = exceptions.PermissionDenied()

    if isinstance(exc, InvalidToken):  # token无效 (错误或过期)
        xtra_info = exc.detail["messages"][0]
        xtra_info["token_message"] = xtra_info.pop("message")
        exc = exceptions.AuthenticationFailed(
            detail=xtra_info
        )

    response = exception_handler(exc, ctx)

    # If unexpected error occurs (server error, etc.)
    if response is None:
        if isinstance(exc, ApplicationError):
            data = {"message": exc.message, "extra": exc.extra}
            return Response(data, status=400)

        return response

    if isinstance(exc.detail, (list, dict)):
        response.data = {"detail": response.data}

    if isinstance(exc, exceptions.ValidationError):
        response.data["message"] = "Validation error"
        response.data["extra"] = {"fields": response.data["detail"]}
    elif isinstance(exc, exceptions.AuthenticationFailed):
        response.data["message"] = "Authentication failed"
        response.data["extra"] = response.data["detail"]
    else:
        response.data["message"] = response.data["detail"]
        response.data["extra"] = {}

    del response.data["detail"]

    return response
