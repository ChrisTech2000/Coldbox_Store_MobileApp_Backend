import psycopg2
import os

conn = psycopg2.connect(
    user=os.environ.get('DB_USERNAME', 'base'),
    password=os.environ.get('DB_PASSWORD', 'base'),
    host=os.environ.get('DB_HOST', 'db'),
    port=os.environ.get('DB_PORT', '5432'),
    database=os.environ.get('DB_NAME', 'base')
)
cur = conn.cursor()

queries = [
    ("--- IMPACT METRICS (NEW VALUES) ---", """
        SELECT 
            crop_name,
            ROUND(baseline_kg_selling_price_month::numeric, 4) as baseline_price_per_kg,
            ROUND(monthly_kg_selling_price::numeric, 4) as current_price_per_kg,
            ROUND(baseline_quantity_total_month::numeric, 2) as baseline_total_kg,
            ROUND(baseline_kg_loss_month::numeric, 2) as baseline_loss_kg,
            ROUND(monthly_kg_checkin::numeric, 2) as current_checkin_kg,
            ROUND(monthly_kg_loss::numeric, 2) as current_loss_kg,
            ROUND(baseline_farmer_revenue_month::numeric, 2) as baseline_revenue,
            ROUND(monthly_farmer_revenue::numeric, 2) as current_revenue
        FROM impact_metrics ORDER BY report_date DESC LIMIT 5;
    """),
    ("--- CO2 DATA SUMMARY ---", """
        SELECT COUNT(*) as total_rows,
               SUM(CASE WHEN tot_co2 > 0 THEN 1 ELSE 0 END) as with_co2,
               MIN(date) as min_date, MAX(date) as max_date
        FROM cooling_unit_metrics;
    """),
]

with open("debug_dump4.txt", "w") as f:
    for label, q in queries:
        f.write(label + "\n")
        try:
            cur.execute(q)
            cols = [d[0] for d in cur.description]
            f.write("\t".join(cols) + "\n")
            for row in cur.fetchall():
                f.write("\t".join([str(v) for v in row]) + "\n")
        except Exception as e:
            f.write(f"ERROR: {e}\n")
            conn.rollback()
        f.write("\n")

print("Done.")
