#邮件设置
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_USE_TLS = True                        #是否使用TLS安全传输协议(用于在两个通信应用程序之间提供保密性和数据完整性。)
EMAIL_HOST ='smtp.163.com'                  #发送邮件的邮箱 的 SMTP服务器，这里用了163邮箱
EMAIL_PORT = 25                               #发件箱的SMTP服务器端口
EMAIL_HOST_USER = '17620642718@163.com'        #发送邮件的邮箱地址
EMAIL_HOST_PASSWORD = 'INWCBGETHBRWEQKM'                #发送邮件的邮箱密码(这里使用的是授权码)
EMAIL_FROM = '17620642718<17620642718@163.com>'        #收件人看到的发件人