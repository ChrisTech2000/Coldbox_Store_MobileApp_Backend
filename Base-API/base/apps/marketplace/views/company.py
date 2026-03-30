from django.core.exceptions import ValidationError
from django.core.exceptions import ValidationError as DjangoValidationError
from django.db import IntegrityError, transaction
from django.db.models import Prefetch
from django.shortcuts import get_object_or_404
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.exceptions import ValidationError as DRFValidationError
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK
from rest_framework.viewsets import ViewSet

# Error message constants
ERROR_ACCESS_DENIED = "Access denied"
ERROR_COMPANY_ACCESS_FAILED = "Failed to access company information"
ERROR_DELIVERY_CONTACT_CREATION_FAILED = "Failed to create delivery contact"
ERROR_ACCOUNT_SETUP_FAILED = "Failed to set up Paystack account"
ERROR_ELIGIBILITY_CHECK_FAILED = "Eligibility check failed"

from base.apps.marketplace.models import (
    CompanyDeliveryContact,
    Order,
    OrderCrateItem,
    PaystackAccount,
)
from base.apps.marketplace.serializers.common import (
    CompanyDeliveryContactSerializer,
    PaystackAccountSerializer,
)
from base.apps.marketplace.serializers.company_requests import (
    CompanyCreateDeliveryContactRequestSerializer,
    CompanySetupEligibilityCheckRequestSerializer,
    CompanySetupUsersFirstPaystackBankAccountRequestSerializer,
)
from base.apps.marketplace.serializers.company_responses import CompanyOrderSerializer
from base.apps.marketplace.views.utils import get_company
from base.apps.storage.models import CoolingUnit
from base.apps.user.models import Operator, ServiceProvider, User
from base.utils.secure_errors import (
    handle_authorization_error,
    handle_internal_error,
    handle_validation_error
)

# -----------------------------------------------------------------------------
# Orders
# -----------------------------------------------------------------------------


class CompanyOrdersViewSet(ViewSet):
    permission_classes = [IsAuthenticated]
    lookup_field = "order_id"
    serializer_class = CompanyOrderSerializer

    def list(self, request):
        """GET /marketplace/company/orders/ - List all orders for the authenticated operator or registered employee."""
        user = request.user

        cooling_unit_id = request.query_params.get("cooling_unit_id", None)

        # Confirm that the cooling unit exists
        cooling_unit = get_object_or_404(CoolingUnit, id=cooling_unit_id)
        company = cooling_unit.location.company

        # Confirm that the user is connected to the company either as a service provider or operator
        if not ServiceProvider.is_employee_of_company(
            user, company
        ) and not Operator.is_operator_of_company(user, company):
            return Response(
                {"error": ERROR_ACCESS_DENIED}, status=status.HTTP_403_FORBIDDEN
            )

        orders = Order.objects.prefetch_related(
            Prefetch(
                "items",
                queryset=OrderCrateItem.objects.filter(
                    market_listed_crate__crate__cooling_unit_id=cooling_unit_id,
                ),
            )
        ).filter(
            status=Order.Status.PAID,
        )

        serializer = self.serializer_class(orders, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    # def retrieve(self, request, order_id=None):
    #     """GET /marketplace/company/orders/:order_id - Retrieve a specific order for the authenticated operator."""
    #     user = request.user
    #     order = get_object_or_404(Order, id=order_id, created_by_user=user, status__in=[Order.Status.PAYMENT_PENDING, Order.Status.PAID])

    #     serializer = self.serializer_class(order)  # Assuming CompanyCartSerializer can serialize a single order
    #     return Response(serializer.data, status=HTTP_200_OK)


# -----------------------------------------------------------------------------
# Delivery contacts
# -----------------------------------------------------------------------------


class CompanyDeliveryContactsViewSet(ViewSet):
    permission_classes = [IsAuthenticated]
    lookup_field = "company_delivery_contact_id"
    serializer_class = CompanyDeliveryContactSerializer

    def get_queryset(self, company):
        return CompanyDeliveryContact.objects.filter(company=company)

    def get_details(self, company, company_delivery_contact_id=None):
        return get_object_or_404(
            CompanyDeliveryContact,
            id=company_delivery_contact_id,
            company=company,
        )

    def list(self, request):
        """GET /marketplace/company/delivery-contacts/ - List delivery contacts, optionally filtered by cooling unit"""

        # Get company_id from query params
        company_id = request.query_params.get("company_id", None)
        if not company_id:
            return Response(
                {"error": "company_id is required"},
                status=status.HTTP_400_BAD_REQUEST
            )

        # Verify company exists and user has access
        try:
            company = get_company(request)
            if company.id != int(company_id):
                return Response(
                    {"error": "You don't have permission to access this company's contacts"},
                    status=status.HTTP_403_FORBIDDEN
                )
        except Exception as e:
            return handle_authorization_error(e, "company access validation")

        # Get cooling_unit_id from query params (optional)
        cooling_unit_id = request.query_params.get("cooling_unit", None)

        # Get status filter (optional)
        status_param = request.query_params.get("status", None)

        # Build base queryset
        contacts_query = CompanyDeliveryContact.objects.filter(
            company=company
        ).select_related('company', 'created_by_user').prefetch_related('cooling_units')

        # Filter by cooling unit if provided
        if cooling_unit_id:
            contacts_query = contacts_query.filter(cooling_units__id=cooling_unit_id)

        # Apply status filter if provided
        if status_param:
            if status_param.lower() == 'active':
                contacts_query = contacts_query.filter(is_active=True)
            elif status_param.lower() == 'inactive':
                contacts_query = contacts_query.filter(is_active=False)

        # Order by id to maintain consistent ordering
        contacts = list(contacts_query.order_by('id'))

        # Serialize and return
        serializer = self.serializer_class(contacts, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @transaction.atomic
    def create(self, request):
        """POST /marketplace/company/delivery-contacts/ -"""

        input_serializer = CompanyCreateDeliveryContactRequestSerializer(data=request.data)
        input_serializer.is_valid(raise_exception=True)

        try:
            company = get_company(request)
        except Exception as e:
            return handle_authorization_error(e, "company access validation")

        # Validate cooling_unit_ids exists and belongs to the company
        cooling_unit_ids = input_serializer.validated_data["cooling_unit_ids"]
        cooling_units = list(CoolingUnit.objects.filter(id__in=cooling_unit_ids))
        if len(cooling_units) != len(set(cooling_unit_ids)):
            return Response(
                {"error": "One or more cooling units were not found"},
                status=status.HTTP_400_BAD_REQUEST
            )
        for cu in cooling_units:
            if cu.location.company != company:
                return Response(
                    {"error": "Cooling unit does not belong to this company"},
                    status=status.HTTP_403_FORBIDDEN
                )

        try:
            delivery_contact = CompanyDeliveryContact.objects.create(
                company=company,
                created_by_user=request.user,
                delivery_company_name=input_serializer.validated_data[
                    "delivery_company_name"
                ],
                contact_name=input_serializer.validated_data["contact_name"],
                phone=input_serializer.validated_data["phone"],
                is_active=input_serializer.validated_data.get("is_active", True),
            )
            delivery_contact.cooling_units.set(cooling_units)
        except ValidationError as e:
            return handle_validation_error(e, "delivery contact validation")
        except Exception as e:
            return handle_internal_error(e, "delivery contact creation")

        serializer = self.serializer_class(delivery_contact)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def retrieve(self, request, company_delivery_contact_id=None):
        """GET /marketplace/company/delivery-contacts/:company_delivery_contact_id/ - Get specific coupon as seller."""

        try:
            company = get_company(request)
        except Exception as e:
            return handle_authorization_error(e, "company access validation")

        company_delivery_contacts = self.get_details(
            company, company_delivery_contact_id
        )

        serializer = self.serializer_class(company_delivery_contacts)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @transaction.atomic
    def partial_update(self, request, company_delivery_contact_id=None):
        """PATCH /marketplace/company/delivery-contacts/:company_delivery_contact_id/ - Update a delivery contact"""

        try:
            company = get_company(request)
        except Exception as e:
            return handle_authorization_error(e, "company access validation")

        company_delivery_contact = self.get_details(
            company, company_delivery_contact_id
        )

        # Update only provided fields
        if "delivery_company_name" in request.data:
            company_delivery_contact.delivery_company_name = request.data["delivery_company_name"]

        if "contact_name" in request.data:
            company_delivery_contact.contact_name = request.data["contact_name"]

        if "phone" in request.data:
            company_delivery_contact.phone = request.data["phone"]

        if "cooling_unit_ids" in request.data or "cooling_unit_id" in request.data:
            cooling_unit_ids = request.data.get("cooling_unit_ids", request.data.get("cooling_unit_id"))
            # Normalize to list
            if not isinstance(cooling_unit_ids, list):
                cooling_unit_ids = [cooling_unit_ids] if cooling_unit_ids else []

            if cooling_unit_ids:
                cooling_units = list(CoolingUnit.objects.filter(id__in=cooling_unit_ids))
                if len(cooling_units) != len(set(cooling_unit_ids)):
                    return Response(
                        {"error": "One or more cooling units were not found"},
                        status=status.HTTP_400_BAD_REQUEST
                    )
                for cu in cooling_units:
                    if cu.location.company != company:
                        return Response(
                            {"error": "Cooling unit does not belong to this company"},
                            status=status.HTTP_403_FORBIDDEN
                        )
                company_delivery_contact.cooling_units.set(cooling_units)
            else:
                company_delivery_contact.cooling_units.clear()

        if "is_active" in request.data:
            if isinstance(request.data["is_active"], bool):
                company_delivery_contact.is_active = request.data["is_active"]

        try:
            company_delivery_contact.save()
        except ValidationError as e:
            return handle_validation_error(e, "delivery contact validation")
        except Exception as e:
            return handle_internal_error(e, "delivery contact update")

        serializer = self.serializer_class(company_delivery_contact)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @transaction.atomic
    def destroy(self, request, company_delivery_contact_id=None):
        """DELETE /marketplace/company/delivery-contacts/:company_delivery_contact_id/ - Delete a particular contact through its id"""

        try:
            company = get_company(request)
        except Exception as e:
            return handle_authorization_error(e, "company access validation")

        company_delivery_contacts = self.get_details(
            company, company_delivery_contact_id
        )
        company_delivery_contacts.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(methods=["GET"], url_path="legacy", detail=False)
    def legacy_contacts(self, request):
        """GET /marketplace/company/delivery-contacts/legacy/ - Get all legacy contacts (cooling_unit=null) for a company"""

        # Get company_id from query params (mandatory)
        company_id = request.query_params.get("company_id", None)

        if not company_id:
            return Response(
                {"error": "company_id is required"},
                status=status.HTTP_400_BAD_REQUEST
            )

        # Verify company exists
        from base.apps.user.models import Company
        company = get_object_or_404(Company, id=company_id)

        # Check if user is a service provider assigned to this company
        user = request.user
        if not ServiceProvider.is_employee_of_company(user, company):
            return Response(
                {"error": "User must be a Service Provider assigned to this company"},
                status=status.HTTP_403_FORBIDDEN
            )

        from django.db.models import Count
        legacy_contacts_query = (
            CompanyDeliveryContact.objects.filter(company=company)
            .annotate(cooling_unit_count=Count('cooling_units'))
            .filter(cooling_unit_count=0)
            .select_related('company', 'created_by_user')
            .distinct()
        )

        contacts_serializer = self.serializer_class(legacy_contacts_query, many=True)
        return Response(contacts_serializer.data, status=status.HTTP_200_OK)


# -----------------------------------------------------------------------------
# Market eligibility
# -----------------------------------------------------------------------------


class CompanySetupViewSet(ViewSet):
    permission_classes = [IsAuthenticated]

    @action(methods=["POST"], url_path="eligibility-check", detail=False)
    @transaction.atomic
    def eligibility_check(self, request):
        """POST /marketplace/company/setup/eligibility-check/ - Check if setup is complete"""

        input_serializer = CompanySetupEligibilityCheckRequestSerializer(
            data=request.data
        )
        input_serializer.is_valid(
            raise_exception=True
        )  # Validate and raise exceptions if invalid

        companies_elligibility_map = {}
        users_elligibility_map = {}

        company_ids = input_serializer.validated_data.get("company_ids", [])
        user_ids = input_serializer.validated_data.get("user_ids", [])

        # prefill with false on all the ids
        for company_id in company_ids:
            companies_elligibility_map[str(company_id)] = False
        for user_id in user_ids:
            users_elligibility_map[str(user_id)] = False

        # Fill the ones that are eligible
        for company_id in (
            PaystackAccount.objects.filter(
                owned_on_behalf_of_company_id__in=company_ids, is_default_account=True
            )
            .values_list("owned_on_behalf_of_company_id", flat=True)
            .iterator()
        ):
            companies_elligibility_map[str(company_id)] = True
        for user_id in (
            PaystackAccount.objects.filter(
                owned_by_user_id__in=user_ids,
                owned_on_behalf_of_company_id__isnull=True,
                is_default_account=True,
            )
            .values_list("owned_by_user_id", flat=True)
            .iterator()
        ):
            users_elligibility_map[str(user_id)] = True

        return Response(
            {"companies": companies_elligibility_map, "users": users_elligibility_map},
            status=HTTP_200_OK,
        )

    @action(methods=["GET"], url_path="users-paystack-bank-account", detail=False)
    @transaction.atomic
    def get_users_bank_account_details(self, request, company_id=None):
        """GET /marketplace/company/setup/users-paystack-bank-account/ - Get users bank account details"""

        user_id = request.query_params.get("user_id", None)
        if not user_id:
            return Response(
                {"error": "Expecting user_id in query params"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        user = get_object_or_404(User, id=user_id)

        paystack_account = PaystackAccount.get_user_default_account(user.id)
        if not paystack_account:
            return Response(
                {"error": "No default paystack account found for user"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        serializer = PaystackAccountSerializer(paystack_account)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @action(
        methods=["post"], url_path="users-first-paystack-bank-account", detail=False
    )
    @transaction.atomic
    def setup_users_first_paystack_bank_account(self, request):
        input_ser = CompanySetupUsersFirstPaystackBankAccountRequestSerializer(
            data=request.data
        )
        input_ser.is_valid(raise_exception=True)

        user = get_object_or_404(
            User,
            id=input_ser.validated_data["owned_by_user_id"],
            own_paystack_accounts__isnull=True,
        )

        try:
            acct = PaystackAccount.create(
                created_by_user=request.user,
                owned_by_user=user,
                account_type=input_ser.validated_data["account_type"],
                bank_code=input_ser.validated_data["bank_code"],
                country_code=input_ser.validated_data["country_code"],
                account_number=input_ser.validated_data["account_number"],
                account_name=input_ser.validated_data["account_name"],
            )
        except (DjangoValidationError, DRFValidationError) as e:
            return handle_validation_error(e, "paystack account validation")
        except IntegrityError:
            return Response(
                {"error": "Account already exists"}, status=status.HTTP_409_CONFLICT
            )
        except Exception as e:
            return handle_internal_error(e, "paystack account setup")

        return Response(
            PaystackAccountSerializer(acct).data, status=status.HTTP_201_CREATED
        )
