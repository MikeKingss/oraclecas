Select EMP.APELLIDO, EMP.OFICIO, DEPT.DNOMBRE, DEPT.LOC 
from EMP											
inner join DEPT										
on EMP.DEPT_NO = DEPT.DEPT_NO order by DEPT.LOC; 

Select DISTINCT DEPT_NO from EMP; 

Select * from DEPT; 

--Tenemos un departamento: 40, Produccion, Granada Sin Empleados
--Vamos a crear un nuevo empleado que no tenga departamento
--Tenemos un empleado sin departamento en el 50
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--left: Combina las dos tablas y tambien la tabla izquierda
--La tabla de la izquierda es antes del join
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP left 
join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

-- right: combina las dos tablas y tambien la tabla dderecha
-- La tabla de la derecha es despues del join.

select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from emp right 
join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--Full: Fuerza ambas tablas. Combina las dos tablas y tambien los datos que no combinen

select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP  
full join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

-- Cross: Producto Cartesiano. No lleva on
Select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
FROM EMP
cross join DEPT;

Rollback;

--Mostrar la media salarial de los doctores por hospital
select avg(SALARIO) as MEDIA, HOSPITAL_COD 
From Doctor
Group by HOSPITAL_COD;

--Mostrar la media salarial de los doctores por hospital mostrando el nombre del hospital.
select avg(doctor.SALARIO) as MEDIA, HOSPITAL.NOMBRE
From Doctor
INNER JOIN HOSPITAL
on doctor.hospital_cod = hospital.hospital_cod
GROUP BY HOSPITAL.NOMBRE;

--Mostrar el numero de empleados que existen por cada localidad
--tener en cuenta que count(*) cuenta los NULL. Ese 1 en granada es un null. Mejor poner una forma.
select Count(APELLIDO) as Personas, Dept.loc
From EMP
right JOIN DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
GROUP BY DEPT.LOC;