WITH Sales AS (
	SELECT 
		   OrderDate
		  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
		  ,TotalDue
		  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
	FROM Sales.SalesOrderHeader
),

Top10Sales AS (
	SELECT
		OrderMonth,
		TotalSales = SUM(TotalDue)
	FROM Sales
	WHERE OrderRank > 10
	GROUP BY OrderMonth
),

Purchase AS (
	SELECT 
		   OrderDate
		  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
		  ,TotalDue
		  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
		FROM Purchasing.PurchaseOrderHeader
),

Top10Purchase AS (
	SELECT
		OrderMonth,
		TotalPurchases = SUM(TotalDue)
	FROM  Purchase
	WHERE OrderRank > 10
	GROUP BY OrderMonth
)

SELECT
	A.OrderMonth,
	A.TotalSales,
	B.TotalPurchases
FROM Top10Sales A
INNER JOIN Top10Purchase B
	ON A.OrderMonth = B.OrderMonth
ORDER BY 1


