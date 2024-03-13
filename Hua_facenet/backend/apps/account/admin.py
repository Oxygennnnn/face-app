from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.translation import gettext
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import Group
from django.contrib.auth.admin import GroupAdmin as DjangoGroupAdmin
from .models import CustomUser


@admin.register(CustomUser)
class CustomUserAdmin(DjangoUserAdmin):
    """Add additional fields to user admin page."""
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        (_("Personal info"), {"fields": ("user_type", "first_name", "last_name", "gender", "phone", "email", "company", "position")}),
        (
            _("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                    "groups",
                    "user_permissions",
                ),
            },
        ),
        (_("Important dates"), {"fields": ("last_login", "date_joined")}),
    )
    list_display = ("username", "user_type", "fullname", "phone", "company", "position", "email")


class GroupProxy(Group):
    """Proxy model for Group. Dedicated for django-admin."""
    class Meta:
        """Declare model being proxy."""
        proxy = True
        verbose_name_plural = verbose_name = '用户组'


@admin.register(GroupProxy)
class MyGroupAdmin(DjangoGroupAdmin):
    """Grouping useradmin with groupadmin"""


admin.site.unregister(Group)  # Avoid multiple GroupAdmin
