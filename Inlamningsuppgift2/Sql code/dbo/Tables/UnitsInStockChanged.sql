CREATE TABLE [dbo].[UnitsInStockChanged] (
    [ProductID]          INT           NOT NULL,
    [ProductName]        NVARCHAR (50) NOT NULL,
    [UnitsInStockBefore] SMALLINT      NOT NULL,
    [UnitsInStockAfter]  SMALLINT      NOT NULL,
    CONSTRAINT [PK_UnitsInStockChanged] PRIMARY KEY CLUSTERED ([ProductID] ASC)
);

