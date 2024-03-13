'''这段代码定义了用于配置 Swagger 和 Redoc 的一些设置，以便在 API 文档中提供关于线上商城后端接口的信息。'''
SPECTACULAR_SETTINGS = {
    'SWAGGER_UI_DIST': 'SIDECAR',
    'SWAGGER_UI_FAVICON_HREF': 'SIDECAR',
    'REDOC_DIST': 'SIDECAR',
    'TITLE': 'API文档',
    'DESCRIPTION': '线上商城后端接口',
    'VERSION': '1.0.0',
    'SERVE_INCLUDE_SCHEMA': False,
}
