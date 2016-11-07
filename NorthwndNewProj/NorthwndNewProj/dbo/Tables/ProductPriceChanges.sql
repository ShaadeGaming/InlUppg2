CREATE TABLE [dbo].[ProductPriceChanges](
    [ProductPriceChangeID] [int] IDENTITY(1,1) NOT NULL,
    [ProductID] [int] NOT NULL,
    [OldPrice] [money] NOT NULL,
    [NewPrice] [money] NOT NULL,
    [ChangedDate] [datetime] NOT NULL,
    [UserId] [int] NOT NULL,
    PRIMARY KEY CLUSTERED 
    (
        [ProductPriceChangeID] ASC
    )
)

GO
