

--SELECT 
--	ProductSubcategoryID,
--	ProductCategoryID,
--	SubCategoryName = [Name],
--	rowguid,
--	ModifiedDate,
--	Products = 
--		STUFF(
--			(
--				SELECT
--					', ' + CAST(b.[Name] AS VARCHAR) 
--				FROM Production.Product b
--				WHERE a.ProductSubcategoryID = b.ProductSubcategoryID
--				FOR XML PATH ('')
--			), 
--				1, 
--				1,
--				''
--			)

--FROM Production.ProductSubcategory a

SELECT 
	ProductSubcategoryID,
	ProductCategoryID,
	SubCategoryName = [Name],
	rowguid,
	ModifiedDate,
	Products = 
		STUFF(
			(
				SELECT
					', ' + CAST(b.[Name] AS VARCHAR) 
				FROM Production.Product b
				WHERE a.ProductSubcategoryID = b.ProductSubcategoryID
				AND b.ListPrice > 50
				FOR XML PATH ('')
			), 
				1, 
				1,
				''
			)

FROM Production.ProductSubcategory a