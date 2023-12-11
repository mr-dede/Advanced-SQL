ALTER PROCEDURE OrdersAboveThreshold(@Threshold INT, @StartYear INT, @EndYear INT, @OrderType INT)

AS

BEGIN
	IF @OrderType = 1
		BEGIN
			SELECT 
				SalesOrderID,
				OrderDate,
				TotalDue
			
			FROM Sales.SalesOrderHeader
			WHERE TotalDue > @Threshold
			AND YEAR(OrderDate) BETWEEN @StartYear AND @EndYear
		END
	ELSE 
		BEGIN
			SELECT 
				PurchaseOrderID,
				OrderDate,
				TotalDue
			
			FROM Purchasing.PurchaseOrderHeader
			WHERE TotalDue > @Threshold
			AND YEAR(OrderDate) BETWEEN @StartYear AND @EndYear
		END

END