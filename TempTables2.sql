CREATE TABLE #Sales (
	OrderDate DATE,
	OrderMonth DATE,
	TotalDue MONEY,
	OrderRank INT
)


INSERT INTO #Sales (
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

CREATE TABLE #Top10Sales (
	OrderMonth DATE,
	TotalSales MONEY
)

INSERT INTO #Top10Sales (
	OrderMonth,
	TotalSales
)
SELECT
	OrderMonth,
	TotalSales = SUM(TotalDue)
FROM #Sales
WHERE OrderRank > 10
GROUP BY OrderMonth


CREATE TABLE #Purchase (
	OrderDate DATE,
	OrderMonth DATE,
	TotalDue MONEY,
	OrderRank INT
)


INSERT INTO #Purchase (
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

CREATE TABLE #Top10Purchase (
	OrderMonth DATE,
	TotalPurchases MONEY
)

INSERT INTO #Top10Purchase (
	OrderMonth,
	TotalPurchases
)

SELECT
	OrderMonth,
	TotalPurchases = SUM(TotalDue)
FROM  #Purchase
WHERE OrderRank > 10
GROUP BY OrderMonth


SELECT
	A.OrderMonth,
	A.TotalSales,
	B.TotalPurchases
FROM #Top10Sales A
INNER JOIN #Top10Purchase B
	ON A.OrderMonth = B.OrderMonth
ORDER BY 1

DROP TABLE #Sales
DROP TABLE #Purchase
DROP TABLE #Top10Purchase
DROP TABLE #Top10Sales