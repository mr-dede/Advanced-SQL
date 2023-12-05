SELECT
	PH.PurchaseOrderID,
	PH.OrderDate,
	PH.TotalDue,
	PV.[Name] AS VedorName,
	PrevOrderFromVendorAmt = LAG(PH.TotalDue,1) OVER (PARTITION BY PH.VendorID ORDER BY PH.OrderDate),
	NextOrderByEmployeeVendor = LEAD(PV.[Name],1) OVER (PARTITION BY PH.EmployeeID ORDER BY PH.OrderDate),
	Next2OrderByEmployeeVendor = LEAD(PV.[Name],2) OVER (PARTITION BY PH.EmployeeID ORDER BY PH.OrderDate)
FROM Purchasing.PurchaseOrderHeader AS PH
INNER JOIN Purchasing.Vendor AS PV ON PH.VendorID = PV.BusinessEntityID
WHERE YEAR(PH.OrderDate) >= 2013 AND PH.TotalDue > 500
ORDER BY PH.EmployeeID, PH.OrderDate
