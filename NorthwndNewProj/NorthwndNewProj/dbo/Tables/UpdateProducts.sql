CREATE TABLE [dbo].[UpdateProducts] (
    [ProductID]          NCHAR (5)     NOT NULL,
    [ProductName]        NVARCHAR (40) NOT NULL,
    [UnitPrice]          INT           NOT NULL,
    [ProductIDChanged]   NCHAR (5)     NOT NULL,
    [ProductNameChanged] NVARCHAR (40) NOT NULL,
    [UnitPriceChanged]   INT           NOT NULL,
    CONSTRAINT [PK_UpdateProducts] PRIMARY KEY CLUSTERED ([ProductIDChanged] ASC)
);

