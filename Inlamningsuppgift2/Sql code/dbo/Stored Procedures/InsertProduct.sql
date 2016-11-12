CREATE PROCEDURE InsertProduct (
    
    @ProductName nvarchar(40),
    @UnitPrice money)
	
AS
    SET NOCOUNT ON;
INSERT INTO Products([ProductName],[UnitPrice])VALUES ( @ProductName, @UnitPrice);
