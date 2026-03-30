import os, django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "base.settings")
django.setup()

from base.apps.user.models import Company

with open("/tmp/company_crops.txt", "w") as f:
    for c in Company.objects.all():
        crop_count = c.crop.count()
        f.write(f"Company {c.name} (id={c.id}) has {crop_count} crops\n")
