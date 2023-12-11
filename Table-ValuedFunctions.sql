USE AdventureWorks2022

GO

CREATE FUNCTION Production.ufn_ProductsByPriceRange(@Min MONEY, @Max MONEY)

RETURNS TABLE

AS 
RETURN
	(SELECT
		ProductID,
		[Name],
		ListPrice
	FROM
		Production.Product

	WHERE ListPrice BETWEEN @Min AND @Max
	)


SELECT *
FROM Production.ufn_ProductsByPriceRange(10,20)