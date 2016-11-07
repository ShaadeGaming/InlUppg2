CREATE TRIGGER [OrderDetailsUpdateTrigger]
ON [dbo].[Order Details]
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON
    UPDATE [dbo].[Products]
      SET [UnitsInStock]=[UnitsInStock]-(i.[Quantity]-d.[Quantity])
      FROM inserted i
        INNER JOIN deleted d ON i.[OrderID]=d.[OrderID] AND i.[ProductID]=d.[ProductID]
        INNER JOIN [dbo].[Products] p ON p.[ProductID]=i.[ProductID]
END

GO