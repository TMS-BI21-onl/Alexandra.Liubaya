-- task 3: Row Number, Rank and Dense Rank return same result if a column used in ORDER BY has unique values. Or if a table contains only one row.

--task 4a
SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%';

-- no codes starting with  'T'

SELECT COUNT(UnitMeasureCode)
FROM Production.UnitMeasure;

-- 38 codes total

INSERT INTO [Production].[UnitMeasure] (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT1', 'Test 1', CAST('2020-09-09' as datetime));

INSERT INTO [Production].[UnitMeasure] (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT2', 'Test 2', getdate());

SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%';


--task 4b
SELECT UnitMeasureCode, Name, ModifiedDate
INTO [Production].[UnitMeasureTest]
FROM [Production].[UnitMeasure]
WHERE UnitMeasureCode LIKE 'T%';

INSERT INTO [Production].[UnitMeasureTest] (UnitMeasureCode, Name, ModifiedDate)
SELECT UnitMeasureCode, Name, ModifiedDate
FROM [Production].[UnitMeasure]
WHERE UnitMeasureCode ='CAN';

SELECT *
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode;


--task 4c
UPDATE [Production].[UnitMeasureTest]
SET UnitMeasureCode = 'TTT';


--task 4d
DELETE
FROM [Production].[UnitMeasureTest];


--task 4e
SELECT SalesOrderID
	,MAX(LineTotal) OVER (PARTITION BY SalesOrderID) AS "Max"
	,MIN(LineTotal) OVER (PARTITION BY SalesOrderID) AS "Min"
	,AVG(LineTotal) OVER (PARTITION BY SalesOrderID) AS "Avg"
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659, 43664);


--task 4f
SELECT CONCAT(UPPER(LEFT(LastName,3)),'login',ISNULL(TerritoryGroup,'')) AS Login
	,FirstName, LastName, SalesYTD
	,RANK() OVER (ORDER BY SalesYTD DESC) AS Rank
	,RANK() OVER (ORDER BY SalesLastYear DESC) AS RankLastYear
FROM Sales.vSalesPerson
ORDER BY Rank
-- Linda Mitchell is first in rating. Last Year: Ranjit Varkey Chudukatil is first in rating


--task 4g
SELECT 
    DATEADD(DAY, 
            CASE
                WHEN DATEPART(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)) = 1 THEN 1
                WHEN DATEPART(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)) = 7 THEN 2
                ELSE 0
            END,
            DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)) AS FirstWeekdayOfMonth;


--task5
/*
Id(PK)	Name		DepName
1			null		A
2			null		null
3			A			C
4			B			C

count(1) = 4
count(name) = 2
count(id) = 4
count(*) = 4
*/
