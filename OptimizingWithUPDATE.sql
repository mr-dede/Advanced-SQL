CREATE TABLE #Cliente (
	BusinessEntityID INT,
	Title VARCHAR(8),
	FirstName VARCHAR(50),
	MiddleName VARCHAR(50),
	LastName VARCHAR(50),
	PhoneNumber VARCHAR(25),
	PhoneNumberType INT,
	EmailAddress VARCHAR(50)
)

INSERT INTO #Cliente(
	BusinessEntityID,
	Title,
	FirstName,
	MiddleName,
	LastName
)

SELECT
	A.BusinessEntityID,
	A.Title,
	A.FirstName,
	A.MiddleName,
	A.LastName
FROM
	Person.Person A

SELECT * FROM #Cliente

UPDATE A
SET A.PhoneNumber = B.PhoneNumber,
A.PhoneNumberType = B.PhoneNumberTypeID
FROM #Cliente A
INNER JOIN 
	Person.PersonPhone B
		ON A.BusinessEntityID = B.BusinessEntityID

UPDATE A
SET A.EmailAddress = B.EmailAddress
FROM #Cliente A
INNER JOIN 
	Person.EmailAddress B
		ON A.BusinessEntityID = B.BusinessEntityID
