'''配置跨域资源共享（CORS）的相关设置。CORS 是一种机制，它允许服务器在响应头中加入一些特定的头信息，从而允许浏览器在不同的域名下请求资源。'''
CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_ALL_ORIGINS = True
CORS_ORIGIN_WHITELIST = ( '*' )

CORS_ALLOW_METHODS = (

        'DELETE',

        'GET',

        'OPTIONS',

        'PATCH',

        'POST',

        'PUT',

        'VIEW',

)

CORS_ALLOW_HEADERS = (

        'XMLHttpRequest',

        'X_FILENAME',

        'accept-encoding',

        'authorization',

        'content-type',

        'dnt',

        'origin',

        'user-agent',

        'x-csrftoken',

        'x-requested-with',

        'Pragma',

)