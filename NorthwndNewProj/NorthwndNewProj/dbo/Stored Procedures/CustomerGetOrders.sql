CREATE procedure CustomerGetOrders(@CustomerID nvarchar(50))
as

SELECT        c.ContactName, c.CompanyName,o.OrderDate  as OrderDate, c.CustomerID 
FROM            Customers  c INNER JOIN
                         Orders o  ON c.CustomerID = o.CustomerID INNER JOIN
                         [Order Details] od ON o.OrderID = od.OrderID 
where c.CustomerID= @CustomerID			
ORDER BY c.CustomerID