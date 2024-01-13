--task 6
USE AdventureWorks2017;

CREATE TABLE Patients (
    ID INT IDENTITY(1,1) PRIMARY KEY
    , FirstName NVARCHAR(30) NOT NULL
    , LastName NVARCHAR(30) NOT NULL
    , SSN NVARCHAR(10) UNIQUE
    , Email AS (UPPER(LEFT(FirstName, 1)) + LOWER(SUBSTRING(LastName, 1, 3)) + '@mail.com')
    , Temp DECIMAL(3,1)
    , CreatedDate DATETIME DEFAULT GETDATE()
	);



--task 7
INSERT INTO Patients (FirstName, LastName, SSN, Temp, CreatedDate)
VALUES ('Alexandra', 'Liubaya', '156845965', 36.6, GETDATE()),
       ('Denis', 'Khursin', '745226515', 37.5, GETDATE()),
       ('Zhanna', 'Zdanovich', '154786325', 37.2, GETDATE());



--task 8
ALTER TABLE Patients
ADD TempType AS
    CASE
        WHEN Temp < 37 THEN '< 37°C'
        WHEN Temp > 37 THEN '> 37°C'
        ELSE NULL
    END;



--task 9
CREATE VIEW dbo.Patients_v
AS   
SELECT ID, FirstName, LastName, SSN, Email, CAST((Temp * 9/5 + 32) AS DECIMAL(4,1)) AS TempFahrenheit, CreatedDate
FROM Patients;



--task 10
CREATE FUNCTION ConvertToFarhenheit (@Celsius DECIMAL(3,1))
RETURNS DECIMAL(4,1)
AS 
BEGIN 
	RETURN @Celsius * 9/5 + 32;
END;



--task 11
DECLARE @FirstWeekdayOfMonth DATE;

SELECT @FirstWeekdayOfMonth =  
    DATEADD(DAY, 
            CASE
                WHEN DATEPART(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)) = 1 THEN 1
                WHEN DATEPART(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)) = 7 THEN 2
                ELSE 0
            END,
            DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1));

SELECT @FirstWeekdayOfMonth AS FirstWeekdayOfMonth;



--task 12
SELECT e.FIRST_NAME
	, CASE WHEN jh.END_DATE IS NULL THEN 'Currently Working'
	     WHEN jh.END_DATE IS NOT NULL THEN CONCAT('Left the company at ', FORMAT(jh.END_DATE, 'dd "of" MMMM, yyyy'))
		END AS STATUS
FROM EMPLOYEES AS e
LEFT JOIN JOB_HISTORY AS jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID;


