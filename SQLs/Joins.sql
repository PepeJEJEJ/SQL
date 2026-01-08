USE `profesores`;

select * from asignaturas;
select * from coordinadores;
select * from imparte;
select * from prepara;
select * from profesores;

-- 1. Muestra los datos de la asignatura y el dni del profe que la imparte
-- Aquí seleccionamos el dni del profesor y la descripción de la asignatura. 
-- Para ello hacemos un JOIN entre asignaturas (a) e imparte (i), 
-- relacionando a.codigo con i.asignatura.
select i.dni, a.descripcion from asignaturas a join imparte i on a.codigo=i.asignatura;

-- 2. Muestra los datos de los profes que imparten alguna asignatura
-- Aca seleccionamos a los profesores y usamos un join entre 
select * from profesores p join imparte i on p.dni=i.dni;

select * from profesores, asignaturas;
select * from profesores cross join imparte;