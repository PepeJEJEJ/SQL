USE `profesores`;

select * from asignaturas;
select * from coordinadores;
select * from imparte;
select * from prepara;
select * from profesores;

-- Muestra los datos de la asignatura y el dni del profe que la imparte

select i.dni, a.descripcion from asignaturas a join imparte i on a.codigo=i.asignatura;

-- 