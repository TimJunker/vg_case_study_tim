# Varengold Bank AG - Data Analyst Case Study - Tim Junker

## 📋 Overview - Data Ingestion

To support data exploration and transformation, I created a dedicated data_ingestion folder structured as follows:

```
├── data_ingestion/                     # data ingestion folder
│   ├── exports/                        # Output data for Power BI / Excel
│   ├── scripts/                        # Python scripts to generate seed and csv files
│   │   ├── branch_names.py/            # script to create seed file which enriches the branch id with a branch name
│   │   ├── explore_duckdb.py/          # exports used for data exploration and importing them into excel and power bi 
│   │   └── fetch_fx_rates_frankfurter/ # script to create seed file which creates an alternative fx_rates table which pulls fx_rates on any given transaction date for the given currencies
```

## Rationale

Seed File Creation via Scripts:

branch_names.py:
    - Static mapping of branch IDs to human-readable name
    - Improves usability for non-technical users (e.g., branch managers)
    - Integrated via dbt seed, then modeled in the intermediate layer and used across marts and reporting models

fx_rates_full_history.py:
    - Pulls historical daily FX rates from Frankfurter.app
    - Ensures every transaction date has an FX conversion rate
    - Ingested as a seed and transformed in intermediate__fx_rates_filled
    - intermediate__fx_rates_filled includes logic to fill forward rates on non-business days in included

These seed files are version-controlled and fully integrated into dbt, ensuring reproducibility and alignment with transformation logic.

CSV Export to Power BI:

explore_duckdb.py:
    - Exports enriched dbt models to CSV using the DuckDB Python API
    - Supports external data exploration and visualization in Power BI or Exce
    - Simplifies prompt-based model inspection without relying solely on terminal outputs

## Pipeline summary

Raw Data 
  → dbt seeds (branch_names, fx_rates) 
    → dbt intermediate models 
      → Marts models 
        → Reporting models 
          → Python csv exports 
            → Power BI Dashboards

