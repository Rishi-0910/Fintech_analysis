# Fintech_analysis

# FinTech Credit Risk Analysis

An end-to-end data analytics project exploring loan applications, borrower profiles, and credit default risk using Python, SQL, Google BigQuery, and Power BI.

## Project Overview

The goal is to analyze lending data, identify patterns associated with loan defaults, and communicate insights that may support credit-risk monitoring and decision-making.

This project explores:
- Loan application volume and loan status
- Borrower income and home ownership
- Loan purpose and loan grade
- Loan amounts and interest rates
- Observed default rates across loan and borrower segments

> **Important:** This is descriptive analysis, not a validated credit-scoring model. Observed relationships do not establish causation.

## Tools & Technologies

- **Python** — data cleaning and exploratory data analysis (EDA)
- **Pandas** — data manipulation
- **Jupyter Notebook** — analysis workflow
- **SQL** — aggregation, segmentation, and business analysis
- **Google BigQuery** — cloud data storage and SQL queries
- **Power BI** — dashboarding and visualization (in progress)

## Dataset

The dataset includes borrower and loan attributes:

| Column | Description |
|---|---|
| `person_age` | Borrower's age |
| `person_income` | Borrower's income |
| `person_home_ownership` | Home ownership category |
| `person_emp_length` | Employment length |
| `loan_intent` | Stated loan purpose |
| `loan_grade` | Loan grade |
| `loan_amnt` | Loan amount |
| `loan_int_rate` | Loan interest rate |
| `loan_status` | Loan outcome/status; verify the exact encoding in the source documentation |
| `loan_percent_income` | Loan amount as a proportion of income |
| `cb_person_default_on_file` | Historical credit-bureau default indicator |
| `cb_person_cred_hist_length` | Length of credit history |

Keep the raw dataset unchanged and use the cleaned dataset for analysis.

## Project Workflow

1. **Data cleaning:** inspect data types, missing values, and data quality using Pandas.
2. **Exploratory data analysis:** review distributions, summary statistics, and patterns in borrower and loan attributes.
3. **BigQuery setup:** upload the cleaned dataset to Google BigQuery.
4. **SQL analysis:** calculate metrics and compare default patterns across segments.
5. **Power BI dashboard:** build KPI cards and visuals to present the findings.
6. **Documentation:** record the methodology, queries, assumptions, and final insights.

## Business Questions

- How many loan applications are in the dataset?
- What is the observed default rate?
- How do default rates vary by loan grade?
- Which loan purposes have higher observed default rates?
- How do default rates differ by home ownership category?
- How do loan amounts and interest rates vary by grade or status?
- How does loan amount relative to income relate to observed default patterns?

## SQL Analysis

The SQL work is organized into three files:

- `01_Basic_SQL_Analysis.sql` — application counts, average loan amount and income, home ownership counts, loan purpose counts, and average interest rate by grade.
- `02_Intermediate_SQL_Analysis.sql` — segmented default rates, income/home ownership comparisons, above-average loan amounts, and loan amount distribution by grade.
- `03_SQL_Business_Insights.sql` — default-rate comparisons by loan grade, loan purpose, and home ownership.

The BigQuery table used in the analysis is:

```sql
`fintech-507512.credit_risk_dataset.Credit_risk`
```

## Repository Structure

```text
FinTech/
├── Dataset/
│   ├── RawDataset/
│   └── CleanDataset/
├── Notebooks/
│   ├── basic_info.ipynb
│   └── EDA.ipynb
├── 01_Basic_SQL_Analysis.sql
├── 02_Intermediate_SQL_Analysis.sql
├── 03_SQL_Business_Insights.sql
└── README.md
```

Update the file names and folder tree if your GitHub repository differs.

## Key Metrics

- Total loan applications
- Number of applications in each loan-status category
- Observed default rate
- Average loan amount
- Average borrower income
- Average interest rate
- Default rate by loan grade
- Default rate by loan purpose
- Default rate by home ownership

Confirm the meaning and encoding of `loan_status` against the dataset documentation before publishing calculated rates.

## Project Status

- [x] Data inspection and cleaning
- [x] Exploratory data analysis notebook
- [x] Cleaned data uploaded to BigQuery
- [x] Basic and intermediate SQL analysis
- [x] Business-insight SQL queries
- [ ] Power BI dashboard and final visual findings
- [ ] Final screenshots and results

## How to Explore

1. Clone or download the repository.
2. Review the notebooks in `Notebooks/`.
3. Review the SQL files and update the BigQuery table reference if needed.
4. Inspect the cleaned dataset.
5. Open the Power BI report after the dashboard is completed.

## Future Improvements

- Create an interactive Power BI dashboard with filters for loan grade, loan purpose, and home ownership.
- Add verified numerical findings and chart screenshots.
- Document data assumptions and validation checks.
- Consider a baseline predictive model as a separate extension with appropriate evaluation.

## Author

**Palakala Rishik Reddy**

Data analytics portfolio project.
