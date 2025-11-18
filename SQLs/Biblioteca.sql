Drop Database if exists biblioteca;
Create Database biblioteca;
use biblioteca;

create table Libro (
	ISBN varchar (10) Primary Key,
    titulo varchar (100) not null,
    anio date not null,
    Direccion varchar (100) not null,
	Autor varchar (9)
);

create table Socio (
	cod_socio int (5) Primary Key,
    nombre varchar (15) not null,
    apellidos varchar (20) not null,
	telefono int (9)
);

create table Prestamo (
	codigo int (7) auto_increment Primary Key,
    fecha_prestamo date not null,
	fecha_prestamo date not null,
	libro int (9)
);

create table Prestamo (
	cod_autor int (5) auto_increment Primary Key,
	nombre int (50) not null
);