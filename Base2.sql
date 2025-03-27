---1. Encontrar el salario medio de los analistas, mostrando el número de los empleados con oficio analista.
select count(*) as NUMEROEMPLEADOS, oficio,
avg(salario) as SALARIOMEDIO from 
emp group by oficio having oficio ='ANALISTA';

--2. Encontrar el salario más alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO.
select max(salario) as MAXSALARIO, min(salario) as MINSALARIO, max(SALARIO) - MIN(SALARIO) as DIFERENCIA from 
EMP group by oficio having oficio = 'EMPLEADO';

--3. Visualizar los salarios mayores para cada oficio.	
select oficio, max(salario) as SALARIOMAXIMO from emp group by oficio;

--4. Visualizar el número de personas que realizan cada oficio en cada departamento ordenado por departamento.
select oficio, count(*) as Personas, DEPT_NO from EMP 
group by DEPT_NO,OFICIO order by 3;

--5. Buscar aquellos departamentos con cuatro o más personas trabajando.
select count(*) as Personas, DEPT_NO from EMP
group by DEPT_NO having count(DEPT_NO) >= 4;

--6. Mostrar el número de directores que existen por departamento.

select count(*) as NUMEROEMPLEADOS, dept_no 
from emp
where oficio = 'DIRECTOR'
group by dept_no;

-- 7. Visualizar el número de enfermeros, enfermeras e interinos que hay en la plantilla, ordenados por la función.
select count(FUNCION) as TRABAJADORES, FUNCION from PLANTILLA 
GROUP BY FUNCION having FUNCION in ('ENFERMERO','ENFERMERA','INTERINO');

--8. Visualizar departamentos, oficios y número de personas, para aquellos departamentos que tengan dos o más personas trabajando en el mismo oficio.
select count(*) as Personas, DEPT_NO, OFICIO from EMP 
GROUP BY OFICIO, DEPT_NO having count(oficio) > 2;

--10. Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala y el número de cada una de ellas.
SELECT AVG(NUM_CAMA) as MEDIA_CAMAS, count(*) as NUMERO, NOMBRE from SALA
GROUP BY Nombre;

--11. Calcular el salario medio de la plantilla de la sala 6, según la función que realizan. Indicar la función y el número de empleados.
select avg(salario) as SALARIO_MEDIO, FUNCION, SALA_COD, count(*) as PERSONAS from PLANTILLA
GROUP BY FUNCION,SALA_COD;

--ALT 11. Calcular el salario medio de la plantilla de la sala 6, segun la funcion que realizan. Indicar la funcion y el numero de empleados.
SELECT FUNCION, COUNT(*) as PERSONAS FROM PLANTILLA where SALA_COD = 6
GROUP BY FUNCION;

--12. Averiguar los últimos empleados que se dieron de alta en la empresa en cada uno de los oficios, ordenados por la fecha.
select max(fecha_alt) AS FECHAMAXIMA, 
Oficio from emp
group by oficio
order by 1;

--13. Mostrar el número de hombres y el número de mujeres que hay entre los enfermos.
Select count(*) as ENFERMOS, SEXO
from ENFERMO
GROUP BY SEXO;

--14. Mostrar la suma total del salario que cobran los empleados de la plantilla para cada función y turno.
select funcion, Turno
, sum(salario) as SUMASALARIAL 
from plantilla group by funcion, Turno;

--15. Calcular el número de salas que existen en cada hospital.
select count(*) as numero_salas, hospital_cod 
from SALA
group by HOSPITAL_COD;

--16. Mostrar el número de enfermeras que existan por cada sala.
select count(*) as ENFERMERAS, SALA_COD from PLANTILLA
where FUNCION = 'ENFERMERA'
GROUP BY SALA_COD;