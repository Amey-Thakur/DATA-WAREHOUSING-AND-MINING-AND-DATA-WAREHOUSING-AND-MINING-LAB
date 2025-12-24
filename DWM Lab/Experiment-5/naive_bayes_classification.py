"""
============================================================================================
DATA WAREHOUSING AND MINING LABORATORY
Experiment 5: Naive Bayes Classification using Python (scikit-learn)
============================================================================================

Author: Amey Thakur
GitHub: https://github.com/Amey-Thakur
Repository: https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB

Course: Data Warehousing and Mining Lab (CSL603)
Semester: VI | Institution: Terna Engineering College | University: Mumbai
Date: April 15, 2021

============================================================================================
AIM:
Implementation of Naive Bayes Algorithm using any programming language like JAVA, C++,
Python or WEKA Tool.

DATASET:
Pima Indians Diabetes Dataset (diabetes_csv.csv)
- 768 instances (rows)
- 9 attributes (columns)
- Binary classification: tested_positive / tested_negative

ATTRIBUTES:
1. preg  - Number of times pregnant
2. plas  - Plasma glucose concentration (2 hours in an oral glucose tolerance test)
3. pres  - Diastolic blood pressure (mm Hg)
4. skin  - Triceps skin fold thickness (mm)
5. insu  - 2-Hour serum insulin (mu U/ml)
6. mass  - Body mass index (weight in kg/(height in m)^2)
7. pedi  - Diabetes pedigree function
8. age   - Age in years
9. class - Target variable (tested_positive / tested_negative)

ALGORITHM:
Gaussian Naive Bayes - Assumes features follow a Gaussian (normal) distribution.
Based on Bayes' theorem: P(y|X) = P(X|y) * P(y) / P(X)

REQUIREMENTS:
- Python 3.x
- numpy
- pandas
- scikit-learn

INSTALLATION:
pip install numpy pandas scikit-learn

============================================================================================
"""

# ============================================================================================
# IMPORT REQUIRED LIBRARIES
# ============================================================================================

import numpy as np
import pandas as pd

# Import necessary modules from scikit-learn
from sklearn.naive_bayes import GaussianNB
from sklearn.model_selection import train_test_split
from sklearn import metrics

# ============================================================================================
# STEP 1: LOAD THE DATASET
# ============================================================================================
# Load the diabetes dataset from CSV file
# The dataset contains 768 instances with 9 attributes

print("=" * 70)
print("NAIVE BAYES CLASSIFICATION - DIABETES PREDICTION")
print("=" * 70)

# Read the CSV file into a pandas DataFrame
d1 = pd.read_csv('diabetes_csv.csv')

# Display basic information about the dataset
print("\n[INFO] Dataset loaded successfully!")
print(f"[INFO] Dataset Shape: {d1.shape[0]} rows × {d1.shape[1]} columns")

# Display the first 5 rows of the dataset
print("\n[STEP 1] First 5 rows of the dataset:")
print("-" * 70)
print(d1.head())

# Display the full dataset information
print("\n[INFO] Dataset Info:")
print(d1.info())

# ============================================================================================
# STEP 2: PREPARE FEATURES AND TARGET ARRAYS
# ============================================================================================
# Create feature matrix (X) and target vector (y)
# X contains all columns except the last one (features)
# y contains only the last column (target/class)

print("\n[STEP 2] Preparing features and target arrays...")

# Features: All columns except the last one
X = d1[d1.columns[:-1]]
print(f"[INFO] Features shape: {X.shape}")

# Target: Only the last column
y = d1[d1.columns[-1]]
print(f"[INFO] Target shape: {y.shape}")
print(f"[INFO] Class distribution:\n{y.value_counts()}")

# ============================================================================================
# STEP 3: SPLIT DATA INTO TRAINING AND TEST SETS
# ============================================================================================
# Split the dataset into training (80%) and testing (20%) sets
# random_state=42 ensures reproducibility

print("\n[STEP 3] Splitting data into training and test sets...")

X_train, X_test, y_train, y_test = train_test_split(
    X, y, 
    test_size=0.2,      # 20% for testing
    random_state=42     # For reproducibility
)

print(f"[INFO] Training set size: {X_train.shape[0]} samples")
print(f"[INFO] Test set size: {X_test.shape[0]} samples")

# ============================================================================================
# STEP 4: CREATE AND TRAIN THE GAUSSIAN NAIVE BAYES MODEL
# ============================================================================================
# GaussianNB assumes features follow a Gaussian distribution

print("\n[STEP 4] Training Gaussian Naive Bayes model...")

# Initialize the Gaussian Naive Bayes classifier
gnb = GaussianNB()

# Train the model using the training data
gnb.fit(X_train, y_train)

print("[INFO] Model training completed!")

# ============================================================================================
# STEP 5: MAKE PREDICTIONS ON TEST DATA
# ============================================================================================
# Use the trained model to predict on unseen test data

print("\n[STEP 5] Making predictions on test data...")

# Predict the class labels for test set
y_pred = gnb.predict(X_test)

print(f"[INFO] Predictions made for {len(y_pred)} test samples")

# ============================================================================================
# STEP 6: EVALUATE MODEL PERFORMANCE
# ============================================================================================
# Calculate and display accuracy score

print("\n[STEP 6] Evaluating model performance...")
print("-" * 70)

# Calculate accuracy
accuracy = metrics.accuracy_score(y_test, y_pred) * 100
print(f"Gaussian Naive Bayes model accuracy (in %): {accuracy}")

# Display confusion matrix
print("\n[INFO] Confusion Matrix:")
print(metrics.confusion_matrix(y_test, y_pred))

# Display classification report
print("\n[INFO] Classification Report:")
print(metrics.classification_report(y_test, y_pred))

# ============================================================================================
# STEP 7: DISPLAY PREDICTIONS
# ============================================================================================
# Show the predicted classes for test samples

print("\n[STEP 7] Predictions for test samples:")
print("-" * 70)
print(gnb.predict(X_test))

# ============================================================================================
# CONCLUSION
# ============================================================================================
print("\n" + "=" * 70)
print("EXPERIMENT COMPLETED SUCCESSFULLY!")
print(f"Model Accuracy: {accuracy:.2f}%")
print("=" * 70)

"""
============================================================================================
EXPECTED OUTPUT:
============================================================================================
Gaussian Naive Bayes model accuracy (in %): 76.62337662337663

The model achieves approximately 76.6% accuracy on the diabetes prediction task.
This is a reasonable performance for a simple probabilistic classifier.

OBSERVATIONS:
1. Naive Bayes assumes feature independence (naive assumption)
2. Works well with high-dimensional data
3. Requires less training data compared to other algorithms
4. Fast prediction and training time
============================================================================================
"""
