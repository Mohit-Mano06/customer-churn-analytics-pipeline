# 📊 Customer Churn Analytics Pipeline

An end-to-end data analytics project analyzing telecom customer churn to identify revenue leakage and high-risk customer segments using **Python**, **SQL Server**, and **Power BI**.

---

## 🔍 Project Objective

To analyze customer churn behavior, quantify revenue loss, and simulate data-driven retention strategies to reduce churn and improve profitability.

## 🏗 Architecture

**Raw CSV** ➔ **Python (Pandas)** Data Cleaning ➔ **SQL Server** (Views & Analytics) ➔ **Power BI Dashboard**

## 🧰 Tech Stack

* **Data Processing:** Python (Pandas, NumPy)
* **Database:** Microsoft SQL Server (SSMS)
* **Visualization:** Power BI Desktop
* **Environment:** Jupyter Notebooks / VS Code

## 📌 Key Business Insights

* **Overall Churn Rate:** Identified a **26.57%** churn rate across the customer base.
* **Revenue Impact:** Quantified **$139K** in monthly revenue loss.
* **Contract Risk:** Month-to-Month contracts contribute to **~86%** of total revenue leakage.
* **High-Value Churn:** Identified **$25K** monthly loss from the top 25% high-value customers (CLV).
* **Potential Recovery:** Modeled a retention strategy projecting **$40K+** in monthly revenue recovery.

## 🗄 SQL Views Created

The following views were developed for the Power BI reporting layer:

* `Executive_Churn_Summary`: High-level KPIs.
* `Contract_Churn_Summary`: Analysis by contract type.
* `High_Value_Churn_Customers`: Segmented high-risk, high-value users.
* `Final_Churn_Dashboard_View`: Cleaned data for visualization.

## 📂 Project Structure

```text
customer-churn-analytics-pipeline/
├── dashboard/
│   └── dashboard.pbix         # Power BI project file
├── data/
│   ├── raw_telco.csv          # Initial dataset
│   └── cleaned_telco.csv      # Processed dataset (Generated)
├── scripts/
│   └── data_cleaning.ipynb    # Python notebook for ETL & EDA
├── sql/
│   ├── database_setup.sql     # Database & Table creation scripts
│   ├── Understand_data.sql    # Exploratory SQL queries
│   └── views.sql              # Business logic views
├── requirements.txt           # Python dependencies
└── README.md
```

## 🚀 How to Run

### 1. Prerequisites

* Python 3.x installed.
* Microsoft SQL Server & SQL Server Management Studio (SSMS).
* Power BI Desktop.

### 2. Environment Setup

Clone the repository and install the required Python libraries:

```bash
git clone https://github.com/Mohit-Mano06/customer-churn-analytics-pipeline.git
cd customer-churn-analytics-pipeline
pip install -r requirements.txt
```

### 3. Data Cleaning (ETL)

1. Open `scripts/data_cleaning.ipynb` in Jupyter Notebook.
2. Run all cells to process `raw_telco.csv`.
3. The script will clean the data and export `cleaned_telco.csv` to the `data/` folder.

### 4. SQL Database Setup

1. Open **SSMS** and connect to your SQL Server instance.
2. Execute `sql/database_setup.sql` to create the `TelcoAnalyticsDB` database.
3. Import `data/cleaned_telco.csv` into a table named `stg_Churn` (or as specified in script) using the **Import Flat File** wizard.
4. Execute `sql/views.sql` to generate the reporting views.

### 5. Visualization

1. Open `dashboard/dashboard.pbix` in **Power BI Desktop**.
2. Go to **Transform Data** > **Data Source Settings** to point the connection to your local SQL Server.
3. Refresh the data to populate the dashboard.

---

## 📊 Dashboard Highlights

The Power BI dashboard provides an executive-level view of churn performance and revenue risk segmentation.

### 🔹 KPI Metrics

* **Total Customers:** Overall count of active & churned users.
* **Churn Rate (%):** Percentage of customers who left.
* **Monthly Revenue Loss:** Current impact of churned customers.
* **Projected Annual Revenue Loss:** Estimated yearly impact if trends continue.

### 🔹 Analysis Segments

* **Contract Risk Analysis:** Comparison of revenue leakage between Month-to-Month, One Year, and Two Year contracts.
* **Customer Value Segmentation:** Identification of high-value revenue leakage using CLV (Customer Lifetime Value) quartiles.

### 🔹 Key Business Insight

> **Month-to-month contracts contribute ~86% of total revenue leakage with a 42.7% churn rate.**
> A simulated retention strategy converting 50% of these to annual contracts could recover **~$40K monthly**.

---
*Developed by [Mohit Mano](https://github.com/Mohit-Mano06)*
