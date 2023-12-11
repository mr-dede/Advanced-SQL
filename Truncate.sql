CREATE TABLE #Order (
	OrderDate DATE,
	OrderMonth DATE,
	TotalDue MONEY,
	OrderRank INT
)

CREATE TABLE #Top10 (
	OrderMonth DATE,
	OrderType VARCHAR(32),
	TotalSales MONEY
)


INSERT INTO #Order (
	OrderDate,
	OrderMonth,
	TotalDue,
	OrderRank
)

SELECT 
		OrderDate
		,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
		,TotalDue
		,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM Sales.SalesOrderHeader


INSERT INTO #Top10 (
	OrderMonth,
	OrderType,
	TotalSales
)
SELECT
	OrderMonth,
	OrderType = 'Sales',
	TotalSales = SUM(TotalDue)
FROM #Order
WHERE OrderRank > 10
GROUP BY OrderMonth


TRUNCATE TABLE #Order


INSERT INTO #Order (
	OrderDate,
	OrderMonth,
	TotalDue,
	OrderRank
)

SELECT 
	OrderDate
	,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
	,TotalDue
	,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM Purchasing.PurchaseOrderHeader


INSERT INTO #Top10 (
	OrderMonth,
	OrderType,
	TotalSales
)

SELECT
	OrderMonth,
	OrderType = 'Purchase',
	TotalSales = SUM(TotalDue)
FROM  #Order
WHERE OrderRank > 10
GROUP BY OrderMonth


SELECT
A.OrderMonth,
TotalSales = A.TotalSales,
TotalPurchases = B.TotalSales

FROM #Top10 A
	JOIN #Top10 B
		ON A.OrderMonth = B.OrderMonth
			AND B.OrderType = 'Purchase'

WHERE A.OrderType = 'Sales'

ORDER BY 1

DROP TABLE #Order
DROP TABLE #Top10