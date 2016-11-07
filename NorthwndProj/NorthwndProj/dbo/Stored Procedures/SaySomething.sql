Create procedure SaySomething(@message NVARCHAR(50),@counter Int)
as 

while(@counter >0)
begin
print @message + ' ' + Cast(@counter AS NVARCHAR(2))
set @counter= @counter -1
end