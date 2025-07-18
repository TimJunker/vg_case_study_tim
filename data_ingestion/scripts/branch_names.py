import pandas as pd
import random

# List of 99 international city names
international_cities = [
    "New York", "London", "Tokyo", "Paris", "Sydney", "Toronto", "Dubai", "Singapore", "Barcelona",
    "Amsterdam", "Berlin", "Rome", "Istanbul", "Seoul", "Bangkok", "Los Angeles", "Chicago", "San Francisco",
    "Vienna", "Hong Kong", "Madrid", "Lisbon", "Melbourne", "Stockholm", "Brussels", "Copenhagen", "Zurich",
    "Oslo", "Munich", "Dublin", "Helsinki", "Prague", "Warsaw", "Budapest", "Athens", "Reykjavik", "Tallinn",
    "Vilnius", "Riga", "Krakow", "Valencia", "Porto", "Lyon", "Nice", "Naples", "Florence", "Venice", "Geneva",
    "Basel", "Frankfurt", "Hamburg", "Cologne", "Stuttgart", "Milan", "Turin", "Bologna", "Marseille", "Lille",
    "Antwerp", "Ghent", "Rotterdam", "The Hague", "Utrecht", "Gothenburg", "Malmo", "Bergen", "Trondheim",
    "Luxembourg", "Ljubljana", "Bratislava", "Sarajevo", "Belgrade", "Zagreb", "Skopje", "Podgorica",
    "Tirana", "Sofia", "Bucharest", "Chisinau", "Kiev", "Odessa", "Tbilisi", "Yerevan", "Baku", "Nur-Sultan",
    "Almaty", "Tashkent", "Ashgabat", "Bishkek", "Dushanbe", "Doha", "Manama", "Muscat", "Kuwait City",
    "Riyadh", "Jeddah", "Cairo", "Casablanca", "Cape Town", "Johannesburg"
]

# Ensure reproducibility (optional)
random.seed(42)

# Shuffle and assign cities to branch IDs
random.shuffle(international_cities)
branch_df = pd.DataFrame({
    'branch_id': list(range(1, 100)),
    'branch_name': international_cities[:99]
})

# Export path
output_path = "transformation/seeds/branch_names.csv"
branch_df.to_csv(output_path, index=False)

print(f"✅ Branch seed file saved to: {output_path}")
