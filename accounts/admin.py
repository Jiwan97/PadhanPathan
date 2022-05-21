from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseAdmin
from .models import User
from .models import Profile


class UserAdmin(BaseAdmin):
    fieldsets = (
        *BaseAdmin.fieldsets,
        (
            'Verification',
            {
                'fields': (
                    'is_email_verified',
                    'is_first_time',
                ),
            },
        ),
    )


admin.site.register(User, UserAdmin)
admin.site.register(Profile)
