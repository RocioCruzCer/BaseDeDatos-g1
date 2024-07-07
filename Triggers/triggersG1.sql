create database PruebaTriggersG1;
GO

use PruebaTriggersG1;
GO

CREATE TABLE Empleado(
    idempleado INT not null PRIMARY KEY,
    nombreEmpl VARCHAR(30) not null,
    apellido1 VARCHAR(15) not null,
    apellido2 VARCHAR(15),
    salario MONEY not null
);
GO

CREATE or ALTER TRIGGER tg_1
on Empleado
after INSERT
AS
BEGIN
print 'Se eecuto el trigger tg_1, en el evento insert'
end;
go

SELECT * FROM Empleado

INSERT INTO Empleado
values (1, 'Joseph Abrahan', 'Yañez', 'Garcia', 57500)
GO

drop TRIGGER tg_1;
GO

CREATE or ALTER TRIGGER tg_2
on Empleado
AFTER INSERT
AS 
BEGIN 
  select * from inserted;
  select * from deleted;
END;

DELETE empleado 
WHERE idempleado = 2;

CREATE or ALTER TRIGGER tg_3
on Empleado
AFTER DELETE
AS 
BEGIN 
  select * from inserted;
  select * from deleted;
END;

INSERT INTO Empleado
values (2, 'Rocio', 'Cruz', 'Cervantes', 57500)
GO 

DELETE empleado 
WHERE idempleado = 3;

CREATE or ALTER TRIGGER tg_4
on Empleado
AFTER UPDATE
AS 
BEGIN 
  select * from inserted;
  select * from deleted;
END;

DELETE empleado 
WHERE idempleado = 4;

SELECT * FROM empleados

UPDATE Empleado
set nombreEmpl = 'Pancracio',
    salario = 10000
WHERE idempleado = 1;
GO

CREATE or ALTER TRIGGER tg_5
on Empleado
AFTER INSERT, DELETE
AS 
BEGIN 
   if EXISTS (select 1 from inserted)
   begin 
      PRINT 'Se realizo un insert'
    END
    ELSE if EXISTS (select 1 from deleted) AND
    not EXISTS (SELECT 1 from inserted)
    BEGIN
      PRINT 'Se realizo un delete'
    END
END;


insert into Empleado
values (2, 'Lesly', 'Jimenez', 'Nery', 100000)

delete from Empleado
where idempleado = 2