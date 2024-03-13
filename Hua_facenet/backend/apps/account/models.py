from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

class CustomUser(AbstractUser):
    """自定义用户模型"""
    first_name = models.CharField(
        _("first name"),
        max_length=150,
        default=""
    )
    last_name = models.CharField(
        _("last name"),
        max_length=150,
        default=""
    )
    email = models.EmailField(
        _("email address"),
        default="example@example.com"
    )
    gender = models.CharField(
        max_length=10,
        choices=(
            ("male", "男"),
            ("female", "女"),
        ),
        verbose_name="性别",
        default=""
    )
    phone = models.CharField(
        max_length=11,
        verbose_name="手机",
        default=""
    )
    user_type = models.CharField(
        max_length=10,
        choices=(
            ("individual", "个人"),
            ("enterprise", "企业"),
        ),
        verbose_name="用户类型",
        default="individual"
    )
    company = models.CharField(
        max_length=255,
        verbose_name="公司",
        default=""
    )
    position = models.CharField(
        max_length=255,
        verbose_name="职位",
        default=""
    )
    wx_openid = models.CharField(
        max_length=255,
        verbose_name="微信openid",
        unique=True,
        null=True,
        blank=True
    )

    @property
    def fullname(self):
        return f"{self.last_name}{self.first_name}"
    fullname.fget.short_description = "姓名"
    
    class Meta:
        verbose_name = verbose_name_plural = "用户"
        
class PasswordResetToken(models.Model):
    user = models.ForeignKey(
        get_user_model(), 
        on_delete=models.CASCADE
        )
    token = models.CharField(
        max_length=32, 
        unique=True
        )
    created_at = models.DateTimeField(
        auto_now_add=True
        )
    
    def __str__(self):
        return f"PasswordResetToken for {self.user.username}"