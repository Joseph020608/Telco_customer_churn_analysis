# Telco customers churn analysis

## Project background
In this project, I acted as a Junior data analyst for a fictional telecommunications company facing a customer retention challenge.

**The Goal:** Analyze customer data to identify the key profile of user who cancel the service (churn) and quantify the financial impact to propose data_driven retention strategies.

## Dataset
The data used for this analysis is the "Telco customer churn" dataset, available on Kaggle, It contains information about:
* **Demographics:** Gender, Senior Citizens, Partners, Dependents.
* **Services:** Phone, Internet, Online Security, Streaming, etc.
* **Account info:** Tenure, Contract type, Payment method, Monthly charges.

## Tools used:
* **MySQL:** For data cleaning, type casting and exploratory data analysis (EDA)
* **Power BI:** For data visualization and dashboarding
* **SQL skills:** 'GROUP BY', 'CASE WHEN' (Segmentation), Aggregations ('SUM', 'COUNT', 'AVG') and Data Cleaning ('Null handling') 

## Key findings (Insights)
Through SQL analysis, three critical patterns emerged regarding customer churn:
## 1. The "Month-to-Month" trap
Contract type is the single strongest predictor of churn.
* **Month-to-Month Contracts:** Exhibit a **42.7%** churn rate.
* **Two-year contracts:** Have a negligible **2.8%** churn rate.
* **Financial Impact:** The company is losing **USD 120,847** monthly from month-to-month cancellation alone, compared just to **USD 4,100** from long-term contract cancellations.

## 2. The "Valley of Death" (First 6 months)
Customer tenure analysis reveals a critical vulnerability period at the start of the relationship.
* **0-6 months:** This segment accounts for the highest volume of churn (784 customers)
* **Survival insight:** Once a customer surpasses the 6-month mark, their likelihood of leaving by nearly **67%** (from 784 down to 253 in the 6-12 month bracket)

## 3. Overall Health
The global churn rate stands at **26.5%**. While 1 in 4 customers leaves, the revenue loss is heavily concentrated in the specific segments mentioned above, allowing for targeted solutions.

## Business recommendations

1. **Targeted "Survival" Onboarding:**
    * Launch a specialized communication and support plan for new customers during their first **180 days** (the critical 0-6 month window) to reduce early drop-offs

2. **Contract migration campaign:**
    * Offer a 10-15% discount or a service upgrade to "Month-to-Month" customers with healthy payment history if they switch to a **1-year contract**.
    * **Goal:** Moving just 20% of these users to yearly contracts could save the company estimated thousand in monthly recurring revenue (MRR)

## SQL code showcase

Here is an example of the SQL logic used to segment customer by tenure (identifying the "Valley of Death")

```sql
/* Query to categorize customers by tenure groups 
and calculate churn volume per group 
*/
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

