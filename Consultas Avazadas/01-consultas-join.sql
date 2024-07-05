--Consultas avanzadas 
SELECT c.CategoryName As 'Nombre Producto',
p.ProductName as 'Nombre Producto',
p.UnitPrice as 'Precio',
p.UnitsINStock 'Existencia'
FROM
Categories AS c
INNER JOIN Products As p
on c.CategoryID = p.CategoryID
WHERE ProductName in ('Beverages', 'Produce')

--seleccionar todas las ordenes que fueron emitidas por los 
--empleados Nancy Davolio, Anne Dodsworth y Andrew Fuller

SELECT * FROM Orders
where EmployeeID = 1
OR EmployeeID = 9
OR EmployeeID = 2;

SELECT * FROM Orders
where EmployeeID in(1,9,2);

--Seleccionar todas las ordenes dividiendo la fecha de orden en, año, mes y dia
SELECT OrderDate as 'Fecha de Orden',
year(OrderDate) AS 'Año',
MONTH (OrderDate) as 'Mes',
DAY(OrderDate) as 'Dia'
FROM Orders;


--Seleccionar todos los nombres de los empleados 
SELECT CONCAT(FirstName, ' ', LastName) AS 'Nombre Completo'
 FROM Employees

--seleccionar todos los productos donde la existencia sea mayor o igual a 40
--y el precio sea menor a 19

SELECT  ProductName as 'Nombre del Roducto',
 UnitPrice as 'Precio', 
 UnitsInStock as 'Existencia'
 FROM Products
WHERE UnitsInStock >= 40
AND UnitPrice <19;


--Seleccionar Todas las ordenes realizadas de Abril a Agosto de 1996
SELECT OrderID, CustomerID, EmployeeID, OrderDate
 FROM Orders
 Where OrderDate>= '1996-04-01' AND OrderDate<='1996-08-31';

 SELECT OrderID, CustomerID, EmployeeID, OrderDate
 FROM Orders
 Where OrderDate BETWEEN '1996-04-01' and '1996-08-31';

 --Seleccionar todas las ordenes entre 1996 y 1998
SELECT * FROM Orders
 Where YEAR(OrderDate) BETWEEN '1996' and '1998'


 --Seleccionar todas las ordenes de 1996 y 1999
SELECT * FROM Orders
 Where YEAR(OrderDate) IN ('1996' , '1999')

 --Seleccionar todos los productos que comienen con C
 SELECT * 
 FROM Products
 WHERE ProductName like 'c%';

--Seleccionar todeos los productos que terminen con s
SELECT * 
 FROM Products
 WHERE ProductName like '%s';

 --seleccionar todos los productos que el nombre del Producto contenga la palabra no
 SELECT * 
 FROM Products
 WHERE ProductName like '%no%';

 --Seleccionar todos los productos que contengas las letras a o n
 SELECT * 
 FROM Products
 WHERE ProductName like '%a%' OR ProductName like '%n%';

--Seleccionar todos los productos que comienzen entre la letra A y la N
 SELECT * FROM 
 Products
 WHERE ProductName like '[A-N]%'



 --Seleccionar todas las ordenes emitidas que fueron emitidas por los
 --empleados Nancy Davolio, Anne Dodsworth y Andrew Fuller (inner join)
 SELECT o.OrderDate as 'Numero de Orden',
 o.OrderDate as 'fecha de orden',
 CONCAT(FirstName, '', LastName) as 'Nombre Empleado' 
 FROM 
 Employees as e 
 INNER JOIN
 Orders AS o 
 ON e.EmployeeID= o.EmployeeID
 WHERE e.FirstName IN ('Nancy', 'Anne', 'Andrew')
 AND e.LastName in ('Davolio', 'Dodswort', 'Fuller',)
