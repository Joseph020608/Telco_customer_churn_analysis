--  Identify # of churn customers
SELECT COUNT(*) AS churn_customers
FROM telco_churn_v2
WHERE churn = 'yes';

-- Percentage of churn customers
SELECT 
ROUND(
	(SUM(
		CASE 
			WHEN churn = 'yes' THEN 1 ELSE 0
			END)
            /COUNT(*))
            *100,
	2) AS churn_customers_perc
FROM telco_churn_v2;

-- churn rate per contract category
SELECT contract,
ROUND(
	(SUM(
		CASE 
			WHEN churn = 'yes' THEN 1 ELSE 0
			END)
            /COUNT(*))
            *100,
	2) AS churn_customers_perc
FROM telco_churn_v2
GROUP BY contract
ORDER BY churn_customers_perc;

-- lost money per contract category
SELECT contract,
ROUND(
	(SUM(
		CASE 
			WHEN churn = 'yes' THEN 1 ELSE 0
			END)
            /COUNT(*))
            *100,
	2) AS churn_customers_perc,
SUM(
	CASE
		WHEN churn = 'yes' THEN MonthlyCharges ELSE 0
	END
) AS Lost_money
FROM telco_churn_v2
GROUP BY contract
ORDER BY churn_customers_perc;

-- # of churn customer per tenure
SELECT 
CASE
	WHEN tenure <= 6 THEN '0-6 months'
    WHEN tenure <= 12 THEN '6-12 months'
    WHEN tenure <= 24 THEN '1-2 years'
    ELSE 'More than 2 years'
END AS tenure_level,
COUNT(*) AS number_of_customers
FROM telco_churn_v2
WHERE churn = 'yes'
GROUP BY tenure_level
ORDER BY number_of_customers DESC;