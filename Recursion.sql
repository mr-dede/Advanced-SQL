

--WITH OddSeries AS (

--	SELECT 1 as MyOddNumber

--	UNION ALL

--	SELECT
--		MyOddNumber + 2
--	FROM OddSeries
--	WHERE MyOddNumber < 99
--)

--SELECT * FROM OddSeries


WITH FirstDays AS (

	SELECT CAST('01-01-2021' AS DATE) AS MyDate

	UNION ALL

	SELECT 
		DATEADD(MONTH, 1, MyDate)
	FROM FirstDays
	WHERE MyDate < CAST('12-01-2029' AS DATE)

)

SELECT * FROM FirstDays
OPTION (MAXRECURSION 120)