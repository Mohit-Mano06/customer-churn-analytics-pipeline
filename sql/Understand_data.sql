-- Calculating Churn Rate in SQL --

select 
	COUNT(*) AS Total_Customers,
	SUM(CAST(Churn_Flag as INT)) as Churned_Customers,
	ROUND(AVG(CAST(Churn_Flag as FLOAT))*100,2) AS Churn_Rate_Percentage
	FROM CUSTOMERS;


-- Monthly Revenue Lost --

SELECT 
	SUM(Revenue_Loss) as Monthly_Revenue_Loss
	FROM CUSTOMERS;


-- Which Contract causes Highest Churn --

SELECT 
	Contract,
	COUNT(*) AS Total_Customers,
	SUM(CAST(Churn_Flag as INT)) AS Churned_Customers,
	ROUND(AVG(CAST(Churn_Flag as FLOAT)) * 100, 2) AS Churn_Rate_Percentage
	FROM CUSTOMERS
	GROUP BY Contract
	ORDER BY Churn_Rate_Percentage DESC;

-- Revenue Loss by Contract Type --

SELECT 
	Contract,
	COUNT(*) AS Total_Customers,
	SUM(CAST(Churn_Flag as INT)) AS Churned_Customers,
	ROUND(AVG(CAST(Churn_Flag as FLOAT)) * 100, 2) AS Churn_Rate_Percentage,
	SUM(Revenue_Loss) as Revenue_Lost,
	ROUND(
		(SUM(Revenue_Loss)* 100.0 / SUM(SUM(Revenue_Loss)) OVER()), 2) as Percentage_of_Total_LOSS

	FROM CUSTOMERS
	GROUP BY Contract
	ORDER BY Revenue_Lost desc;


-- Which Contract type is most risky? --

SELECT 
	Contract,
	SUM(Revenue_Loss) AS Revenue_Lost,

	RANK() OVER (ORDER BY SUM(Revenue_Loss) DESC) AS Revenue_Risk_Rank
	FROM CUSTOMERS
	GROUP BY CONTRACT;