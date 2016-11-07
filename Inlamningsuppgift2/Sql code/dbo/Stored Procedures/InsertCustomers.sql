CREATE PROCEDURE dbo.InsertCustomers (
    @CustomerID nchar(5),
    @CompanyName nvarchar(40),
    @ContactName nvarchar(30),
    @Phone nvarchar(24))
	
AS
    SET NOCOUNT ON;
INSERT INTO Customers([CustomerID] ,[CompanyName],[ContactName],[Phone]) VALUES ( @CustomerID ,@CompanyName, @ContactName, @Phone );

