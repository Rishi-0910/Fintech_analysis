-- Def_VS_NonDef

SELECT 
    loan_status,
    COUNT(*) AS Total_loans
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_status
ORDER BY loan_status;

-- default_rate_percentage Cal

SELECT
  ROUND(
    AVG(CASE WHEN loan_status = 1 THEN 1.0 ELSE 0.0 END) * 100,
    2
  ) AS default_rate_percentage
FROM `fintech-507512.credit_risk_dataset.Credit_risk`;

-- Avg Cal analysis

SELECT 
    loan_grade,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount,
    ROUND(AVG(person_income), 2) AS average_annual_income,
    ROUND(AVG(loan_int_rate), 2) AS average_interest_rate
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_grade
ORDER BY loan_grade;

--  Borrow count analysis

SELECT
  person_home_ownership,
  COUNT(*) AS borrower_count
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY person_home_ownership
ORDER BY borrower_count DESC;



-- Purpose of Loan analysis

SELECT
  loan_intent,
  COUNT(*) AS loan_count
FROM `fintech-507512.credit_risk_dataset.Credit_risk`
GROUP BY loan_intent
ORDER BY loan_count DESC;







