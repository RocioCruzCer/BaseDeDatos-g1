-- Crear un sp que solicite un idde una categoria
-- y devuelva el promedio de los precios de sus productos
use Northwind
GO

Create or alter proc sp_solicitar_promedio_prod
@catego int -- Parametro de entrada 
AS
begin
select avg(UnitPrice) as 'Promedio precios de los productos'
from products
where CategoryID = @catego;
end
GO

exec sp_solicitar_promedio_prod 2

exec sp_solicitar_promedio_prod @catego = 5

exec sp_solicitar_promedio_prod @catego = 4

--crear un store que reciba 2 fechas y devuelva una lista de empleados (bombre fullname) que fueron contratados dentro de ese rango de fechas (Hired Day)

select *  from Employees

select (HireDate) from Employees


--procedimineto almacenado para actualizar los precios de un producto y realizar el cambio
--proceso
--1crear almacenamiento almacenado que se llame actualizar precio producto
--2crear una tabla que se llame cambio de precio(cambio id int identity pk, productoid not null int, precioAnterior money, precioNuevo money, fecha de cambio
--dateday)
--3 debe aseptar 2 parametros elq ue se va a combiar y en nuevo precio
--4el procedimiento debe actualizar el precio del producto products
--5debe insertar un registro en la tabla cambio de precio con los detalles de cambio