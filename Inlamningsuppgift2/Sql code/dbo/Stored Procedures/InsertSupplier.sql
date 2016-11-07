CREATE procedure InsertSupplier(@companyName nvarchar(40))
as 
INSERT INTO [dbo].[Suppliers]
           ([CompanyName])
     VALUES
           (@CompanyName)
