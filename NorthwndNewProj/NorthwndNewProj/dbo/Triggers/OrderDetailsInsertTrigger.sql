CREATE TRIGGER [OrderDetailsInsertTrigger]
ON [dbo].[Order Details]
FOR INSERT
AS
BEGIN
    SET NOCOUNT ON
    UPDATE [dbo].[Products]
      SET [UnitsInStock]=[UnitsInStock]-i.[Quantity]
      FROM inserted i
        INNER JOIN [dbo].[Products] p ON p.[ProductID]=i.[ProductID]
END

GO
