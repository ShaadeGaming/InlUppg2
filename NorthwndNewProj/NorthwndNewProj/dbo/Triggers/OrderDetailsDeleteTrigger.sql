CREATE TRIGGER [OrderDetailsDeleteTrigger]
ON [dbo].[Order Details]
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON
    UPDATE [dbo].[Products]
      SET [UnitsInStock]=[UnitsInStock]+d.[Quantity]
      FROM deleted d
        INNER JOIN [dbo].[Products] p ON p.[ProductID]=d.[ProductID]
END

GO