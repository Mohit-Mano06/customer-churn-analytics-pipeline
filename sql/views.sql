
-- Creating View --

DROP VIEW Executive_Churn_Summary;

CREATE VIEW Executive_Churn_Summary AS
SELECT 
	COUNT(*) AS Total_Customers,
	SUM(CAST(Churn_Flag AS INT)) AS Churned_Customers,
	ROUND(AVG(CAST(Churn_Flag AS FLOAT))*100, 2) AS Churn_Rate_Percentage,
	SUM(Revenue_Loss) AS Monthly_Revenue_Loss
FROM customers;


-- View -- 

SELECT * FROM Executive_Churn_Summary;



-- Contract Summary View --


DROP VIEW Contract_Churn_Summary;

CREATE VIEW Contract_Churn_Summary AS 
SELECT
	Contract,
	COUNT(*) AS Total_Customers,
	SUM(CAST(Churn_Flag AS INT)) AS Churned_Customers,
	ROUND(AVG(CAST(Churn_Flag AS FLOAT)) * 100, 2) AS Churn_Rate_Percentage,
	SUM(Revenue_Loss) AS Revenue_Lost,

	RANK() OVER(ORDER BY SUM(Revenue_Loss) DESC) AS Revenue_Risk_Rank

	FROM CUSTOMERS
	GROUP BY CONTRACT;


-- View -- 

SELECT * FROM Contract_Churn_Summary;




-- High Value Customers --


DROP VIEW High_Value_Churn_Customers;

ALTER VIEW High_Value_Churn_Customers AS
SELECT 
	customerID,
	Contract,
	tenure,
	MonthlyCharges,
	CLV,
	Revenue_Loss,
	Churn_Flag,

	NTILE(4) OVER (ORDER BY CLV DESC) AS CLV_Quartile

FROM customers;


-- View --
SELECT * FROM High_Value_Churn_Customers
WHERE CLV_Quartile = 1;



-- Revenue Lost from TOP 25% of Customers

SELECT	
	SUM(c.Revenue_Loss) AS High_Value_Revenue_Loss
FROM customers c
JOIN High_Value_Churn_Customers h
ON c.customerID = h.customerID
WHERE h.CLV_Quartile = 1;

-- Revenue Lost = $25270 --



-- Final View -- 

DROP VIEW Final_Churn_Dashboard_View;

CREATE VIEW Final_Churn_Dashboard_View AS
SELECT 
	Contract,
	CLV_Quartile,
	COUNT(*) AS Total_Customers,
	SUM(CAST(Churn_Flag AS INT)) AS Churned_Customers,
	ROUND(AVG(CAST(Churn_Flag AS FLOAT))* 100, 2) AS Churn_Rate_Percentage,
	SUM(Revenue_Loss) AS Revenue_Lost
FROM High_Value_Churn_Customers
GROUP BY Contract, CLV_Quartile;

SELECT * FROM Final_Churn_Dashboard_View