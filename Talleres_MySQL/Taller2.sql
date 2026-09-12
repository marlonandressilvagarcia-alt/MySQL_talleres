CREATE TABLE Producto (
id_producto int primary key auto_increment,
nombre varchar(100) not null unique,
precio decimal(10,2),
categoria varchar(50)
);

CREATE table venta(
id_venta int primary key auto_increment,
id_producto int,
cantidad int,
fecha date,
foreign key (id_producto) references Producto (id_producto)
);

CREATE table productos_caros as
select nombre, precio from Producto where precio > 100000;

desc productos_caros;

SELECT p.nombre, UPPER(p.categoria) as categoria,
ROUND(p.precio, 0) as precio_red,
CONCAT(p.nombre, ' - ', p.categoria) as detalle from Producto p;

SELECT nombre, precio, 
IF (precio > 100000,
		'Premium', 'Estandar') as categoria_precio from Producto;
		
SELECT p.nombre as producto, 
UPPER(p.categoria) as categoria, 
v.cantidad, IF (v.cantidad > 50,
p.precio * 0.9, p.precio) as precio_final
from Producto p join venta v on p.id_producto = v.id_producto;