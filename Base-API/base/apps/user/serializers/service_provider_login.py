
import logging

from django.db.models import Q
from django.utils.translation import gettext_lazy as _
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from base.apps.user.models import Company, ServiceProvider
from base.apps.user.serializers.company import CompanySerializer
from base.apps.user.utils.phone_utils import normalize_phone_number

logger = logging.getLogger(__name__)


class ServiceProviderLoginSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        username_input = attrs[self.username_field]
        logger.info(f"SP Login attempt for: {username_input}")
        # Normalize the phone number to handle local format (e.g. 08100000000)
        phone_candidates = normalize_phone_number(username_input)
        logger.info(f"Phone candidates: {phone_candidates}")
        phone_q = Q()
        for candidate in phone_candidates:
            phone_q |= Q(user__phone__iexact=candidate)

        sp = ServiceProvider.objects.filter(
            phone_q | Q(user__email__iexact=username_input)
        ).first()

        if not sp:
            logger.warning(f"SP not found for input: {username_input}")
            raise serializers.ValidationError({"user": [_("User not exists")]})
        
        logger.info(f"SP found: user={sp.user.username}, is_active={sp.user.is_active}, phone={sp.user.phone}")
        logger.info(f"Password check result: {sp.user.check_password(attrs['password'])}")
        attrs[self.username_field] = sp.user.username
        
        try:
            data = super().validate(attrs)
        except Exception as e:
            logger.error(f"JWT auth failed for SP {sp.user.username}: {type(e).__name__}: {e}")
            raise

        try:
            company = Company.objects.get(id=sp.company.id)
            company_serializer = CompanySerializer(company)
        except Exception as e:
            raise
            
        try:
            if sp.user.language is not self.initial_data["language"]:
                sp.user.language = self.initial_data["language"]
                sp.user.save()
        except KeyError as e:
            pass
        except Exception as e:
            raise
        refresh = self.get_token(self.user)
        data["refresh"] = str(refresh)
        data["access"] = str(refresh.access_token)

        # Add extra responses here
        data["user"] = {
            "id": sp.user.id,
            "first_name": sp.user.first_name,
            "last_name": sp.user.last_name,
            "email": sp.user.email,
            "gender": sp.user.gender,
            "phone": str(sp.user.phone),
            "last_login": str(sp.user.last_login),
        }
        data["role"] = "Service Provider"
        data["company"] = company_serializer.data
        return data
