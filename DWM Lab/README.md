<!-- =========================================================================================
                                     HEADER SECTION
     ========================================================================================= -->
<div align="center">

  # Data Warehousing and Mining Lab

  ### CSL603 · Semester VI · Computer Engineering

  [![Curated by](https://img.shields.io/badge/Curated%20by-Amey%20Thakur-blue.svg)](https://github.com/Amey-Thakur)
  [![Documents](https://img.shields.io/badge/Documents-10-yellowgreen.svg)](#experiment-1-data-warehousing-introduction)
  [![Tools](https://img.shields.io/badge/Tools-WEKA%20%7C%20SQL-blueviolet.svg)](./)

  **A comprehensive collection of laboratory experiments for Data Warehousing and Mining, covering data warehouse design, OLAP operations, data preprocessing, classification, clustering, and association rule mining.**

  ---

  **[How to Use](#how-to-use)** &nbsp;·&nbsp; **[Learning Path](#learning-path)** &nbsp;·&nbsp; **[Experiment 1](#experiment-1-data-warehousing-introduction)** &nbsp;·&nbsp; **[Experiment 2](#experiment-2-star--snowflake-schemas)** &nbsp;·&nbsp; **[Experiment 3](#experiment-3-olap-operations)** &nbsp;·&nbsp; **[Experiment 4](#experiment-4-data-preprocessing)** &nbsp;·&nbsp; **[Experiment 5](#experiment-5-decision-tree-classification)** &nbsp;·&nbsp; **[Experiment 6](#experiment-6-naive-bayes-classification)** &nbsp;·&nbsp; **[Experiment 7](#experiment-7-k-means-clustering)** &nbsp;·&nbsp; **[Experiment 8](#experiment-8-hierarchical-clustering)** &nbsp;·&nbsp; **[Experiment 9](#experiment-9-apriori-algorithm)** &nbsp;·&nbsp; **[Experiment 10](#experiment-10-advanced-data-mining)**

</div>

---

> [!TIP]
> **WEKA Guide**: When using WEKA for data mining experiments, always preprocess your dataset first. Use the "Preprocess" tab to load data, handle missing values, and apply filters. For classification experiments, ensure your class attribute is properly set using the dropdown at the bottom of the Preprocess panel.

> [!WARNING]
> **Dataset Format**: WEKA requires datasets in ARFF (Attribute-Relation File Format) or CSV format. Ensure your CSV files have proper headers and no missing delimiters. For SQL-based experiments, verify your database connection and table structures before running queries.

---

<!-- =========================================================================================
                                     HOW TO USE SECTION
     ========================================================================================= -->
## How to Use

### Viewing Reports
1. **Navigate** to the desired experiment section.
2. **Click** the "View" link for PDF format or "Download" for DOCX format.
3. **PDF files** can be viewed directly in the browser.
4. **DOCX files** require Microsoft Word or compatible software.

### Using WEKA
1. **Download** WEKA from the official website.
2. **Load** the provided CSV files from the `Excel Files` folder.
3. **Follow** the experiment instructions for each algorithm.

### Excel Files
Sample datasets for data mining experiments:

| # | Dataset | Description |
|:-:|:---|:---|
| 1 | [age_bmi.csv](Excel%20Files/age_bmi.csv) | Age and BMI data for regression analysis |
| 2 | [car.csv](Excel%20Files/car.csv) | Car dataset for classification |
| 3 | [diabetes_csv.csv](Excel%20Files/diabetes_csv.csv) | Diabetes dataset for classification |
| 4 | [hardware.csv](Excel%20Files/hardware.csv) | Hardware dataset for analysis |

---

<!-- =========================================================================================
                                     LEARNING PATH SECTION
     ========================================================================================= -->
## Learning Path

**Data Warehousing Fundamentals:**
- Start with **Experiment 1** to understand data warehousing concepts and architecture.
- Practice **Experiments 2 & 3** for schema design (Star, Snowflake) and OLAP operations.

**Data Preprocessing:**
- Explore **Experiment 4** to master data cleaning, transformation, and normalization techniques.

**Classification Techniques:**
- Study **Experiments 5 & 6** for Decision Tree and Naive Bayes classification algorithms.

**Clustering & Association:**
- Complete **Experiments 7 & 8** for K-Means and Hierarchical clustering.
- Master **Experiments 9 & 10** for Association Rule Mining (Apriori) and advanced techniques.

---

<!-- =========================================================================================
                                     EXPERIMENT 1
     ========================================================================================= -->
## Experiment 1: Star Schema for E-Commerce Data Warehouse

Design a Data Warehouse for an e-commerce website using Star Schema and perform analytical processing.

**Date:** February 02, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | Star_Schema_ECommerce.sql | SQL implementation of Star Schema with SALES fact table and dimensions | [View](Experiment-1/Star_Schema_ECommerce.sql) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-1/Amey_B-50_DWM_Lab_Experiment-1.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-1/Amey_B-50_DWM_Lab_Experiment-1.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 2
     ========================================================================================= -->
## Experiment 2: Dimension Tables and Fact Table Implementation

Implementation of all dimension tables and fact tables related to the e-commerce case study.

**Date:** February 02, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | Dimension_Fact_Tables.sql | SQL implementation of CUSTOMER, PRODUCT, STORE, SALESPERSON dimensions and PRODUCTSALES fact table | [View](Experiment-2/Dimension_Fact_Tables.sql) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-2/Amey_B-50_DWM_Lab_Experiment-2.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-2/Amey_B-50_DWM_Lab_Experiment-2.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 3
     ========================================================================================= -->
## Experiment 3: OLAP Operations Implementation

Implementation of OLAP operations (Roll-up, Drill-down, Slice, Dice) in SQL Environment.

**Date:** March 23, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | OLAP_Operations.sql | SQL implementation of OLAP operations with 8 sample records | [View](Experiment-3/OLAP_Operations.sql) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-3/Amey_B-50_DWM_Lab_Experiment-3.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-3/Amey_B-50_DWM_Lab_Experiment-3.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 4
     ========================================================================================= -->
## Experiment 4: Decision Tree Classification using J-48

Implementation of Decision Tree Algorithm using J-48 in WEKA tool with Iris dataset.

**Date:** April 10, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | iris_decision_tree.arff | Iris dataset (150 instances) for J48 classification in WEKA | [View](Experiment-4/iris_decision_tree.arff) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-4/Amey_B-50_DWM_Lab_Experiment-4.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-4/Amey_B-50_DWM_Lab_Experiment-4.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 5
     ========================================================================================= -->
## Experiment 5: Naive Bayes Classification using Python

Implementation of Gaussian Naive Bayes Algorithm using Python (scikit-learn) with Diabetes dataset.

**Date:** April 15, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | naive_bayes_classification.py | Python implementation with GaussianNB (76.6% accuracy) | [View](Experiment-5/naive_bayes_classification.py) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-5/Amey_B-50_DWM_Lab_Experiment-5.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-5/Amey_B-50_DWM_Lab_Experiment-5.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 6
     ========================================================================================= -->
## Experiment 6: K-Means Clustering using Python

Implementation of K-Means Clustering using Python (scikit-learn) with Elbow Method.

**Date:** April 15, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | kmeans_clustering.py | Python implementation with Elbow Method and 2 clusters | [View](Experiment-6/kmeans_clustering.py) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-6/Amey_B-50_DWM_Lab_Experiment-6.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-6/Amey_B-50_DWM_Lab_Experiment-6.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 7
     ========================================================================================= -->
## Experiment 7: Hierarchical Clustering using Python

Implementation of Agglomerative Hierarchical Clustering using Python (scikit-learn) with Dendrogram.

**Date:** April 15, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | hierarchical_clustering.py | Python implementation with Dendrogram and cluster visualization | [View](Experiment-7/hierarchical_clustering.py) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-7/Amey_B-50_DWM_Lab_Experiment-7.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-7/Amey_B-50_DWM_Lab_Experiment-7.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 8
     ========================================================================================= -->
## Experiment 8: Hierarchical Clustering

Hierarchical clustering techniques in WEKA.

| # | Document | Description | Link |
|:-:|:---|:---|:-:|
| 1 | Lab Report (PDF) | Detailed experiment report | [View](Amey_B-50_DWM_Lab_Experiment-8.pdf) |
| 2 | Lab Report (DOCX) | Editable report file | [Download](Amey_B-50_DWM_Lab_Experiment-8.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 9
     ========================================================================================= -->
## Experiment 9: Apriori Algorithm

Association rule mining using Apriori algorithm in WEKA.

| # | Document | Description | Link |
|:-:|:---|:---|:-:|
| 1 | Lab Report (PDF) | Detailed experiment report | [View](Amey_B-50_DWM_Lab_Experiment-9.pdf) |
| 2 | Lab Report (DOCX) | Editable report file | [Download](Amey_B-50_DWM_Lab_Experiment-9.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 10
     ========================================================================================= -->
## Experiment 10: Advanced Data Mining

Advanced data mining techniques and visualization.

| # | Document | Description | Link |
|:-:|:---|:---|:-:|
| 1 | Lab Report (PDF) | Detailed experiment report | [View](Amey_B-50_DWM_Lab_Experiment-10.pdf) |
| 2 | Lab Report (DOCX) | Editable report file | [Download](Amey_B-50_DWM_Lab_Experiment-10.docx) |

---

<!-- =========================================================================================
                                     FOOTER SECTION
     ========================================================================================= -->
<div align="center">

  <!-- Footer Navigation -->
  **[↑ Back to Top](#data-warehousing-and-mining-lab)**

  **[How to Use](#how-to-use)** &nbsp;·&nbsp; **[Learning Path](#learning-path)** &nbsp;·&nbsp; **[Experiment 1](#experiment-1-data-warehousing-introduction)** &nbsp;·&nbsp; **[Experiment 2](#experiment-2-star--snowflake-schemas)** &nbsp;·&nbsp; **[Experiment 3](#experiment-3-olap-operations)** &nbsp;·&nbsp; **[Experiment 4](#experiment-4-data-preprocessing)** &nbsp;·&nbsp; **[Experiment 5](#experiment-5-decision-tree-classification)** &nbsp;·&nbsp; **[Experiment 6](#experiment-6-naive-bayes-classification)** &nbsp;·&nbsp; **[Experiment 7](#experiment-7-k-means-clustering)** &nbsp;·&nbsp; **[Experiment 8](#experiment-8-hierarchical-clustering)** &nbsp;·&nbsp; **[Experiment 9](#experiment-9-apriori-algorithm)** &nbsp;·&nbsp; **[Experiment 10](#experiment-10-advanced-data-mining)**

  <br>

  **[🏠 Back to Main Repository](../)**

</div>

---

<div align="center">

  ***[Data Warehousing and Mining and Data Warehousing and Mining Lab](https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB)***

  **CSL603 · Semester VI · Computer Engineering**

  *University of Mumbai · Curated by [Amey Thakur](https://github.com/Amey-Thakur)*

</div>
