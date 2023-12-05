

--SELECT
--	a.PurchaseOrderID,
--	a.VendorID,
--	a.OrderDate,
--	a.TotalDue,
--	NonRejectedItems = (
--		(SELECT 
--			CASE
--				WHEN SUM(RejectedQty) IS NULL THEN 0
--				ELSE SUM(RejectedQty) END AS a
--		FROM Purchasing.PurchaseOrderDetail b
--		WHERE a.PurchaseOrderID = b.PurchaseOrderID
--		AND b.RejectedQty > 0
--		) 
--	) 
--FROM Purchasing.PurchaseOrderHeader a


SELECT
	a.PurchaseOrderID,
	a.VendorID,
	a.OrderDate,
	a.TotalDue,
	NonRejectedItems = (
		SELECT 
			CASE
				WHEN SUM(RejectedQty) IS NULL THEN 0
				ELSE SUM(RejectedQty) END AS a
		FROM Purchasing.PurchaseOrderDetail b
		WHERE a.PurchaseOrderID = b.PurchaseOrderID
		AND b.RejectedQty > 0

	),
	MostExpensiveItem = (
		SELECT MAX(c.UnitPrice) 
		FROM Purchasing.PurchaseOrderDetail c
		WHERE a.PurchaseOrderID = c.PurchaseOrderID
	)
FROM Purchasing.PurchaseOrderHeader a