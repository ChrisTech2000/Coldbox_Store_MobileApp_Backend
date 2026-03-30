from django.utils.translation import gettext_lazy as _
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from django.db.models import Q

from base.apps.user.models import Company, Operator
from base.apps.user.serializers.company import CompanySerializer
from base.apps.user.utils.phone_utils import normalize_phone_number


class OperatorLoginSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        phone_input = attrs[self.username_field]
        # Normalize the phone number to handle local format (e.g. 08100000000)
        phone_candidates = normalize_phone_number(phone_input)
        phone_q = Q()
        for candidate in phone_candidates:
            phone_q |= Q(user__phone__iexact=candidate)

        op = Operator.objects.filter(phone_q).select_related('user').first()
        if not op:
            print("Operator Login Error", phone_input)
            raise serializers.ValidationError({"user": [_("User not exists")]})
        attrs[self.username_field] = op.user.username
        data = super().validate(attrs)
        if op.user.language is not self.initial_data["language"]:
            op.user.language = self.initial_data["language"]
            op.user.save()
        company = Company.objects.get(id=op.company.id)
        company_serializer = CompanySerializer(company)

        refresh = self.get_token(self.user)
        data["refresh"] = str(refresh)
        data["access"] = str(refresh.access_token)

        # Add extra responses here
        data["user"] = {
            "id": op.user.id,
            "first_name": op.user.first_name,
            "last_name": op.user.last_name,
            "gender": op.user.gender,
            "phone": str(op.user.phone),
            "last_login": str(op.user.last_login),
        }
        data["role"] = "Operator"
        data["company"] = company_serializer.data
        return data
