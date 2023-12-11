DECLARE @MaxVactionHours INT

SELECT @MaxVactionHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee)

SELECT
	   BusinessEntityID
      ,JobTitle
      ,VacationHours
	  ,MaxVacationHours = @MaxVactionHours
	  ,PercentOfMaxVacationHours = (VacationHours * 1.0) / @MaxVactionHours

FROM HumanResources.Employee

WHERE (VacationHours * 1.0) / @MaxVactionHours >= 0.8
