-- --------------------------------------------------------
-- Host:                         bbdd.dlsi.ua.es
-- Versión del servidor:         5.1.66-0+squeeze1 - (Debian)
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             7.0.0.4320
-- --------------------------------------------------------
-- Jose A.
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
Drop database if exists liga;
CREATE DATABASE `liga` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `liga`;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `web` varchar(250) DEFAULT 'sin web oficial',
  `puntos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Regal Barcelona','Barcelona','http://www.fcbarcelona.com/web/index_idiomes.html',10),(2,'Real Madrid','Madrid','http://www.realmadrid.com/cs/Satellite/es/1193040472450/SubhomeEquipo/Baloncesto.htm',9),(3,'P.E. Valencia','Valencia','http://www.valenciabasket.com/',11),(4,'Caja Laboral','Vitoria','http://www.baskonia.com/prehomes/prehomes.asp?id_prehome=69',22),(5,'Gran Canaria','Las Palmas','http://www.acb.com/club.php?id=CLA',14),(6,'CAI Zaragoza','Zaragoza','http://basketzaragoza.net/',23);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `posicion` varchar(45) DEFAULT NULL,
  `id_capitan` int(11) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `equipo` int(11) DEFAULT NULL,
  `altura` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `fequipo` (`equipo`),
  CONSTRAINT `fequipo` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Juan Carlos','Navarro','escolta',1,'2010-01-10 00:00:00',130000,1,'1.96'),(2,'Felipe','Reyes','Pivot',2,'2009-02-20 00:00:00',132000,2,'2.04'),(3,'Victor','Claver','Alero',3,'2009-03-08 00:00:00',99000,3,'2.08'),(4,'Rafa ','Martinez','ala-pivot',4,'2010-11-11 00:00:00',51000,3,'1.91'),(5,'Fernando','San Emeterio','Alero',6,'2008-09-22 00:00:00',60000,4,'1.99'),(6,'Mirza','Teletovic','Pivot',6,'2010-05-13 00:00:00',77000,4,'2.06'),(7,'Sergio ','Llull','Escolta',2,'2011-10-29 00:00:00',100000,2,'1.90'),(8,'Victor ','Sada','Base',1,'2012-01-01 00:00:00',80000,1,'1.92'),(9,'Carlos','Suarez','Alero',2,'2011-02-19 00:00:00',66000,2,'2.03'),(10,'Xavi ','Rey','Pivot',14,'2008-10-12 00:00:00',104500,5,'2.09'),(11,'Carlos ','Cabezas','Base',13,'2012-01-21 00:00:00',105000,6,'1.86'),(12,'Pablo ','Aguilar','Alero',13,'2011-06-14 00:00:00',51700,6,'2.03'),(13,'Rafa','Hettsheimeir','Pivot',13,'2008-04-15 00:00:00',58300,6,'2.08'),(14,'Sitapha','Savané','Pivot',14,'2011-07-27 00:00:00',66000,5,'2.01'),(15,'anonimo','anonimo','Ala-pivot',2,'2012-01-01 00:00:00',4000,3,'2.00'),(22,'j1',NULL,NULL,NULL,NULL,NULL,2,'2.00'),(23,'j2',NULL,NULL,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `local` int(11) NOT NULL,
  `visitante` int(11) NOT NULL,
  `resultado` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `arbitro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `flocal` (`local`),
  KEY `fvisitante` (`visitante`),
  CONSTRAINT `flocal` FOREIGN KEY (`local`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fvisitante` FOREIGN KEY (`visitante`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,1,2,'100-100','2011-10-10','4\r'),(2,2,3,'90-91','2011-11-17','5\r'),(3,3,4,'88-77','2011-11-23','6\r'),(4,1,6,'66-78','2011-11-30','6\r'),(5,2,4,'90-90','2012-01-12','7\r'),(6,4,5,'79-83','2012-01-19','3\r'),(7,3,6,'91-88','2012-02-22','3\r'),(8,5,4,'90-66','2012-04-27','2\r'),(9,6,5,'110-70','2012-05-30','1'),(10,3,5,'88-77','2011-09-01','2');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;


-- Consultas:
-- PRIMERA RELACIÓN – Consultas básicas:

-- 1 Obtener los datos de los jugadores del equipo 3 ordenados por su apellido.
select * from jugador where equipo = 3 order by apellido;

-- 2 Jugadores que sean escolta o alero.
select * from jugador where posicion in ('escolta','alero');

-- 3 Jugadores con salarios entre 60.000 y 100.000
select * from jugador where salario between 60000 and 100000;

-- 4 Obtener los datos de los jugadores que sean pívot ordenados por su identificador.
select * from jugador where posicion = 'pivot' order by id_jugador;

-- 5 Seleccionar los datos de los jugadores que midan más de dos metros y ganen al menos 50.000 euros.
select * from jugador where altura > 2.00 and salario >= 50000;

-- 6 Seleccionar el nombre de los jugadores que jueguen como pívot y ganen más de 100.000 euros.
select nombre from jugador where posicion = 'pivot' and salario > 100000;

-- 7 Seleccionar el nombre de los jugadores de los equipos 1 y 2 que jueguen como base.
select nombre from jugador where equipo in (1,2) and posicion = 'base';

-- Ej 8. datos de jugadores de equipos 1 y 2 con más de 80.000 euros
select * from jugador where equipo in (1,2) and salario > 80000;

-- Ej 9. posiciones diferentes en la liga
select distinct posicion from jugador;

-- Ej 10. los 5 jugadores más altos
select * from jugador order by altura desc limit 5;

-- Ej 11. salario neto anual (irpf 18%)
select nombre, salario, salario*12*0.82 as salario_neto_anual from jugador;

-- Ej 12. jugadores con salario neto anual >= 70.000
select * from jugador where salario*12*0.82 >= 70000;

-- Ej 13. jugadores sin posición asignada
select * from jugador where posicion is null;

-- Ej 14. partidos jugados antes de 2012
select * from partido where fecha < '2012-01-01';

-- Ej 15. jugadores que midan más de 1.90 y cobren más de 100.000
select * from jugador where altura > 1.90 and salario > 100000;

-- SEGUNDA RELACIÓN – Consultas de agregación y agrupación:

-- Ej 16. salario medio de todos los jugadores
select avg(salario) as salario_medio from jugador;

-- Ej 17. suma de alturas por equipo > 5 metros
select equipo, sum(altura) as suma_alturas from jugador group by equipo having sum(altura) > 5;

-- Ej 18. cuántos jugadores miden más de dos metros
select count(*) as jugadores_altos from jugador where altura > 2.00;

-- Ej 19. número de jugadores por posición en cada equipo
select equipo, posicion, count(*) as cantidad from jugador group by equipo, posicion;

-- Ej 20. salario total por equipo con más de 4 jugadores
select equipo, sum(salario) as salario_total from jugador group by equipo having count(*) > 4;

-- Ej 21. número de ciudades distintas con equipos
select count(distinct ciudad) as num_ciudades from equipo;

-- Ej 22. salario máximo, mínimo y diferencia por equipo
select equipo, max(salario) as maximo, min(salario) as minimo, max(salario)-min(salario) as diferencia from jugador group by equipo;

-- Ej 23. salario medio por equipo > 100.000
select equipo, avg(salario) as salario_medio from jugador group by equipo having avg(salario) > 100000;

-- Ej 24. número de jugadores por equipo
select equipo, count(*) as num_jugadores from jugador group by equipo;

-- Ej 25. altura media por equipo
select equipo, avg(altura) as altura_media from jugador group by equipo;

-- Ej 26. salario total por equipo
select equipo, sum(salario) as salario_total from jugador group by equipo;

-- Ej 27. equipos con altura media > 2 metros
select equipo, avg(altura) as altura_media from jugador group by equipo having avg(altura) > 2.00;

-- Ej 28. jugador más alto por equipo
select equipo, max(altura) as jugador_mas_alto from jugador group by equipo;