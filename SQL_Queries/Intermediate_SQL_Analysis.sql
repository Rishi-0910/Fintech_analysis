-- Default_Rate_by_Loan_Grade

SELECT
  loan_grade,
  COUNT(*) AS total_loans,
  SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
  ROUND(AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100, 2)
    AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_grade
ORDER BY default_rate_percentage DESC;




-- High_Default_Rate_by_Loan_Purpose

SELECT
  loan_intent,
  ROUND(AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100, 2)
    AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_intent
HAVING AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) >
(
  SELECT AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END)
  FROM `fintech-507512.credit_risk_dataset.Credit_risk`
)
ORDER BY default_rate_percentage DESC;




-- Loans_Above_Average_Amount

SELECT
  person_age,
  person_income,
  loan_amnt,
  loan_grade,
  loan_intent
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
WHERE loan_amnt >
(
  SELECT AVG(loan_amnt)
  FROM `fintech-507512.credit_risk_dataset.Credit_risk`
)
ORDER BY loan_amnt DESC
LIMIT 10;




-- Default_Rate_by_Home_Ownership

SELECT
  person_home_ownership,
  COUNT(*) AS total_loans,
  ROUND(AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100, 2)
    AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY person_home_ownership
ORDER BY default_rate_percentage DESC;




-- Default_Rate_by_Income_Group

SELECT
  CASE
    WHEN person_income < 25000 THEN 'Low Income'
    WHEN person_income < 50000 THEN 'Lower-Middle Income'
    WHEN person_income < 100000 THEN 'Upper-Middle Income'
    ELSE 'High Income'
  END AS income_group,
  COUNT(*) AS total_loans,
  ROUND(AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100, 2)
    AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY income_group
ORDER BY default_rate_percentage DESC;





-- Interest_Rate_by_Loan_Status

SELECT
  CASE
    WHEN loan_status = 1 THEN 'Defaulted'
    ELSE 'Non-defaulted'
  END AS loan_category,
  COUNT(*) AS total_loans,
  ROUND(AVG(loan_int_rate), 2) AS average_interest_rate
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_category;




-- Top_10_Percent_Largest_Loans

WITH RankedLoans AS (
  SELECT
    person_age,
    person_income,
    loan_amnt,
    loan_grade,
    loan_intent,
    PERCENT_RANK() OVER (ORDER BY loan_amnt DESC) AS loan_rank
  FROM `fintech-507512.credit_risk_dataset.Credit_risk`
)
SELECT *
FROM RankedLoans
WHERE loan_rank <= 0.10
ORDER BY loan_amnt DESC;



--  Loan_Amount_Distribution_by_Grade

SELECT
  loan_grade,
  SUM(loan_amnt) AS total_loan_amount,
  ROUND(
    SUM(loan_amnt) * 100.0 /
    SUM(SUM(loan_amnt)) OVER (),
    2
  ) AS percentage_of_total_loan_amount
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_grade
ORDER BY percentage_of_total_loan_amount DESC;

