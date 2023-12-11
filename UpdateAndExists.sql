CREATE TABLE #Rejected (
	PurchaseOrderID INT,
	OrderDate DATE,
	TotalDue MONEY,
	RejectedQty INT
)


INSERT INTO #Rejected(
	PurchaseOrderID,
	OrderDate,
	TotalDue

)

SELECT
       A.PurchaseOrderID,
	   A.OrderDate,
	   A.TotalDue

FROM Purchasing.PurchaseOrderHeader A

UPDATE A
SET RejectedQty = B.RejectedQty
FROM #Rejected A
INNER JOIN
	Purchasing.PurchaseOrderDetail B
		ON A.PurchaseOrderID = B.PurchaseOrderID
WHERE B.RejectedQty > 5

SELECT * FROM #Rejected WHERE RejectedQty IS NOT NULL

DROP TABLE #Rejected