'''这段代码定义了 Django Channels 的默认通道层配置，使用 Redis 作为消息代理。这有助于实现实时通信功能，例如 WebSocket。'''
CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [("127.0.0.1", 9527)],
        },
    },
}

'''WebSocket 的数据传输方式更加灵活，可以实现低延迟、实时交互等功能。'''
# CHANNEL_LAYERS = {
#     "default": {
#         "BACKEND": "channels.layers.InMemoryChannelLayer"
#     }
# }
