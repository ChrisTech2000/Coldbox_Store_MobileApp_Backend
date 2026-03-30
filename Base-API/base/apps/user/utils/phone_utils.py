import phonenumbers

from base.apps.user.models import Company


def normalize_phone_number(phone_input: str) -> set:
    """
    Given a phone number input (local or international), return a set of
    possible E.164 formatted variants that could match in the database.

    For example:
      '08100000000' → {'+2348100000000', '08100000000'}
      '+2348100000000' → {'+2348100000000'}

    Uses country codes from registered companies to determine how to
    parse local numbers.
    """
    phone_input = phone_input.strip()
    candidates = {phone_input}  # always include the raw input

    # Collect country codes from registered companies
    country_codes = set(
        Company.objects.values_list("country", flat=True).distinct()
    )
    # Fallback: if no companies exist yet, try Nigeria
    if not country_codes:
        country_codes = {"NG"}

    for region in country_codes:
        try:
            parsed = phonenumbers.parse(phone_input, region)
            if phonenumbers.is_valid_number(parsed):
                e164 = phonenumbers.format_number(
                    parsed, phonenumbers.PhoneNumberFormat.E164
                )
                candidates.add(e164)
        except phonenumbers.NumberParseException:
            continue

    return candidates
