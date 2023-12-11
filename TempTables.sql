SELECT 
		OrderDate
		,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
		,TotalDue
		,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
INTO #Sales
FROM Sales.SalesOrderHeader



SELECT
	OrderMonth,
	TotalSales = SUM(TotalDue)
INTO #Top10Sales
FROM #Sales
WHERE OrderRank > 10
GROUP BY OrderMonth



SELECT 
	OrderDate
	,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
	,TotalDue
	,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
INTO #Purchase
FROM Purchasing.PurchaseOrderHeader



SELECT
	OrderMonth,
	TotalPurchases = SUM(TotalDue)
INTO #Top10Purchase
FROM  #Purchase
WHERE OrderRank > 10
GROUP BY OrderMonth


SELECT
	A.OrderMonth,
	A.TotalSales,
	B.TotalPurchases
FROM #Top10Sales A
LEFT JOIN #Top10Purchase B
	ON A.OrderMonth = B.OrderMonth
ORDER BY 1

DROP TABLE #Sales
DROP TABLE #Purchase
DROP TABLE #Top10Purchase
DROP TABLE #Top10Sales