

--SELECT
--	E.BusinessEntityID AS EmployeeID,
--	E.JobTitle,
--	E.HireDate,
--	E.VacationHours,
--	FirstHireVacationHours = FIRST_VALUE(E.VacationHours) OVER (PARTITION BY E.JobTitle ORDER BY E.HireDate)
--FROM HumanResources.Employee E
--ORDER BY E.JobTitle, E.HireDate

SELECT
	P.ProductID,
	P.[Name] AS ProductName,
	PR.ListPrice,
	PR.ModifiedDate,
	HighestPrice = FIRST_VALUE(PR.ListPrice) OVER (PARTITION BY PR.ProductID ORDER BY PR.ListPrice DESC),
	LowestCost = FIRST_VALUE(PR.ListPrice) OVER (PARTITION BY PR.ProductID ORDER BY PR.ListPrice),
	PriceRange = FIRST_VALUE(PR.ListPrice) OVER (PARTITION BY PR.ProductID ORDER BY PR.ListPrice DESC) - FIRST_VALUE(PR.ListPrice) OVER (PARTITION BY PR.ProductID ORDER BY PR.ListPrice)
FROM Production.Product P
INNER JOIN Production.ProductListPriceHistory PR ON P.ProductID = PR.ProductID
ORDER BY PR.ProductID, PR.ModifiedDate

