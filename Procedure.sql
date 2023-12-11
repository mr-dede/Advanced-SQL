CREATE PROCEDURE OrdersAboveThreshold(@Threshold INT, @StartYear INT, @EndYear INT)

AS

BEGIN
	SELECT 
		SalesOrderID,
		OrderDate,
		TotalDue
			
	FROM Sales.SalesOrderHeader
	WHERE TotalDue > @Threshold
	AND YEAR(OrderDate) BETWEEN @StartYear AND @EndYear

END

EXECUTE OrdersAboveThreshold 1000, 2011, 2012