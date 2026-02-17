# 📊 Customer Churn Analytics Pipeline

An end-to-end data analytics project analyzing telecom customer churn to identify revenue leakage and high-risk customer segments using **Python**, **SQL Server**, and **Power BI**.

---

## 🔍 Project Objective

To analyze customer churn behavior, quantify revenue loss, and simulate data-driven retention strategies to reduce churn and improve profitability.

## 🏗 Architecture

**Raw CSV** ➔ **Python (Pandas)** Data Cleaning ➔ **SQL Server** (Views & Analytics) ➔ **Power BI Dashboard**

## 🧰 Tech Stack

* Data Processing: Python (Pandas, NumPy)
* Database: Microsoft SQL Server (SSMS)
* Visualization: Power BI Desktop
* Environment: Jupyter Notebooks

## 📌 Key Business Insights

* Overall Churn Rate: Identified a **26.57%** churn rate across the customer base.
* Revenue Impact: Quantified **$139K** in monthly revenue loss.
* Contract Risk: Month-to-Month contracts contribute to **~86%** of total revenue leakage.
* High-Value Churn: Identified **$25K** monthly loss from the top 25% high-value customers (CLV).
* Potential Recovery: Modeled a retention strategy projecting **$40K+** in monthly revenue recovery.

## 🗄 SQL Views Created

The following views were developed for the Power BI reporting layer:

* `Executive_Churn_Summary`: High-level KPIs.
* `Contract_Churn_Summary`: Analysis by contract type.
* `High_Value_Churn_Customers`: Segmented high-risk, high-value users.
* `Final_Churn_Dashboard_View`: Cleaned data for visualization.

## 📂 Project Structure

```text
customer-churn-analytics-pipeline/
├── data/
│   ├── raw_telco.csv          # Initial dataset
│   └── cleaned_telco.csv      # Processed dataset
├── scripts/
│   └── data_cleaning.ipynb    # Python notebook for ETL & EDA
├── sql/
│   ├── database_setup.sql     # Table creation scripts
│   ├── Understand_data.sql    # Exploratory SQL queries
│   └── views.sql              # Business logic views
├── dashboard/                 # Power BI project files
├── requirements.txt           # Python dependencies
└── README.md
```

## 🚀 How to Run

### 1. Prerequisites

* Install Python 3.x
* SQL Server & SSMS
* Power BI Desktop

### 2. Data Cleaning

1. Open `scripts/data_cleaning.ipynb` in Jupyter Notebook or VS Code.
2. Run all cells to process `raw_telco.csv`.
3. The script will export `cleaned_telco.csv` to the `data/` folder.

### 3. SQL Setup

1. Open **SSMS** and run `sql/database_setup.sql` to create the database and table.
2. Import `data/cleaned_telco.csv` into your SQL table using the **Import Flat File** wizard.
3. Execute `sql/views.sql` to generate the reporting views.

### 4. Visualization

1. Open **Power BI Desktop**.
2. Connect to your SQL Server instance.
3. Load the views (starting with `Executive_Churn_...`) and build your dashboard.
