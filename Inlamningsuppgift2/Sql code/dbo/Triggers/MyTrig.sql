create TRIGGER CustomerUpdateContactName 
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
GO

