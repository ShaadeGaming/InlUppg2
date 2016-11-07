CREATE procedure UpdateProductPrice(@ProductId int ,@UnitPrice money )
as
set nocount on;
update Products
set UnitPrice= @UnitPrice
where (ProductID= @ProductId)