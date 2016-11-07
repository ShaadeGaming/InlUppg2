CREATE PROCEDURE InsertProduct (
    @ProductID int,
    @ProductName nvarchar(40),
    @UnitPrice money)
	
AS
    SET NOCOUNT ON;
INSERT INTO Products([ProductID] ,[ProductName],[UnitPrice])VALUES ( @ProductID ,@ProductName, @UnitPrice);

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE (ProductID = @ProductID)