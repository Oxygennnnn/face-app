from rest_framework import serializers
from .models import CustomUser
from django.conf import settings
from django.contrib.auth import get_user_model


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = [
            "username",
            "password",
            "first_name",
            "last_name",
            "email",
            "gender",
            "phone",
            "user_type",
            "company",
            "position"
        ]

    def create(self, validated_data: dict) -> CustomUser:
        """Fix password not set issue due to security reason

        Args:
            validated_data (dict): Validatied data from request

        Returns:
            CustomUser: New user instance
        """

        #密码单独拿出来，因为需要加密后才能存在数据库
        password = validated_data.pop("password")
        #创建实例user
        user = get_user_model().objects.create_user(**validated_data)
        #加密
        user.set_password(password)
        user.save()
        return user


class UserLoginSerializer(serializers.Serializer):

    username = serializers.CharField(
        max_length=150,
        required=True
    )
    password = serializers.CharField(
        max_length=128,
        required=True
    )

class IsPasswordSerializer(serializers.Serializer):
    email=serializers.CharField(
       required=True
    )
    username = serializers.CharField(
        max_length=150,
        required=True
    )

class ResetSerializer(serializers.Serializer):
    token=serializers.CharField(
        required=True
    )
    username = serializers.CharField(
        max_length=150,
        required=True
    )
    password= serializers.CharField(
        max_length=128,
        required=True
    )