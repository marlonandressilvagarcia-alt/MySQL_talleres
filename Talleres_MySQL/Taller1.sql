CREATE DATABASE Taller1;
use Taller1;
USE Taller1;

CREATE TABLE Productos (
     id_producto INT PRIMARY KEY,
     nombre VARCHAR(100),
     categoria VARCHAR(100),
     precio DECIMAL(10,2),
     stock INT);
    
ALTER TABLE Productos MODIFY COLUMN nombre VARCHAR(100) NOT NULL UNIQUE,
     MODIFY COLUMN precio decimal(10,2) NOT NULL,
     MODIFY COLUMN stock INT NOT NULL CHECK (stock >= 0),
     MODIFY COLUMN categoria VARCHAR(100) NOT NULL;

ALTER TABLE Productos MODIFY COLUMN id_producto INT AUTO_INCREMENT;

CREATE TABLE Clientes (
     id_cliente INT PRIMARY KEY AUTO_INCREMENT,
     nombre VARCHAR(100) NOT NULL UNIQUE,
     email VARCHAR(100) NOT NULL,
     ciudad VARCHAR(80) NOT NULL,
     telefono VARCHAR(20) NOT NULL);
    
CREATE TABLE Ventas (
     id_venta INT PRIMARY KEY AUTO_INCREMENT,
     id_cliente INT,
     id_producto INT,
     cantidad INT NOT NULL,
     fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto));
   
   desc Productos;    
  INSERT INTO Productos (nombre, categoria, precio, stock) VALUES
('Teclado Mecánico RGB', 'periferico', 180000.00, 25),
('Ratón Gamer 16000 DPI', 'periferico', 120000.00, 30),
('Monitor Gaming 27 IPS 165Hz', 'monitores', 1100000.00, 10),
('PC Gamer Ryzen 7 16GB RTX 4060', 'computadoras', 4500000.00, 5),
('SSD NVMe M.2 1TB', 'almacenamiento', 320000.00, 40),
('Tarjeta de Video RTX 4070 12GB', 'componentes', 3200000.00, 8),
('Audífonos Gamer 7.1 Surround', 'audio', 220000.00, 18),
('Soporte Ajustable para Laptop', 'accesorios', 85000.00, 50);

desc Productos;
SELECT * FROM Productos; 
desc Clientes;

INSERT INTO Clientes (nombre, email, ciudad, telefono) VALUES
('Carlos Mendoza', 'carlos.mendoza@email.com', 'Bogotá', '3001234567'),
('Laura Gómez', 'laura.gomez@email.com', 'Medellín', '3119876543'),
('Andrés Torres', 'andres.torres@email.com', 'Bogotá', '3155551234'),
('Mariana Ríos', 'mariana.rios@email.com', 'Cali', '3204448899'),
('Felipe Morales', 'felipe.morales@email.com', 'Medellín', '3187773322'),
('Sofia Benítez', 'sofia.benitez@email.com', 'Bogotá', '3026669911');

SELECT * FROM Clientes;

desc Ventas;

INSERT INTO Ventas (id_cliente, id_producto, cantidad) VALUES
(1, 1, 2), 
(1, 5, 1),
(2, 3, 1), 
(2, 7, 1), 
(3, 2, 1), 
(3, 8, 2), 
(4, 5, 2), 
(4, 1, 1), 
(5, 4, 1), 
(5, 6, 1),
(6, 7, 3), 
(1, 8, 1); 

SELECT * FROM Ventas;

SELECT * FROM Productos;

UPDATE Productos SET precio = 200000 WHERE id_producto = 1;

SELECT * FROM Productos;


INSERT INTO Productos (nombre, categoria, precio, stock) values
('Monitor Gaming 30 IPS 160Hz', 'monitores', 1500000.00, 10);

SELECT * FROM Productos;

DELETE FROM Productos WHERE id_producto = 9;

SELECT * FROM Productos;

SELECT nombre, precio AS precio_cop 
FROM Productos;

SELECT * FROM Productos;

SELECT nombre from Productos WHERE precio < 500000 and categoria = "periferico";

SELECT nombre from Productos where precio > 500000 and precio < 5000000;

SELECT nombre from Productos where categoria = "periferico";

SELECT nombre from Productos where nombre = 'Audífonos Gamer 7.1 Surround';

SELECT nombre, categoria, precio, stock 
FROM Productos 
ORDER BY precio ASC;

SELECT nombre, categoria, precio, stock 
FROM Productos 
ORDER BY stock DESC;

SELECT nombre, categoria, precio, stock 
FROM Productos 
WHERE precio > 100000 
ORDER BY stock DESC;






















































