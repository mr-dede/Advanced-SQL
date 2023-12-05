
--SELECT
--	ProductName = P.[Name],
--	P.[ListPrice],
--	ProductSubcategory = PS.[Name],
--	ProductCategory = PC.[Name],
--	AvgPriceByCategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name]),
--	AvgPriceByCategoryAndSubcategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name], PS.[Name]),
--	ProductVsCategoryDelta = P.[ListPrice] - AVG(P.ListPrice) OVER (PARTITION BY PC.[Name]),
--	PriceRank = ROW_NUMBER() OVER (ORDER BY P.[ListPrice] DESC)
--FROM Production.Product AS P
--INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
--INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID

--SELECT
--	ProductName = P.[Name],
--	P.[ListPrice],
--	ProductSubcategory = PS.[Name],
--	ProductCategory = PC.[Name],
--	AvgPriceByCategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name]),
--	AvgPriceByCategoryAndSubcategory = AVG(P.ListPrice) OVER (PARTITION BY PC.[Name], PS.[Name]),
--	ProductVsCategoryDelta = P.[ListPrice] - AVG(P.ListPrice) OVER (PARTITION BY PC.[Name]),
--	PriceRank = ROW_NUMBER() OVER (ORDER BY P.[ListPrice] DESC),
--	[Category Price Rank] = ROW_NUMBER() OVER (PARTITION BY PC.[Name] ORDER BY P.[ListPrice] DESC)
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
	ProductVsCategoryDelta = P.[ListPrice] - AVG(P.ListPrice) OVER (PARTITION BY PC.[Name]),
	PriceRank = ROW_NUMBER() OVER (ORDER BY P.[ListPrice] DESC),
	[Category Price Rank] = ROW_NUMBER() OVER (PARTITION BY PC.[Name] ORDER BY P.[ListPrice] DESC),
	CASE
		WHEN ROW_NUMBER() OVER (PARTITION BY PC.[Name] ORDER BY P.[ListPrice] DESC) <= 5 THEN 'Yes'
		ELSE 'No' END AS [TOP 5 Price in Category]
FROM Production.Product AS P
INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID