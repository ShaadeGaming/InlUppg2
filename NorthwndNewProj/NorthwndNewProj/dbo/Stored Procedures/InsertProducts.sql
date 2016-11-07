CREATE PROCEDURE InsertProducts (
    
    @ProductName nvarchar(40),
    @UnitPrice money)
	
AS
    SET NOCOUNT ON;
INSERT INTO Products([ProductName],[UnitPrice])VALUES ( @ProductName, @UnitPrice);

SELECT        ProductName, UnitPrice
FROM            Products
GROUP BY ProductID,ProductName, UnitPrice
HAVING (ProductID=MAX(ProductID))