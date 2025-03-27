--- 1. Seleccionar el apellido, oficio, salario, numero de departamento y su nombre de todos los empleados cuyo salario sea mayor de 300000
select e.apellido, e.oficio, e.salario, d.dept_no as NUMERO, d.dnombre as DEPARTAMENTO from
EMP e
inner join DEPT d
on e.DEPT_NO = d.DEPT_NO
where e.salario > 300000;

--- 2. Mostrar todos los nombres de Hospital con sus nombres de salas correspondientes.
select SALA.NOMBRE as Sala, HOSPITAL.NOMBRE as Hospital
FROM SALA
INNER JOIN HOSPITAL
ON SALA.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD;

--- 3. Calcular cuántos trabajadores de la empresa hay en cada ciudad.
select count(e.apellido) as Trabajadores, d.loc as Ciudad
from EMP e
full join DEPT d
on e.dept_no = d.dept_no
group by d.loc;

---4. Visualizar cuantas personas realizan cada oficio en cada departamento mostrando el nombre del departamento.
select count(e.apellido) as Personas, e.oficio, d.dnombre
from EMP e
full join DEPT d
on e.dept_no = d.dept_no
group by e.oficio, d.dnombre;

--5. Contar cuantas salas hay en cada hospital, mostrando el nombre de las salas y el nombre del hospital.
select count(s.SALA_COD) as Numero_Salas, h.nombre as Hospital, s.nombre as Sala
from HOSPITAL h
cross join SALA s
group by h.nombre, s.nombre;
--Profe respuesta:
select count(sala.sala_cod) as numerosalas, Sala.nombre as nombresala, hospital.nombre as nombrehospital
from sala
inner join hospital
on sala.hospital_cod = hospital.hospital_cod
group by sala.nombre, hospital.nombre;

--6. Queremos saber cuántos trabajadores se dieron de alta entre el año 1997 y 1998 y en qué departamento.
select count(e.apellido) as trabajadores, d.dnombre as Departamento
from EMP e
full join DEPT d
on e.dept_no = d.dept_no
where e.fecha_alt between '01-01-1997' and '01-01-1998'
group by d.dnombre;

-- 7. Buscar aquellas ciudades con cuatro o más personas trabajando.
select count(e.apellido) as Personas, d.loc as Ciudad
from EMP e
full join DEPT d
on e.dept_no = d.dept_no
group by d.loc
having count(e.apellido) => 4;


-- 8. Calcular la media salarial por ciudad.  Mostrar solamente la media para Madrid y Sevilla.
select AVG(e.SALARIO) as MEDIA_SALARIAL, d.loc as Ciudad
from EMP e
full join Dept d
on e.dept_no = d.dept_no
where d.loc in ('MADRID','SEVILLA')
group by d.loc; --  Si se tienen muchos datos se utiliza having

--9. Mostrar los doctores junto con el nombre de hospital en el que ejercen, la dirección y el teléfono del mismo.
Select doctor.apellido, hospital.nombre, hospital.direccion, hospital.telefono
from Doctor
inner join hospital
on doctor.hospital_cod = hospital.hospital_cod;

--10. Mostrar los nombres de los hospitales junto con el mejor salario de los empleados de la plantilla de cada hospital.
Select hospital.nombre, max(plantilla.salario) as SalarioMaximo
from Hospital
inner join Plantilla
on Hospital.hospital_cod = Plantilla.hospital_cod
group by Hospital.nombre;

-- 11. Visualizar el Apellido, función y turno de los empleados de la plantilla junto con el nombre de la sala y el nombre del hospital con el teléfono.
--Junto con el nombre de la sala y el nombre del hospital con el telefono.

/*
Select TABLA1.CAMPO1, TABLA1.CAMPO2,
TABLA2.CAMPO1, TABLA2.CAMPO2,
TABLA3.CAMPO1, TABLA3.CAMPO2
TABLA4.CAMPO1, TABLA4.CAMPO2
FROM TABLA 1
INNER JOIN TABLA2
ON TABLA.RELACION = TABLA2.RELACION
INNER JOIN TABLA3
ON TABLA 1.RELACION = TABLA3.RELACION
INNER JOIN TABLA 4
ON TABLA1.RELACION = TABLA4.RELACION;
*/

/*
Subconsultas: Son consultas que necesitan el resultado de otras consultas para poder ser ejecutadas, no son autonomas.
No importa el nivel de subconsultas, aunque pueden ralentizar la respuesta pero en nivel de anidamiento. Generan bloques en consultas select,
lo que tambien ralentiza las respuestas.

Ejemplos: Quiero visualizar los datos del empleado que mas cobra de la empresa (EMP)
*/
select max (SALARIO) from EMP;
--65000
select * from emp where salario = 650000;
--Se ejecutan las dos consultas a la vez y, se anida el resulta de una consulta
--CON LA IGUALDAD DE LA RESPUESTA DE OTRA CONSULTA
--LAS SUBCONSULTAS VAN ENTRE PARENTESIS.
SELECT * FROM EMP WHERE SALARIO = (SELECT MAX(SALARIO) FROM EMP); 
-- Mostrar los empleados que tienen el mismo oficio que el empleado gil
-- Y que cobren menos que jimenez
select * from EMP where OFICIO =
(select OFICIO from EMP where APELLIDO = 'gil')
and SALARIO < (SELECT SALARIO FROM EMP WHERE APELLIDO = 'jim');

---Ejemplos: Y El mismo oficio que jimenez 
*/
select max (SALARIO) from EMP;
--65000
select * from emp where salario = 650000;
--Se ejecutan las dos consultas a la vez y, se anida el resulta de una consulta
--CON LA IGUALDAD DE LA RESPUESTA DE OTRA CONSULTA
--LAS SUBCONSULTAS VAN ENTRE PARENTESIS.
SELECT * FROM EMP WHERE SALARIO = (SELECT MAX(SALARIO) FROM EMP); 
-- Mostrar los empleados que tienen el mismo oficio que el empleado gil
-- Y que cobren menos que jimenez
--Si una subconsulta devuelve mas de un valor, se utiliza el operador In
select * from EMP where OFICIO in
(select OFICIO from EMP where APELLIDO = 'gil' or APELLIDO = 'jimenez');
--Por supuesto, podemos utilizar subconsultas para otras tablas.
--Mostrar el apellido y el oficio de los empleados del departamento de Madrid
select Apellido, Oficio from EMP where DEPT_NO =
(select DEPT_NO FROM DEPT WHERE LOC='MADRID'); 
--Solo utilizar subconsultas cuando es ABSOLUTAMENTE NECESARIO. Mala PRAXIS, Si tienen relacion utilizar un JOIN SIEMPRE.
--Siempre el ultimo recurso, olvidaros de subconsultas.
--Asi se hace correctamente:
Select emp.Apellido, emp.oficio
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
WHERE DEPT.LOC= 'MADRID';

--Consultas union
--Muestran, en un mismo cursor, un mismo conjunto de resultados
--Estas consultas se utilizan como concepto, no como relacion
--Debemos seguir tres normas:
--1) La primera consulta es la jefa
--2) Todas las consultas deben tener el mismo numero de columnas
--3) Todas las columnas deben tener el mismo tipo de dato entre si
--En nuestra base de datos, tenemos datos de personas en diferentes tablas
--EMP, PLANTILLA Y DOCTOR
SELECT APELLIDO, OFICIO, SALARIO FROM EMP
UNION
SELECT APELLIDO, FUNCION, SALARIO FROM PLANTILLA
UNION
SELECT DNOMBRE, LOC, DEPT_NO FROM DEPT;
--Existe una jerarquia, la primera manda.
--Por supuesto, podemos ordenar sin problemas.
--En las consultas union deberiamos utilizar siempre numerando como recomiendacion. Si ponemos un alias, no funciona.
SELECT APELLIDO, OFICIO, SALARIO FROM EMP
UNION
SELECT APELLIDO, FUNCION, SALARIO FROM PLANTILLA
UNION
SELECT DNOMBRE, LOC, DEPT_NO FROM DEPT
order by SALARIO;
--Por supuesto, Tambien podemos filtrar los datos. Ejemplo:
--Mostrar los datos de las personas que cobren menos de 300.000
--CADA WHERE ES INDEPENDIENTE A SU CONSULTA.
SELECT APELLIDO, OFICIO, SALARIO FROM EMP
UNION
SELECT APELLIDO, FUNCION, SALARIO FROM PLANTILLA
UNION
SELECT Apellido, especialidad, salario from Doctor
where salario < 300000
ORDER BY 1;