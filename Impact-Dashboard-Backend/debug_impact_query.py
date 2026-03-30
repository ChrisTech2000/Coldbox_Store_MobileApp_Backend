
import psycopg2
import os
from datetime import datetime

def setup_connection():
    return psycopg2.connect(
        user=os.environ.get("DB_USERNAME", "base"),
        password=os.environ.get("DB_PASSWORD", "base"),
        host=os.environ.get("DB_HOST", "db"),
        port=os.environ.get("DB_PORT", "5432"),
        database=os.environ.get("DB_NAME", "base"),
    )

conn = setup_connection()
cursor = conn.cursor()
with open('impact_queries/impact_metrics_room.sql') as f:
    query = f.read()

params = {
    'datetime_start': '2026-02-01 00:00:00',
    'datetime_end': '2026-03-01 00:00:00',
    'date_end': '2026-03-01'
}

cursor.execute(query, params)
desc = [d[0] for d in cursor.description]
rows = cursor.fetchall()
for r in rows:
    if r[4] == 2: # farmer_id
        print(f"--- CROP {r[5]} ({r[8]}) ---")
        for i, val in enumerate(r):
            print(f"{i}: {desc[i]} = {val}")
