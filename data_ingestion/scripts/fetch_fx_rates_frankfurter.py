import requests
import pandas as pd
from datetime import datetime

# Currencies to track
CURRENCIES = [
    "USD", "JPY", "BGN", "CZK", "DKK", "GBP", "HUF", "PLN",
    "RON", "SEK", "CHF", "ISK", "NOK", "TRY", "AUD"
]

BASE = "EUR"  # Base currency for conversion
START_DATE = "2025-01-01"
END_DATE = "2025-03-10"

# API URL for the full date range
url = f"https://api.frankfurter.app/{START_DATE}..{END_DATE}"
params = {
    "from": BASE,
    "to": ",".join(CURRENCIES)
}

# --- Step 1: Make the request ---
print(f"📡 Fetching FX rates from {url}")
response = requests.get(url, params=params)
response.raise_for_status()

# --- Step 2: Parse the JSON response ---
data = response.json()
rates = data["rates"]

# --- Step 3: Transform to a flat table ---
records = []
for date_str, rate_map in rates.items():
    for currency, fx_rate in rate_map.items():
        records.append({
            "currency_iso_code": currency,
            "fx_rate_date": date_str,
            "fx_rate": fx_rate
        })

# --- Step 4: Convert to DataFrame ---
df = pd.DataFrame(records)
df["fx_rate_date"] = pd.to_datetime(df["fx_rate_date"])
df = df.sort_values(by=["currency_iso_code", "fx_rate_date"])

# --- Step 5: Save as dbt seed file ---
output_path = "transformation/seeds/fx_rates_full_history.csv"
df.to_csv(output_path, index=False)

print(f"✅ FX rate history saved to: {output_path}")
