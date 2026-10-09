
-- Default_Rate_by_Loan_Grade
SELECT
  loan_grade,
  COUNT(*) AS total_loans,
  SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
  ROUND(
    AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100,
    2
  ) AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_grade
ORDER BY default_rate_percentage DESC;


-- Default_Rate_by_Loan_Purpose

SELECT
  loan_intent,
  COUNT(*) AS total_loans,
  ROUND(
    AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100,
    2
  ) AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_intent
ORDER BY default_rate_percentage DESC;

-- Default_Rate_by_Home_Ownership

SELECT
  person_home_ownership,
  COUNT(*) AS total_loans,
  ROUND(
    AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100,
    2
  ) AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY person_home_ownership
ORDER BY default_rate_percentage DESC;