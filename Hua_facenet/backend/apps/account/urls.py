from django.urls import path
from .apis import UserRegisterApi, UserLoginApi, WXTrialApi,Is_PasswordApi,ResetPasswordApi
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView
)

urlpatterns = [
    path("register/", UserRegisterApi.as_view(), name="register"),
    path("login/", UserLoginApi.as_view(), name="login"),
    path("Is_password/",Is_PasswordApi.as_view(),name="Is_password"),
    path("reset_password/",ResetPasswordApi.as_view(),name="reset_password"),
    path("wxtrial/", WXTrialApi.as_view(), name="wx_trial"),
    path("token_obtain/", TokenObtainPairView.as_view(), name="obtain"),
    path("token_refresh/", TokenRefreshView.as_view(), name="refresh"),
    path("token_verify/", TokenVerifyView.as_view(), name="verify")
]
