'''提供了一套完整的工具集，包括视图、默认的模板、认证、授权和其他功能。'''
REST_FRAMEWORK = {
    'EXCEPTION_HANDLER': 'apps.api.exception_handlers.custom_exception_handler',  # 使用自定义异常处理
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',  # 认证后才能访问
    ),
    'DEFAULT_PARSER_CLASSES': (
        'rest_framework.parsers.JSONParser',  # 默认解析器
        'rest_framework.parsers.FormParser',  # 解析表单数据
        'rest_framework.parsers.MultiPartParser',  # 解析文件上传
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',  # 基于JSON Web Token的认证
        'rest_framework.authentication.BasicAuthentication',  # 基于用户名和密码的认证
        # 'rest_framework.authentication.SessionAuthentication',  # 基于session的认证
    ),
    'DEFAULT_SCHEMA_CLASS': 'drf_spectacular.openapi.AutoSchema',  # 自动生成接口文档
}
