CREATE TABLE [dbo].[Customers] (
    [CustomerID]   NCHAR (5)     NOT NULL,
    [CompanyName]  NVARCHAR (40) NOT NULL,
    [ContactName]  NVARCHAR (30) NULL,
    [ContactTitle] NVARCHAR (30) NULL,
    [Address]      NVARCHAR (60) NULL,
    [City]         NVARCHAR (15) NULL,
    [Region]       NVARCHAR (15) NULL,
    [PostalCode]   NVARCHAR (10) NULL,
    [Country]      NVARCHAR (15) NULL,
    [Phone]        NVARCHAR (24) NULL,
    [Fax]          NVARCHAR (24) NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [City]
    ON [dbo].[Customers]([City] ASC);


GO
CREATE NONCLUSTERED INDEX [CompanyName]
    ON [dbo].[Customers]([CompanyName] ASC);


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Customers]([PostalCode] ASC);


GO
CREATE NONCLUSTERED INDEX [Region]
    ON [dbo].[Customers]([Region] ASC);


GO
CREATE TRIGGER CustomerUpdateTrigger
   ON  Customers 
   for UPDATE
AS
Begin
set nocount on;
	--INSERT INTO [dbo].[CustomerChanges]
 --       ([], [OldPrice], [NewPrice], [ChangedDate], [UserId])
	--select i.CustomerID, d.ContactName, i.ContactName
	--from inserted i
	--inner join deleted d on i.CustomerID= d.CustomerID
	end

GO
CREATE TRIGGER CustomerUpdateContactName 
   ON  Customers 
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO CustomerChanges
        ([CustomerID], [ContactName], [ContactNameChanged])
	select i.CustomerID, d.ContactName, i.ContactName
	from inserted i
	inner join deleted d on i.CustomerID= d.CustomerID
	where d.ContactName <> i.ContactName
END