USE TiendaTecnologia;

-- Pepe
-- 1. Productos ordenados por precio
SELECT * FROM Productos ORDER BY Precio;

-- Pepe
-- 2. Pedidos con estado 'Pendiente'
SELECT * FROM Pedidos WHERE Estado = 'Pendiente';

-- Pepe
-- 3. Productos con precio mayor a 500
SELECT Id_fab, Id_categoria, Descripcion, Precio, Existencias 
FROM Productos 
WHERE Precio > 500;

-- Pepe
-- 4. Clientes cuyo teléfono contiene '56'
SELECT Nombre FROM Clientes WHERE Telefono LIKE '%56%';

-- Pepe
-- 5. Estados de todos los pedidos
SELECT Estado FROM Pedidos;

-- Pepe
-- 6. Pedidos realizados en enero (mes 1)
SELECT * FROM Pedidos WHERE MONTH(Fecha_pedido) = 1;

-- Pepe
-- 7. Clientes con ubicación concatenada (Dirección-Ciudad)
SELECT Id_cliente, Nombre, UPPER(CONCAT(Direccion, '-', Ciudad)) AS Ubicacion FROM Clientes;

-- 8. Clientes con ubicación concatenada (Dirección-Ciudad)
Select min(fecha_pedido) as pedido_antiguo from pedidos;

-- 9.
Select pais,count(*) from fabricantes group by pais;