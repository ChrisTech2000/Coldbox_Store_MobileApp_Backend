from datetime import timedelta

from django.db.models import Q
from django.utils import timezone

from base.apps.marketplace.models import MarketListedCrate
from base.celery import app

# Time constants
RECOMPUTE_INTERVAL_MINUTES = 5

# Log message templates
RECOMPUTE_SUCCESS_MESSAGE = "Recomputed fields for listing ID {listing_id}."
RECOMPUTE_ERROR_MESSAGE = "Error recomputing fields for listing ID {listing_id}: {error}"


@app.task
def recompute_computed_fields():
    """
    Recomputes the computed fields for active market listings (MarketListedCrate).

    Filters for listings that are not delisted and whose computed fields have never been set
    or were last updated more than RECOMPUTE_INTERVAL_MINUTES ago. For each listing meeting
    these criteria, the compute() method is called to update computed values.

    This ensures marketplace listings stay in sync with crate weights after checkouts,
    with eventual consistency within the recompute interval.

    Errors are printed (and are captured by Sentry).
    """
    # Calculate the threshold time (e.g., 5 minutes ago)
    recompute_threshold = timezone.now() - timedelta(minutes=RECOMPUTE_INTERVAL_MINUTES)

    # Retrieve active market listings that need recomputation:
    listings = MarketListedCrate.objects.filter(
        Q(delisted_at__isnull=True) &
        (Q(cmp_last_updated_at__isnull=True) | Q(cmp_last_updated_at__lt=recompute_threshold))
    )

    # Process each listing individually
    for listing in listings.iterator():
        try:
            listing.compute()
            print(RECOMPUTE_SUCCESS_MESSAGE.format(listing_id=listing.id))
        except Exception as e:
            print(RECOMPUTE_ERROR_MESSAGE.format(listing_id=listing.id, error=e))
