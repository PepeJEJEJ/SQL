USE `liga`;

-- 1. Datos del jugador más alto de la liga.
SELECT * FROM jugador WHERE altura = (SELECT MAX(altura) FROM jugador);

-- 2. Datos de todos los jugadores que pertenecen al Caja Laboral.
SELECT j.* FROM jugador j JOIN equipo e ON j.equipo = e.id_equipo WHERE e.nombre = 'Caja Laboral';

-- 3. Suma de las alturas de los jugadores que sean del CAI Zaragoza o del Real Madrid.
SELECT SUM(j.altura) FROM jugador j JOIN equipo e ON j.equipo = e.id_equipo WHERE e.nombre IN ('CAI Zaragoza','Real Madrid');

-- 4. Datos de los jugadores que miden más que todos los jugadores del Caja Laboral.
SELECT * FROM jugador j WHERE j.altura > (SELECT MAX(j2.altura) FROM jugador j2 JOIN equipo e2 ON j2.equipo = e2.id_equipo WHERE e2.nombre = 'Caja Laboral');

-- 5. Datos de los jugadores mejor pagado y peor pagado de la liga.
SELECT * FROM jugador WHERE salario IN ((SELECT MAX(salario) FROM jugador),(SELECT MIN(salario) FROM jugador WHERE salario IS NOT NULL));

-- 6. Datos del jugador más antiguo.
SELECT * FROM jugador WHERE fecha_alta = (SELECT MIN(fecha_alta) FROM jugador WHERE fecha_alta IS NOT NULL);

-- 7. Datos de los equipos que tienen más de tres jugadores registrados.
SELECT e.* FROM equipo e JOIN jugador j ON j.equipo = e.id_equipo GROUP BY e.id_equipo HAVING COUNT(j.id_jugador) > 3;

-- 8. Nombre del jugador, nombre del equipo y su posición.
SELECT j.nombre, e.nombre, j.posicion FROM jugador j JOIN equipo e ON j.equipo = e.id_equipo;

-- 9. Nombre de cada equipo y el nombre de su capitán o capitanes.
SELECT e.nombre, c.nombre FROM equipo e JOIN jugador c ON c.equipo = e.id_equipo AND c.id_jugador = c.id_capitan;

-- 10. Datos de los equipos y el número de partidos que han jugado como locales.
SELECT e.*, COUNT(p.id_partido) FROM equipo e LEFT JOIN partido p ON e.id_equipo = p.local GROUP BY e.id_equipo;

-- 11. Datos de los jugadores cuyos equipos hayan jugado al menos tres partidos como visitantes.
SELECT j.* FROM jugador j WHERE j.equipo IN (SELECT p.visitante FROM partido p GROUP BY p.visitante HAVING COUNT(*) >= 3);

-- 12. Datos de los equipos y el salario máximo de sus jugadores.
SELECT e.*, MAX(j.salario) FROM equipo e LEFT JOIN jugador j ON j.equipo = e.id_equipo GROUP BY e.id_equipo;

-- 13. Datos de los equipos que hayan jugado algún partido contra el Valencia en casa.
SELECT DISTINCT e.* FROM equipo e JOIN partido p ON e.id_equipo = p.local WHERE p.visitante = (SELECT id_equipo FROM equipo WHERE nombre = 'P.E. Valencia');

-- 14. Datos de los jugadores de equipos que hayan jugado algún partido contra el Valencia en casa.
SELECT j.* FROM jugador j WHERE j.equipo IN (SELECT p.local FROM partido p WHERE p.visitante = (SELECT id_equipo FROM equipo WHERE nombre = 'P.E. Valencia'));

-- 15. Datos de los equipos que no tienen ningún jugador registrado.
SELECT e.* FROM equipo e LEFT JOIN jugador j ON j.equipo = e.id_equipo WHERE j.equipo IS NULL;

-- 16. Salario medio de los jugadores de cada equipo.
SELECT e.nombre, AVG(j.salario) FROM equipo e LEFT JOIN jugador j ON j.equipo = e.id_equipo GROUP BY e.id_equipo, e.nombre;

-- 17. Datos de los jugadores que cobran más que la media salarial de su equipo.
SELECT j.* FROM jugador j WHERE j.salario > (SELECT AVG(j2.salario) FROM jugador j2 WHERE j2.equipo = j.equipo);
