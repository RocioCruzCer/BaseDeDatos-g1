--funciones de agregado y agrupación

--utilizar base de datos
use NORTHWND;

--funciones de agregado

--seleccionar el numero total ordenes de compra

-- count (*)

SELECT COUNT(*) as 'numero de ordenes' from Orders;

-- count (campo)

SELECT Region FROM Customers;

----------------------------------------------




SELECT CategoryID, COUNT(*) as 'numero de productos'
from Products

SELECT CategoryID
FROM Products


SELECT CategoryID, count(*) as ' total de productos'
FROM Products
GROUP by CategoryID

--Seleccionar el numero de productos por nombre de categoria
SELECT c.CategoryName, COUNT(Productid)
FROM categories as c
INNER JOIN Products as p 
on c.Categoryid = p.Categoryid
WHERE c.CategoryName in ('Bevarages', 'Confections')
GROUP BY c.CategoryName;


