

/*SELECT
	[BusinessEntityID],
	[TerritoryID],
	[SalesQuota],
	[Bonus],
	[CommissionPct],
	[SalesYTD],
	[SalesLastYear],
	[Total YTD Sales] = SUM(SalesYTD) OVER (),
	[Max YTD SAles] = MAX(SAlesYTD) OVER (),
	[% of Best Performer] = [SalesYTD]/MAX(SalesYTD) OVER ()


FROM AdventureWorks2022.Sales.SalesPerson
*/


--SELECT
--	P.[FirstName],
--	P.[LastName],
--	E.[JobTitle],
--	EH.[Rate],
--	[Average Rate] = AVG(EH.Rate) OVER ()
--FROM Person.Person AS P
--INNER JOIN HumanResources.Employee AS E ON  P.BusinessEntityID = E.BusinessEntityID
--INNER JOIN HumanResources.EmployeePayHistory AS EH ON P.BusinessEntityID = EH.BusinessEntityID

--SELECT
--	P.[FirstName],
--	P.[LastName],
--	E.[JobTitle],
--	EH.[Rate],
--	[Average Rate] = AVG(EH.Rate) OVER (),
--	[Maximum Rate] = MAX(EH.Rate) OVER ()
--FROM Person.Person AS P
--INNER JOIN HumanResources.Employee AS E ON  P.BusinessEntityID = E.BusinessEntityID
--INNER JOIN HumanResources.EmployeePayHistory AS EH ON P.BusinessEntityID = EH.BusinessEntityID

--SELECT
--	P.[FirstName],
--	P.[LastName],
--	E.[JobTitle],
--	EH.[Rate],
--	[Average Rate] = AVG(EH.Rate) OVER (),
--	[Maximum Rate] = MAX(EH.Rate) OVER (),
--	[Diff From Avg Rate] = EH.[Rate] - AVG(EH.Rate) OVER ()
--FROM Person.Person AS P
--INNER JOIN HumanResources.Employee AS E ON  P.BusinessEntityID = E.BusinessEntityID
--INNER JOIN HumanResources.EmployeePayHistory AS EH ON P.BusinessEntityID = EH.BusinessEntityID

SELECT
	P.[FirstName],
	P.[LastName],
	E.[JobTitle],
	EH.[Rate],
	[Average Rate] = AVG(EH.Rate) OVER (),
	[Maximum Rate] = MAX(EH.Rate) OVER (),
	[Diff From Avg Rate] = EH.[Rate] - AVG(EH.Rate) OVER (),
	[% of Max Rate] = EH.Rate/MAX(EH.Rate) OVER () * 100
FROM Person.Person AS P
INNER JOIN HumanResources.Employee AS E ON  P.BusinessEntityID = E.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory AS EH ON P.BusinessEntityID = EH.BusinessEntityID

