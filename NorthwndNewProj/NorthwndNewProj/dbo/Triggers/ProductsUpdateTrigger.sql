CREATE TRIGGER [ProductsUpdateTrigger]
ON [dbo].[Products]
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON
    INSERT INTO [dbo].[ProductPriceChanges]
        ([ProductID], [OldPrice], [NewPrice], [ChangedDate], [UserId])
        SELECT i.[ProductID], d.[UnitPrice], i.[UnitPrice], GETDATE(), USER_ID()
            FROM inserted i
              INNER JOIN deleted d ON i.[ProductID]=d.[ProductID]
            WHERE d.[UnitPrice] <> i.[UnitPrice]
END

GO
