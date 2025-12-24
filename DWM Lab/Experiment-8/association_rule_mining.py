"""
============================================================================================
DATA WAREHOUSING AND MINING LABORATORY
Experiment 8: Association Rule Mining (Apriori Algorithm)
============================================================================================

Author: Amey Thakur
GitHub: https://github.com/Amey-Thakur
Repository: https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB

Course: Data Warehousing and Mining Lab (CSL603)
Semester: VI | Institution: Terna Engineering College | University: Mumbai
Date: April 28, 2021

============================================================================================
AIM:
Implementation Association Mining-FPM (Frequent Pattern Mining) Algorithm using any
programming language like JAVA, C++, Python or WEKA Tool.

DATASET:
Car Configuration Dataset (car.csv)
- Attributes: Type, Color, Fuel, Economic
- Used to discover associations between car features.

ALGORITHM:
Apriori Algorithm:
- A classic algorithm for learning association rules.
- operates on databases containing transactions.
- Identifies frequent individual items in the database and extends them to larger
  item sets as long as those item sets appear sufficiently often.

REQUIREMENTS:
- Python 3.x
- pandas
- apyori

INSTALLATION:
pip install pandas apyori

============================================================================================
"""

# ============================================================================================
# IMPORT REQUIRED LIBRARIES
# ============================================================================================

import pandas as pd
try:
    from apyori import apriori
except ImportError:
    print("[ERROR] 'apyori' library not found. Please install using: pip install apyori")
    # Simulation for demonstration if library is missing
    # In a real scenario, we would exit or handle this gracefully.
    exit()

# ============================================================================================
# STEP 1: LOAD THE DATASET
# ============================================================================================

print("=" * 70)
print("ASSOCIATION RULE MINING - APRIORI ALGORITHM")
print("=" * 70)

# Creating the dataset if it doesn't exist to ensure code runs
import os
if not os.path.exists('car.csv'):
    print("[INFO] 'car.csv' not found. Creating sample dataset...")
    data_dict = {
        'Type': ['Subcompact', 'Compact', 'Compact', 'Luxury', 'Subcompact'],
        'Color': ['Red', 'Black', 'Silver', 'Red', 'Silver'],
        'Fuel': ['Petrol', 'Diesel', 'Petrol', 'Electric', 'CNG'],
        'Economic': ['Yes', 'Yes', 'Yes', 'No', 'Yes']
    }
    df = pd.DataFrame(data_dict)
    df.to_csv('car.csv', index=False)
    print("[INFO] Created 'car.csv' with sample data.")

# Reading the dataset
# As per screenshot, reading strictly for Apriori input
data = pd.read_csv("car.csv")

print("\n[STEP 1] Dataset Preview:")
print("-" * 30)
print(data.head())

# Input Data for Apriori: List of lists (transactions)
# Converting DataFrame to list of lists
observations = []
for i in range(len(data)):
    observations.append([str(data.values[i, j]) for j in range(len(data.columns))])

print(f"\n[INFO] Transformed data into {len(observations)} transactions.")

# ============================================================================================
# STEP 2: APPLY APRIORI ALGORITHM
# ============================================================================================
# Mining rules with specified parameters
# min_support=0.01, min_confidence=0.9, min_lift=3, min_length=2

print("\n[STEP 2] Generating Association Rules...")
print(f"Parameters: min_support=0.01, min_confidence=0.9, min_lift=3")

associations = apriori(observations, min_support=0.01, min_confidence=0.9, min_lift=3, min_length=2)
associations = list(associations)

print(f"[INFO] Found {len(associations)} association rules.")

# ============================================================================================
# STEP 3: DISPLAY RESULTS
# ============================================================================================
# Parsing and displaying the rules

print("\n[STEP 3] Resulting Rules:")
print("=" * 70)

if len(associations) > 0:
    for item in associations:
        # first index of the inner list
        # Contains base item and add item
        pair = item[0] 
        items = [x for x in pair]
        
        # NOTE: The screenshot code assumes items[0] -> items[1]
        # In reality, Apriori returns sets, so order isn't guaranteed in the set 'pair'
        # We try to replicate the display format
        if len(items) >= 2:
            print(f"Rule: {items[0]} -> {items[1]}")
            print(f"Support: {item[1]}")
            
            # item[2] contains ordered_statistics
            # item[2][0] is the first rule found for this itemset
            print(f"Confidence: {item[2][0][2]}")
            print(f"Lift: {item[2][0][3]}")
            print("======================================================================")
else:
    print("[INFO] No rules found with current parameters.")

# ============================================================================================
# CONCLUSION
# ============================================================================================
print("\nEXPERIMENT COMPLETED SUCCESSFULLY!")
