
CREATE PROCEDURE InsertProducts (
    
    @ProductName nvarchar(40),
    @UnitPrice money)
	
AS
    SET NOCOUNT ON;
INSERT INTO Products([ProductName],[UnitPrice])VALUES ( @ProductName, @UnitPrice);

Select top(1) ProductID from Products
order by Products.ProductID 

exec InsertProducts hello, 500