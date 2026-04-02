import os
import pandas as pd
from sqlalchemy import create_engine

DB_USER = os.getenv("DB_USER", "renan")
DB_PASSWORD = os.getenv("DB_PASSWORD", "123")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME", "ecommerce")

OUTPUT_DIR = "data"

engine = create_engine(
    f"postgresql://renan:123@localhost:5432/ecommerce"
)

os.makedirs(OUTPUT_DIR, exist_ok=True)

queries = {
    "fact_sales": "SELECT * FROM fact_sales;",
    "customer_summary": "SELECT * FROM customer_summary;",
    "monthly_sales": "SELECT * FROM monthly_sales;",
    "customer_revenue_rank": "SELECT * FROM customer_revenue_rank;",
    "repeat_rate": "SELECT * FROM repeat_rate;"
}

for name, query in queries.items():
    df = pd.read_sql(query, engine)
    df.to_csv(os.path.join(OUTPUT_DIR, f"{name}.csv"), index=False)

print("Exportado.")
