import duckdb
import pandas as pd

# Connect to existing DuckDB database
con = duckdb.connect('transformation/casestudy.duckdb')

# Run a sample query
query = """
    select 
        *
    from intermediate.stg_staging_intermediate__fx_rates

"""

# Fetch results as pandas DataFrame
df = con.execute(query).fetchdf()

# Display in console
print("✅ Sample Query Result:")
print(df)

# Export to CSV
output_path = "explore/exports/fx_rates_sample_export.csv"
df.to_csv(output_path, index=False)
print(f"📁 Exported CSV to: {output_path}")