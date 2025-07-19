import duckdb
import pandas as pd

# Connect to existing DuckDB database
con = duckdb.connect('transformation/casestudy.duckdb')

# Run a sample query
query = """
    select 
        *
    from intermediate.intermediate__fx_rates_filled

"""

# Fetch results as pandas DataFrame
df = con.execute(query).fetchdf()

# Display in console
print("✅ Sample Query Result:")
print(df)

# Export to CSV
output_path = "data_ingestion/exports/intermediate__fx_rates_filled.csv"
df.to_csv(output_path, index=False)
print(f"📁 Exported CSV to: {output_path}")