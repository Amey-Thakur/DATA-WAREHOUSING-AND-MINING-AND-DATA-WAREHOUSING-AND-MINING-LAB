<!-- =========================================================================================
                                     HEADER SECTION
     ========================================================================================= -->
<div align="center">

  # Data Warehousing and Mining Lab

  ### CSL603 · Semester VI · Computer Engineering

  [![Curated by](https://img.shields.io/badge/Curated%20by-Amey%20Thakur-blue.svg)](https://github.com/Amey-Thakur)
  [![Documents](https://img.shields.io/badge/Documents-10-yellow.svg)](#experiment-1-star-schema-for-e-commerce-data-warehouse)
  [![Tools](https://img.shields.io/badge/Tools-WEKA%20%7C%20SQL-blueviolet.svg)](./)

  **A comprehensive collection of laboratory experiments for Data Warehousing and Mining, covering data warehouse design, OLAP operations, data preprocessing, classification, clustering, and association rule mining.**

  ---

  **[How to Use](#how-to-use)** &nbsp;·&nbsp; **[Learning Path](#learning-path)** &nbsp;·&nbsp; **[Experiment 1](#experiment-1-star-schema-for-e-commerce-data-warehouse)** &nbsp;·&nbsp; **[Experiment 2](#experiment-2-dimension-tables-and-fact-table-implementation)** &nbsp;·&nbsp; **[Experiment 3](#experiment-3-olap-operations-implementation)** &nbsp;·&nbsp; **[Experiment 4](#experiment-4-decision-tree-classification-using-j-48)** &nbsp;·&nbsp; **[Experiment 5](#experiment-5-naive-bayes-classification-using-python)** &nbsp;·&nbsp; **[Experiment 6](#experiment-6-k-means-clustering-using-python)** &nbsp;·&nbsp; **[Experiment 7](#experiment-7-hierarchical-clustering-using-python)** &nbsp;·&nbsp; **[Experiment 8](#experiment-8-association-pattern-mining)** &nbsp;·&nbsp; **[Experiment 9](#experiment-9-apriori-algorithm-using-weka)** &nbsp;·&nbsp; **[Experiment 10](#experiment-10-web-mining-and-spatial-data-mining)**

</div>

---

> [!TIP]
> **Lab Environment**: Ensure you have **Python 3.x** installed with libraries like `pandas`, `numpy`, `matplotlib`, and `scikit-learn`. For WEKA experiments, verify that your datasets are in valid ARFF format.

> [!WARNING]
> **Path Dependencies**: When running scripts, ensure the dataset files (e.g., `car.csv`, `age_bmi.csv`) are in the same directory as the script or update the file paths in the code accordingly.

---

<!-- =========================================================================================
                                     HOW TO USE SECTION
     ========================================================================================= -->
## How to Use

### Running Experiments
1.  **Navigate** to the specific experiment folder (e.g., `Experiment-1`).
2.  **Review** the source code header for requirements and usage instructions.
3.  **Execute** the script:
    -   **Python**: `python filename.py`
    -   **Java**: `javac Filename.java` then `java Filename`
    -   **SQL**: Import into your SQL environment (e.g., MySQL Workbench).

### Using WEKA
1.  **Open** WEKA GUI Chooser > Explorer.
2.  **Load** the `.arff` file provided in the experiment folder.
3.  **Select** the appropriate algorithm (Filter/Classifier/Clusterer/Associator) as per the lab instructions.

---

<!-- =========================================================================================
                                     LEARNING PATH SECTION
     ========================================================================================= -->
## Learning Path

**1. Data Warehousing Core**
-   Start with **Experiment 1 (Star Schema)** and **Experiment 2 (Dimensions/Facts)** to understand DW design.
-   Proceed to **Experiment 3 (OLAP)** to master multidimensional data analysis.

**2. Data Mining Algorithms**
-   **Classification**: Learn Decision Trees (**Experiment 4**) and Naive Bayes (**Experiment 5**).
-   **Clustering**: Understand grouping with K-Means (**Experiment 6**) and Hierarchical Clustering (**Experiment 7**).
-   **Association**: Efficient pattern discovery with Apriori & FP-Growth (**Experiment 8, 9**).

**3. Advanced Topics**
-   Explore modern applications in **Experiment 10 (Web & Spatial Mining)**.

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
## Experiment 8: Association Pattern Mining

Implementation of Association Mining (FPM) Algorithm using Python and Java.

**Date:** April 28, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | association_rule_mining.py | Python implementation of Apriori Algorithm with `car.csv` | [View](Experiment-8/association_rule_mining.py) |
| 2 | FPM.java | Java implementation of Frequent Pattern Mining | [View](Experiment-8/FPM.java) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-8/Amey_B-50_DWM_Lab_Experiment-8.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-8/Amey_B-50_DWM_Lab_Experiment-8.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 9
     ========================================================================================= -->
## Experiment 9: Apriori Algorithm using WEKA

Study and implementation of Apriori Algorithm using WEKA tool for Association Rule Mining.

**Date:** April 28, 2021

| # | Program | Description | Source Code |
|:-:|:---|:---|:-:|
| 1 | car.arff | Car Configuration dataset for Apriori algorithm | [View](Experiment-9/car.arff) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-9/Amey_B-50_DWM_Lab_Experiment-9.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-9/Amey_B-50_DWM_Lab_Experiment-9.docx) |

---

<!-- =========================================================================================
                                     EXPERIMENT 10
     ========================================================================================= -->
## Experiment 10: Web Mining and Spatial Data Mining

Study of complex Data Types used in Web mining and Spatial Mining Applications.

**Date:** April 28, 2021

| # | Program | Description | Study Notes |
|:-:|:---|:---|:-:|
| 1 | web_spatial_mining_study.txt | Theoretical study of Web & Spatial Mining applications | [View](Experiment-10/web_spatial_mining_study.txt) |
| — | Lab Report (PDF) | Detailed experiment report | [View](Experiment-10/Amey_B-50_DWM_Lab_Experiment-10.pdf) |
| — | Lab Report (DOCX) | Editable report file | [Download](Experiment-10/Amey_B-50_DWM_Lab_Experiment-10.docx) |

---

<!-- =========================================================================================
                                     FOOTER SECTION
     ========================================================================================= -->
<div align="center">

  <!-- Footer Navigation -->
  **[↑ Back to Top](#data-warehousing-and-mining-lab)**

  **[How to Use](#how-to-use)** &nbsp;·&nbsp; **[Learning Path](#learning-path)** &nbsp;·&nbsp; **[Experiment 1](#experiment-1-star-schema-for-e-commerce-data-warehouse)** &nbsp;·&nbsp; **[Experiment 2](#experiment-2-dimension-tables-and-fact-table-implementation)** &nbsp;·&nbsp; **[Experiment 3](#experiment-3-olap-operations-implementation)** &nbsp;·&nbsp; **[Experiment 4](#experiment-4-decision-tree-classification-using-j-48)** &nbsp;·&nbsp; **[Experiment 5](#experiment-5-naive-bayes-classification-using-python)** &nbsp;·&nbsp; **[Experiment 6](#experiment-6-k-means-clustering-using-python)** &nbsp;·&nbsp; **[Experiment 7](#experiment-7-hierarchical-clustering-using-python)** &nbsp;·&nbsp; **[Experiment 8](#experiment-8-association-pattern-mining)** &nbsp;·&nbsp; **[Experiment 9](#experiment-9-apriori-algorithm-using-weka)** &nbsp;·&nbsp; **[Experiment 10](#experiment-10-web-mining-and-spatial-data-mining)**

  <br>

  **[🏠 Back to Main Repository](../)**

</div>

---

<div align="center">

  ### [Data Warehousing and Mining and Data Warehousing and Mining Lab](https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB)

  **CSL603 · Semester VI · Computer Engineering**

  *University of Mumbai · Curated by [Amey Thakur](https://github.com/Amey-Thakur)*

</div>
