"""
============================================================================================
DATA WAREHOUSING AND MINING LABORATORY
Experiment 6: K-Means Clustering using Python (scikit-learn)
============================================================================================

Author: Amey Thakur
GitHub: https://github.com/Amey-Thakur
Repository: https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB

Course: Data Warehousing and Mining Lab (CSL603)
Semester: VI | Institution: Terna Engineering College | University: Mumbai
Date: April 15, 2021

============================================================================================
AIM:
Implementation of K-Means clustering using any programming language like JAVA, C++,
Python or WEKA Tool.

DATASET:
Pima Indians Diabetes Dataset (diabetes_csv.csv)
- 768 instances (rows)
- 9 attributes (columns)
- Features used: Age (column 7) and BMI/Mass (column 5)

ALGORITHM:
K-Means Clustering - Partitions n observations into k clusters where each observation
belongs to the cluster with the nearest mean (centroid).

ELBOW METHOD:
Used to determine the optimal number of clusters by plotting WCSS (Within-Cluster Sum
of Squares) against the number of clusters. The "elbow" point indicates optimal k.

REQUIREMENTS:
- Python 3.x
- numpy
- pandas
- matplotlib
- scikit-learn

INSTALLATION:
pip install numpy pandas matplotlib scikit-learn

============================================================================================
"""

# ============================================================================================
# IMPORT REQUIRED LIBRARIES
# ============================================================================================

# Importing libraries
import numpy as np
import matplotlib.pyplot as mtp
import pandas as pd

# Import KMeans from scikit-learn
from sklearn.cluster import KMeans

# ============================================================================================
# STEP 1: LOAD AND PREPARE THE DATASET
# ============================================================================================
# Load the diabetes dataset and extract features for clustering

print("=" * 70)
print("K-MEANS CLUSTERING - PATIENT SEGMENTATION")
print("=" * 70)

# Importing the dataset
dataset = pd.read_csv('diabetes_csv.csv')

# Display basic information
print("\n[INFO] Dataset loaded successfully!")
print(f"[INFO] Dataset Shape: {dataset.shape[0]} rows × {dataset.shape[1]} columns")
print("\n[STEP 1] First 5 rows of the dataset:")
print(dataset.head())

# Extract features for clustering: Age (column 7) and BMI/Mass (column 5)
# Using columns 5 (mass/BMI) and 7 (age) for 2D visualization
x = dataset.iloc[:, [7, 5]].values  # Age and BMI

print(f"\n[INFO] Features extracted: Age (column 7) and BMI (column 5)")
print(f"[INFO] Feature matrix shape: {x.shape}")

# ============================================================================================
# STEP 2: ELBOW METHOD - FINDING OPTIMAL NUMBER OF CLUSTERS
# ============================================================================================
# The Elbow Method helps determine the optimal number of clusters
# by plotting WCSS (Within-Cluster Sum of Squares) vs number of clusters

print("\n[STEP 2] Finding optimal number of clusters using Elbow Method...")

# Initializing the list for the values of WCSS
wcss_list = []

# Using a loop for iterations from 1 to 10
for i in range(1, 11):
    kmeans = KMeans(n_clusters=i, init='k-means++', random_state=42)
    kmeans.fit(x)
    wcss_list.append(kmeans.inertia_)  # inertia_ is the WCSS value

print("[INFO] WCSS values calculated for k = 1 to 10")
print(f"[INFO] WCSS values: {[round(w, 2) for w in wcss_list]}")

# Plotting the Elbow Method Graph
mtp.figure(figsize=(10, 6))
mtp.plot(range(1, 11), wcss_list, marker='o', linestyle='-', color='blue')
mtp.title('The Elbow Method Graph')
mtp.xlabel('Number of clusters(k)')
mtp.ylabel('wcss_list')
mtp.grid(True)
mtp.savefig('elbow_method_graph.png', dpi=150, bbox_inches='tight')
mtp.show()

print("[INFO] Elbow graph saved as 'elbow_method_graph.png'")
print("[INFO] Based on the elbow graph, optimal number of clusters: 2")

# ============================================================================================
# STEP 3: TRAINING THE K-MEANS MODEL
# ============================================================================================
# Train K-Means model with optimal number of clusters (k=2)

print("\n[STEP 3] Training K-Means model with k=2 clusters...")

# Training the K-means model on a dataset
kmeans = KMeans(n_clusters=2, init='k-means++', random_state=42)
y_predict = kmeans.fit_predict(x)

print("[INFO] Model training completed!")
print(f"[INFO] Cluster labels assigned to {len(y_predict)} samples")
print(f"[INFO] Cluster distribution: Cluster 1 = {sum(y_predict == 0)}, Cluster 2 = {sum(y_predict == 1)}")

# ============================================================================================
# STEP 4: VISUALIZING THE CLUSTERS
# ============================================================================================
# Create scatter plot showing the two clusters with their centroids

print("\n[STEP 4] Visualizing clusters...")

# Create a new figure for cluster visualization
mtp.figure(figsize=(12, 8))

# Plot Cluster 1 (blue) - patients at index where y_predict == 0
mtp.scatter(x[y_predict == 0, 0], x[y_predict == 0, 1], 
            s=100, c='blue', label='Cluster 1')

# Plot Cluster 2 (green) - patients at index where y_predict == 1
mtp.scatter(x[y_predict == 1, 0], x[y_predict == 1, 1], 
            s=100, c='green', label='Cluster 2')

# Plot Centroids (yellow, larger markers)
mtp.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], 
            s=300, c='yellow', label='Centroid', edgecolors='black', linewidths=2)

# Add labels and title
mtp.title('Clusters of patients')
mtp.xlabel('Age(in years)')
mtp.ylabel('BMI(Body Mass Index)')
mtp.legend()
mtp.grid(True, alpha=0.3)
mtp.savefig('clusters_visualization.png', dpi=150, bbox_inches='tight')
mtp.show()

print("[INFO] Cluster visualization saved as 'clusters_visualization.png'")

# ============================================================================================
# STEP 5: DISPLAY CLUSTER CENTROIDS
# ============================================================================================
# Show the coordinates of cluster centers

print("\n[STEP 5] Cluster Centroids:")
print("-" * 40)
print(f"Cluster 1 Centroid: Age = {kmeans.cluster_centers_[0, 0]:.2f}, BMI = {kmeans.cluster_centers_[0, 1]:.2f}")
print(f"Cluster 2 Centroid: Age = {kmeans.cluster_centers_[1, 0]:.2f}, BMI = {kmeans.cluster_centers_[1, 1]:.2f}")

# ============================================================================================
# CONCLUSION
# ============================================================================================
print("\n" + "=" * 70)
print("EXPERIMENT COMPLETED SUCCESSFULLY!")
print("K-Means clustering successfully segmented patients into 2 groups")
print("based on Age and BMI characteristics.")
print("=" * 70)

"""
============================================================================================
EXPECTED OUTPUT:
============================================================================================
- Elbow Method Graph showing WCSS decreasing as k increases
- The "elbow" point at k=2 indicates optimal number of clusters
- Scatter plot showing two distinct clusters:
  - Cluster 1 (Blue): Younger patients with lower BMI
  - Cluster 2 (Green): Older patients with higher BMI
- Yellow centroids marking the center of each cluster

OBSERVATIONS:
1. K-Means partitions data based on distance to centroids
2. Elbow method helps identify optimal k value
3. k-means++ initialization provides better initial centroids
4. Visualization helps interpret cluster characteristics
============================================================================================
"""
