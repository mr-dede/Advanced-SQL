
--SELECT
--*
--FROM
--	(SELECT
--		PurchaseOrderID,
--		VendorID,
--		OrderDate,
--		TaxAmt,
--		Freight,
--		TotalDue,
--		OrderRank = ROW_NUMBER() OVER (PARTITION BY VendorID ORDER BY TotalDue DESC)
--		FROM Purchasing.PurchaseOrderHeader
--	) E
--WHERE E.OrderRank <= 3

SELECT
*
FROM
	(SELECT
		PurchaseOrderID,
		VendorID,
		OrderDate,
		TaxAmt,
		Freight,
		TotalDue,
		OrderRank = DENSE_RANK() OVER (PARTITION BY VendorID ORDER BY TotalDue DESC)
		FROM Purchasing.PurchaseOrderHeader
	) E
WHERE E.OrderRank <= 3