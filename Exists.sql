


--SELECT
--	PurchaseOrderID,
--	OrderDate,
--	SubTotal,
--	TaxAmt
--FROM Purchasing.PurchaseOrderHeader a
--WHERE EXISTS (
--	SELECT 1
--	FROM Purchasing.PurchaseOrderDetail b
--	WHERE a.PurchaseOrderID = b.PurchaseOrderID
--	AND b.OrderQty > 500
--	)

--SELECT *
--FROM Purchasing.PurchaseOrderDetail
--WHERE OrderQty > 500

--SELECT
--	PurchaseOrderID,
--	OrderDate,
--	SubTotal,
--	TaxAmt
--FROM Purchasing.PurchaseOrderHeader a
--WHERE EXISTS (
--	SELECT 1
--	FROM Purchasing.PurchaseOrderDetail b
--	WHERE a.PurchaseOrderID = b.PurchaseOrderID
--	AND b.OrderQty > 500 AND b.UnitPrice > 50.00
--	)
--ORDER BY 1

--SELECT *
--FROM Purchasing.PurchaseOrderDetail
--WHERE OrderQty > 500 AND UnitPrice > 50.00
--ORDER BY 1


SELECT
	a.*
FROM Purchasing.PurchaseOrderHeader a
WHERE EXISTS (
	SELECT 1
	FROM Purchasing.PurchaseOrderDetail b
	WHERE a.PurchaseOrderID = b.PurchaseOrderID
	AND b.RejectedQty = 0
	)
ORDER BY 1

SELECT *
FROM Purchasing.PurchaseOrderDetail
WHERE RejectedQty = 0
ORDER BY 1


