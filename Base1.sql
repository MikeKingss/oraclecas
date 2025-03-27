---2. Mostrar el apellido, oficio, salario anual, con las dos extras para aquellos empleados
---con comisión mayor de 100000.
select Apellido, oficio, salario*14 as SALARIO_ANUAL FROM EMP where comision < 1000000;

---3. Idem del anterior, pero para aquellos empleados que su salario anual con extras supere las 750.000 €
Select Apellido, oficio, salario*14 + COMISION as SALARIO_MAS_COMISION FROM EMP where (SALARIO*14 + COMISION) > 750000;

-- 4. dem del anterior, pero para aquellos empleados que sumen entre salario anual conextras y comisión el 1000.000
Select Apellido, oficio, salario*14 + COMISION as SALARIO_MAS_COMISION FROM EMP where (SALARIO*14 + COMISION) > 1000000;

---5. Mostrar todos los datos de empleados ordenados por departamento y dentro de este por oficio para tener una visión jerárquica (order by)
Select * FROM EMP order by DEPT_NO, OFICIO;

-- 6. Mostrar todos los enfermos nacidos antes del 11/01/1970
Select APELLIDO from ENFERMO where fecha_nac < '11-01-1970';

--7.Igual que el anterior, para los nacidos antes del 1/1/1970 ordenados por número de inscripción.
Select APELLIDO from ENFERMO where fecha_nac < '1-1-1970' Order by inscripcion;

-- 8. Listar todos los datos de la plantilla del hospital del turno de mañana
Select * from PLANTILLA where turno = 'M';

-- 9 Idem del turno de noche.
Select * from PLANTILLA where turno = 'N';

-- 10. Listar los doctores que su salario anual supere 3.000.000 €.

SELECT APELLIDO,salario FROM DOCTOR WHERE SALARIO < 3000000;

-- 11. Visualizar los empleados de la plantilla del turno de mañana que tengan un salario entre 200000 y 225000.
SELECT APELLIDO FROM PLANTILLA WHERE TURNO = 'M' and SALARIO BETWEEN 200000 AND 225000;

-- 12. Visualizar los empleados de la tabla emp que no se dieron de alta entre el 01/01/1980 y el 12/12/1982.
SELECT * FROM EMP where FECHA_ALT NOT between '01-01-1986' and '12-12-1994';
SELECT * FROM EMP where FECHA_ALT between '01-01-1986' and '12-12-1994';



-- 13. Mostrar los nombres de los departamentos situados en Madrid o en Barcelona.
SELECT * FROM DEPT WHERE LOC in ('MADRID','BARCELONA');