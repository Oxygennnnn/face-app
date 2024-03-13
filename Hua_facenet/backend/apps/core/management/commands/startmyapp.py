import os

from django.conf import settings
from django.core.management.templates import TemplateCommand


class Command(TemplateCommand):
    help = (
        "Creates a Django app directory structure for the given app name in "
        "apps directory."
    )
    missing_args_message = "You must provide an application name."

    def handle(self, **options):
        app_name = options.pop("name")
        target = os.path.join(settings.BASE_DIR, f"apps/{app_name}")
        if not os.path.exists(target):
            os.makedirs(target)
        # 调用模版复制创建新app
        super().handle("app", app_name, target, **options)
        # 修改apps.py的name变量以便django识别
        with open(os.path.join(target, "apps.py"), "r+", encoding="utf-8") as f:
            content = f.read()
            content = content.replace(
                f"""name = '{app_name}'""",
                f"""name = 'apps.{app_name}'"""
            )
            # 清空内容
            f.truncate(0)
            # 指针复位
            f.seek(0)
            f.write(content)
