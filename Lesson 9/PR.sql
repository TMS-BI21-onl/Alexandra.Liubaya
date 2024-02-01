--task 1

SELECT p.FirstName, p.LastName, pph.PhoneNumber
FROM Person.Person p
LEFT JOIN Person.PersonPhone pph on p.BusinessEntityID = pph.BusinessEntityID
WHERE LEFT(pph.PhoneNumber,3) LIKE '4_5';


--task 2

WITH Age as
(
SELECT p.FirstName
	, p.LastName
    , DATEDIFF(YEAR, e.BirthDate, GETDATE()) - 
		CASE 
        WHEN DATEADD(YEAR, DATEDIFF(YEAR, e.BirthDate, GETDATE()), e.BirthDate) > GETDATE() 
        THEN 1 
        ELSE 0 
    END AS Age
FROM HumanResources.Employee e
LEFT JOIN Person.Person p on p.BusinessEntityID = e.BusinessEntityID
)

SELECT Age.FirstName
	, Age.LastName
	, CASE 
        WHEN Age.Age BETWEEN 17 AND 20 THEN 'Adolescence'
        WHEN Age.Age BETWEEN 21 AND 59 THEN 'Adults'
        WHEN Age.Age BETWEEN 60 AND 75 THEN 'Elderly'
        WHEN Age.Age BETWEEN 76 AND 90 THEN 'Senile'
        ELSE ''
	  END AS AgeCategory
FROM Age


--task 3

SELECT Color, Name, ListPrice
FROM (
  SELECT Color, Name, ListPrice,
    ROW_NUMBER() OVER (PARTITION BY Color ORDER BY ListPrice DESC) AS rn
  FROM [Production].[Product]
) AS s
WHERE rn = 1;