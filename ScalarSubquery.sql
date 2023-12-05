

SELECT
	BusinessEntityID,
	JobTitle,
	VacationHours,
	MaxVacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee),
	[% individual employee's vacation hour] = CAST(VacationHours * 100.00 / NULLIF((SELECT MAX(VacationHours) FROM HumanResources.Employee), 0) AS decimal(10, 2))
FROM HumanResources.Employee
WHERE CAST(VacationHours * 100.00 / NULLIF((SELECT MAX(VacationHours) FROM HumanResources.Employee), 0) AS decimal(10, 2)) < 80.00