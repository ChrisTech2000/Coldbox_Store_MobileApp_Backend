import os, django, json
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "base.settings")
django.setup()

from base.apps.storage.models import CoolingUnit, Crop, CoolingUnitCrop
from base.apps.storage.models.crop_type import CropType

# Check if crops already exist
if Crop.objects.count() > 0:
    print(f"Crops already exist: {Crop.objects.count()}")
else:
    # Load from fixtures
    fixture_path = os.path.join(os.path.dirname(__file__), "base/apps/storage/fixtures/crops.json")
    with open(fixture_path, "r") as f:
        data = json.load(f)

    # First create CropTypes
    for item in data:
        if item["model"] == "storage.croptype":
            CropType.objects.get_or_create(
                pk=item["pk"],
                defaults={"name": item["fields"]["name"]}
            )
    print(f"Created {CropType.objects.count()} crop types")

    # Then create Crops
    for item in data:
        if item["model"] == "storage.crop":
            fields = item["fields"]
            Crop.objects.get_or_create(
                pk=item["pk"],
                defaults={
                    "crop_type_id": fields["crop_type"],
                    "name": fields["name"],
                    "image": fields.get("image", ""),
                    "optimal_storage_temperature": fields.get("optimal_storage_temperature"),
                    "approximate_shelf_life": fields.get("approximate_shelf_life"),
                    "harvested_today": fields.get("harvested_today", 100),
                    "harvested_yesterday": fields.get("harvested_yesterday"),
                    "harvested_day_before_yesterday": fields.get("harvested_day_before_yesterday"),
                    "harvested_before": fields.get("harvested_before"),
                    "size_selection_1": fields.get("size_selection_1"),
                    "size_selection_2": fields.get("size_selection_2"),
                    "size_selection_3": fields.get("size_selection_3"),
                    "digital_twin_identifier": fields.get("digital_twin_identifier"),
                    "dependent_constant": fields.get("dependent_constant"),
                    "activation_energy_constant": fields.get("activation_energy_constant"),
                }
            )
    print(f"Created {Crop.objects.count()} crops")

# Assign ALL crops to the cooling unit via CoolingUnitCrop junction table
cu = CoolingUnit.objects.filter(deleted=False).first()
if cu:
    all_crops = Crop.objects.all()
    created_count = 0
    for crop in all_crops:
        _, created = CoolingUnitCrop.objects.get_or_create(
            crop=crop,
            cooling_unit=cu,
            defaults={"active": True}
        )
        if created:
            created_count += 1
    print(f"Assigned {created_count} crops to CU '{cu.name}' (id={cu.id})")
    print(f"Total CoolingUnitCrop records: {CoolingUnitCrop.objects.filter(cooling_unit=cu).count()}")
else:
    print("No cooling unit found!")
