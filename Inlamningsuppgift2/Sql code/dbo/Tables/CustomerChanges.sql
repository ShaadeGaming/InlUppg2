CREATE TABLE [dbo].[CustomerChanges] (
    [CustomerID]         NCHAR (5)     NOT NULL,
    [ContactName]        NVARCHAR (40) NOT NULL,
    [ContactNameChanged] NVARCHAR (40) NOT NULL,
    CONSTRAINT [PK_CustomerChanges] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

