DROP TABLE IF EXISTS EMPLOYEES;
SHOW TABLES;

CREATE TABLE productos(
id_productos int PRIMARY KEY auto_increment,
nombre varchar(100) not null unique,
precio decimal(10,2) not null,
stock int not null check (stock >=0),
id_categoria int,
fecha_registro date default (current_date),
foreign key (id_categoria)
	references categorias(id_categoria)
);

CREATE TABLE categorias(
id_categoria int primary key
);


create table clientes(
id_cliente int,
nombre varchar(100),
email varchar(150),
ciudad varchar(60),
fecha_registro date,
acepta_promociones BOOL
);
 CREATE table empleados(
 id_empleado int primary key auto_increment,
 nombre varchar(100) not null,
 email varchar(150) unique,
 salario decimal(10,2) check (salario >=0),
 id_departamento int,
 fecha_contratacion date default (current_date),
 foreign key(id_departamento) references departamentos(id_departamento)
 );
 
 CREATE table departamentos(
 id_departamento int primary key auto_increment,
 nombre varchar(80) not null
 );

 
ALTER table empleados 
	add column correo_corporativo varchar(150);


create table productos_prueba(
id_prdct_prueba int primary key auto_increment
);

DROP table productos_prueba; 

alter table clientes add column telefono varchar(20);

INSERT
into productos(nombre, precio, stock, id_categoria)
values('refrigerador inverter 400l', 1899.90, 15, 3);

UPDATE productos SET stock = stock -1 where id_productos = 1;

SELECT * FROM productos;

UPDATE productos SET precio = 549.00 WHERE id_productos = 310;
DELETE FROM productos WHERE id_productos = 118;

SELECT nombre, stock, precio
from productos 
WHERE stock < 10
ORDER BY stock ASC ;

SELECT nombre, fecha_registro
from clientes 
WHERE ciudad = 'Bogotá'
ORDER BY fecha_registro DESC 
limit 5;

CREATE table ventas(
id_venta int primary key auto_increment,
fecha date,
total int
);

SELECT id_venta, fecha, total
FROM ventas
WHERE total > 500000
  AND fecha BETWEEN '2026-01-01' AND '2026-01-31'
ORDER BY fecha;

SELECT nombre, precio, categoria
FROM productos
WHERE categoria IN ('Electrodomésticos', 'Tecnología')
  AND nombre LIKE '%Smart%';
 
 SELECT
  id_empleado,
  COUNT(*)   AS num_ventas,
  SUM(total) AS total_vendido
FROM ventas
GROUP BY id_empleado
ORDER BY total_vendido DESC;

SELECT
  id_categoria,
  AVG(precio) AS precio_promedio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio) > 300000;





























 
 
 
 
 
 
 
 
 
 
 
 