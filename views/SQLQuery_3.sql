use AdventureWorks2019

--Función IIF
SELECT IIF(1=1, 'Verdadero', 'Falso') AS 'RESULTADO'

CREATE VIEW vista_genero
AS
SELECT e.loginID, e.jobTittle, e.Gender (e.Gender= 'F', 'MUJER', 'HOMBRE') AS 'SEXO'
HumanResources.Employee as e;

SELECT UPPER(jobTittle) AS [Titulo] 
FROM vista_genero
WHERE SEXO = 'MUJER';

IF OBJECT_ID (N'tempdb..#StudentsC1') is not NULL
begin
    drop table #StudentsC1;
end

CREATE TABLE #StudentsC1(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);

INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)


IF OBJECT_ID(N'tempdb..#StudentsC2') is not NULL
begin
drop table #StudentsC2
END


CREATE TABLE #StudentsC2(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);


INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)


select * from #StudentsC1
select * from #StudentsC2 

select * from 
#StudentsC1 as s1
inner join #StudentsC2 as s2
on s1.StudentID = s2.StudentID

select s1.StudentID, s1.StudentID, s1.StudentStatus from 
#StudentsC1 as s1
left join #StudentsC2 as s2
on s1.StudentID = s2.StudentID
where s1.StudentID is NULL 


update s2 
set s2.studentName = s1.studentName,
s2.StudentStatus = s1.StudentStatus
from
#StudentsC1 as s1 
inner join #StudentsC2 as s2
on s1.StudentID = s2.StudentID;