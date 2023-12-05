
SELECT
	*
FROM
(
	SELECT 
		JobTitle,
		VacationHours,
		Gender
		
	FROM HumanResources.Employee 
) A
PIVOT(
	AVG(VacationHours)
	FOR JobTitle IN([Sales Representative],[Buyer],[Janitor])

	) B


