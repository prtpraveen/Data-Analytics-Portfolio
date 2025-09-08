1. How many customers have churned?
SELECT COUNT(*) AS churned_customers
FROM telecom_churn
WHERE churn = 'Yes';
2. Churn Rate by Contract Type
SELECT 
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY contract
ORDER BY churn_rate_percentage DESC;
3. Average Monthly Charges: Churned vs Not Churned
SELECT 
    churn,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM telecom_churn
GROUP BY churn;
4. Tenure Distribution by Churn
SELECT 
    churn,
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM telecom_churn
GROUP BY churn;
5. Churn Rate by Internet Service Type
SELECT 
    internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY internet_service
ORDER BY churn_rate_percentage DESC;

