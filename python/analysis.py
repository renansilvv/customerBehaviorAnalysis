import pandas as pd

fact_sales = pd.read_csv("data/fact_sales.csv")
customer_summary = pd.read_csv("data/customer_summary.csv")
monthly_sales = pd.read_csv("data/monthly_sales.csv")
customer_revenue_rank = pd.read_csv("data/customer_revenue_rank.csv")
repeat_rate = pd.read_csv("data/repeat_rate.csv")

print("Fact sales:")
print(fact_sales.head(), "\n")

print("Customer summary:")
print(customer_summary.head(), "\n")

print("Monthly sales:")
print(monthly_sales.head(), "\n")

print("Top 10 customers by revenue:")
print(customer_revenue_rank.head(10), "\n")

print("Repeat rate:")
print(repeat_rate, "\n")

print("General summary:")
print(f"Total sales rows: {len(fact_sales)}")
print(f"Total customers: {customer_summary['customer_unique_id'].nunique()}")
print(f"Total revenue: {fact_sales['revenue'].sum():.2f}")
print(f"Average revenue per customer: {customer_summary['total_revenue'].mean():.2f}")
