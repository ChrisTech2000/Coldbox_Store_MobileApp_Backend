import re

from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers

from base.apps.marketplace.models import PaystackAccount

# Field length constants
DELIVERY_COMPANY_NAME_MAX_LENGTH = 255
CONTACT_NAME_MAX_LENGTH = 255
ACCOUNT_NAME_MAX_LENGTH = 100

# Validation patterns
BANK_CODE_PATTERN = r'^[A-Z0-9]{1,9}$'
COUNTRY_CODE_PATTERN = r'^[A-Z]{2}$'
ACCOUNT_NUMBER_PATTERN = r'^[0-9]{6,30}$'


class CompanyCreateDeliveryContactRequestSerializer(serializers.Serializer):
    """
    Serializer for creating a company's delivery contact.
    Validates the delivery company name, contact name, phone number, and cooling unit.
    """
    class CoolingUnitIdsField(serializers.Field):
        """
        Accepts either a single integer or a list of integers under `cooling_unit_ids`.
        Normalizes to a non-empty list of integers for downstream handling.
        """

        def to_internal_value(self, data):
            if isinstance(data, list):
                if not data:
                    raise serializers.ValidationError("cooling_unit_id cannot be empty")
                values = data
            else:
                values = [data]

            normalized = []
            for value in values:
                try:
                    normalized.append(int(value))
                except (TypeError, ValueError):
                    raise serializers.ValidationError("cooling_unit_id must be an integer or list of integers")

            return normalized

        def to_representation(self, value):
            return value

    delivery_company_name = serializers.CharField(
        required=True,
        allow_blank=False,
        help_text="Delivery Company Name",
        max_length=DELIVERY_COMPANY_NAME_MAX_LENGTH
    )
    contact_name = serializers.CharField(
        required=True,
        allow_blank=False,
        help_text="Contact Name",
        max_length=CONTACT_NAME_MAX_LENGTH
    )
    phone = PhoneNumberField(
        required=True,
        help_text="Contact phone"
    )
    cooling_unit_ids = CoolingUnitIdsField(
        required=True,
        help_text="Cooling Unit IDs"
    )
    is_active = serializers.BooleanField(
        required=False,
        help_text="Whether the contact is active",
        default=True
    )

    class Meta:
        fields = ['delivery_company_name', 'contact_name', 'phone', 'cooling_unit_ids', 'is_active']


class CompanySetupUsersFirstPaystackBankAccountRequestSerializer(serializers.Serializer):
    """
    Serializer for setting up a user's first Paystack bank account.
    Validates fields such as account type, bank code, country code, account number, and account name.
    """
    owned_by_user_id = serializers.IntegerField(
        required=True,
        help_text="User ID"
    )
    account_type = serializers.ChoiceField(
        choices=PaystackAccount.AccountType.choices,
        required=True,
        help_text="Account type"
    )
    bank_code = serializers.RegexField(re.compile(BANK_CODE_PATTERN)) # TODO: base this on a list of dynamic choices by using the Paystack API / list of banks
    country_code = serializers.RegexField(re.compile(COUNTRY_CODE_PATTERN))
    account_number = serializers.RegexField(re.compile(ACCOUNT_NUMBER_PATTERN))
    account_name = serializers.CharField(
        max_length=ACCOUNT_NAME_MAX_LENGTH,
        help_text="Account name"
    )

    class Meta:
        fields = [
            'account_type',
            'bank_code',
            'country_code',
            'account_number',
            'account_name'
        ]


class CompanySetupEligibilityCheckRequestSerializer(serializers.Serializer):
    """
    Serializer for checking a company's or user's eligibility.
    Accepts lists of company IDs and/or user IDs.
    """
    company_ids = serializers.ListField(
        child=serializers.IntegerField(),
        required=False,
        help_text="Company IDs",
        allow_empty=False
    )
    user_ids = serializers.ListField(
        child=serializers.IntegerField(),
        required=False,
        help_text="User IDs",
        allow_empty=False
    )

    class Meta:
        fields = [
            'company_ids',
            'user_ids',
        ]
