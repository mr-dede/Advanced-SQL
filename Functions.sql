USE AdventureWorks2022

GO

CREATE FUNCTION dbo.ufnIntegerPercent(@Numerator FLOAT, @Denominator FLOAT)
RETURNS FLOAT
AS   
BEGIN
    DECLARE @Decimal FLOAT = ((@Numerator * 1.0) / (@Denominator * 1.0)) * 100;

    RETURN @Decimal
END;



DECLARE @Teste FLOAT
SET @Teste = dbo.ufnIntegerPercent(1,2)

SELECT @Teste