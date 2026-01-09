-- Database creation
CREATE DATABASE telco_churn_analysis;

-- total row count
SELECT COUNT(*) FROM telco_churn;

-- Test to convert data type colum from text to number
SELECT customerID,
	CAST(tenure AS UNSIGNED) AS tenure_num,
    CAST(MonthlyCharges AS DECIMAL(10,2)) AS monthly_num
FROM telco_churn
LIMIT 10;

-- Creation of the table with correct colum data types and verifying the number of columns
DROP TABLE IF EXISTS telco_churn_V2;

CREATE TABLE telco_churn_V2 AS
SELECT 
	customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    CAST(tenure AS UNSIGNED) AS tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    CAST(MonthlyCharges AS DECIMAL(10,2)) AS MonthlyCharges,
    CAST(IF(TotalCharges = ' ', 0, TotalCharges) AS DECIMAL(10,2)) AS TotalCharges,
    Churn
FROM telco_churn;

SELECT COUNT(*) FROM telco_churn_V2;