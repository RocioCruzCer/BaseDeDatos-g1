
--Declaración y uso de variables en transact-sql

--Declaración de una variable
declare @numeroCal int 
declare @calif decimal (10,2)

--Asignación de variables
set  @numeroCal = 10
if @numeroCal <=0
begin 
set @numeroCal=1
end 

declare @i=1
while (@i<=@numeroCal)
begin 
set @calif = @calif +10
set @i = @i +1
END

set @calif = @calif / @numeroCal
print ('el resultado es: ' + @calif)
