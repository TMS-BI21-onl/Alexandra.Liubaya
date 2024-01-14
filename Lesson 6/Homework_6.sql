CREATE PROCEDURE UpdateNationalIDNumber
    @BusinessEntityID INT,
    @NationalIDNumber NVARCHAR(15)
AS
BEGIN
    UPDATE HumanResources.Employee
    SET NationalIDNumber = @NationalIDNumber
    WHERE BusinessEntityID = @BusinessEntityID;
END;


EXEC UpdateNationalIDNumber @BusinessEntityID = 15, @NationalIDNumber = '879341111';