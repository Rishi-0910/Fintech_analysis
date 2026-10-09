SELECT 
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(loan_int_rate), 2) AS avg_loan_int_rate,
    ROUND(100.0 * COUNT(CASE WHEN loan_status = 1 THEN 1 END) / COUNT(*), 2) AS default_rate_pct
FROM `fintech-507512.Appected_loans.Credit_Risk`
WHERE loan_grade IS NOT NULL
GROUP BY loan_grade
ORDER BY loan_grade ASC;