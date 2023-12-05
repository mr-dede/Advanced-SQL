--SELECT
--	ProductName = P.[Name],
--	P.[ListPrice],
--	ProductSubcategory = PS.[Name],
--	ProductCategory = PC.[Name]
--FROM Production.Product AS P
--INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
--INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID

--SELECT
--	ProductName = P.[Name],
--	P.[ListPrice],
--	ProductSubcategory = PS.[Name],
--	ProductCategory = PC.[Name],
--	AvgPriceByCategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name])
--FROM Production.Product AS P
--INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
--INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID

--SELECT
--	ProductName = P.[Name],
--	P.[ListPrice],
--	ProductSubcategory = PS.[Name],
--	ProductCategory = PC.[Name],
--	AvgPriceByCategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name]),
--	AvgPriceByCategoryAndSubcategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name], PS.[Name])
--FROM Production.Product AS P
--INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
--INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID

SELECT
	ProductName = P.[Name],
	P.[ListPrice],
	ProductSubcategory = PS.[Name],
	ProductCategory = PC.[Name],
	AvgPriceByCategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name]),
	AvgPriceByCategoryAndSubcategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name], PS.[Name]),
	ProductVsCategoryDelta = P.[ListPrice] - AVG(P.ListPrice) OVER (PARTITION BY PC.[Name])
FROM Production.Product AS P
INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID