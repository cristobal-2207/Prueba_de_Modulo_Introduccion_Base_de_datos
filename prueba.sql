-- Prueba
-- Para realizar esta prueba debes haber estudiado previamente todo el material disponibilizado en
-- las sesiones online y presenciales correspondiente al módulo.
-- Una vez terminada la prueba, comprime la carpeta y sube el .zip

-- Descripción
-- En el siguiente caso, se deberá modelar la siguiente problematica, revisar que el modelo haya quedado en 3FN, para luego pasar a crear el modelo en la base de datos, poblar la base de datos y finalmente realizar consultas sobre la misma. Para realizar los diagramas se recomienda utilizar http://draw.io

-- Parte 1: Crear modelo lógico para el siguiente caso.
-- Una Factura pertenece a un cliente.
-- El cliente tiene id, nombre, rut y dirección.
-- Una factura tiene numero de factura, fecha de la factura, subtotal, iva y precio total.
-- Una factura tiene un listado de productos, con su precio unitario, cantidad, y valor total por producto.
-- Para la factura se deberá almacenar el subtotal de la factura, que corresponde a la suma de todos los valores unitarios multiplicado por la cantidad respectiva.
-- Cada producto tiene un id, un nombre, descripción y un valor unitario.
-- Cada producto pertenece a una categoría, la cual tiene un id, el nombre de la categoría y una descripción.


-- Parte 2: Creando el modelo en la base de datos.

-- Se debe crear el modelo en la base de datos, en una base de datos llamada prueba , e insertar los siguientes registros:
CREATE DATABASE prueba;
\c prueba

CREATE TABLE clientes(
    id INT PRIMARY KEY,
    name_cliente VARCHAR (30),
    rut_cliente VARCHAR (30),
    direccion_cliente VARCHAR (30)
);
CREATE TABLE categorias_productos(
    id INT PRIMARY KEY,
    name_Categoria_producto VARCHAR (30),
    descripcion_Categoria_producto VARCHAR (100)
);
CREATE TABLE facturas(
    id INT PRIMARY KEY,
    fecha_factura DATE,
    sub_total FLOAT,
    iva FLOAT,
    precio_Total FLOAT,
    id_Cliente INT,
    FOREIGN KEY (id_Cliente) REFERENCES clientes (id)
);
CREATE TABLE productos(
    id INT PRIMARY KEY,
    name_Producto VARCHAR (30),
    descripcion_Producto VARCHAR (100),
    valor_Unitario_Producto FLOAT,
    id_Categoria INT,
    FOREIGN KEY (id_Categoria) REFERENCES categorias_productos (id)
);
CREATE TABLE factura_Con_productos(
    id INT,
    FOREIGN KEY (id) REFERENCES facturas (id),
    id_productos INT,
    FOREIGN KEY (id_productos) REFERENCES productos (id),
    cantidad_Producto INT
);

-- 5 clientes
--1er Cliente
INSERT INTO clientes(id, name_cliente, rut_cliente, direccion_cliente) VALUES(11,'Cristóbal Paredes','16920292','Javiera Carrera #50');

--2do Cliente
INSERT INTO clientes(id, name_cliente, rut_cliente, direccion_cliente) VALUES(12,'Antonella Paredes','17920292','Templo Votivo #441');

--3er Cliente
INSERT INTO clientes(id, name_cliente, rut_cliente, direccion_cliente) VALUES(13,'Diego Riquelme','18920292','Dorsal #6252');

--4to Cliente
INSERT INTO clientes(id, name_cliente, rut_cliente, direccion_cliente) VALUES(14,'Paulina Rubio','20920292','Las Coimas #999');

--5to Cliente
INSERT INTO clientes(id, name_cliente, rut_cliente, direccion_cliente) VALUES(15,'Veronica Poblete','21920292','Sarmiento #110');


-- 8 productos
--Producto 1
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(21,'Telefono móvil','Telefono inteligente', 100);

--Producto 2
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(22,'Televisor','Televisor inteligente', 400);

--Producto 3
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(23,'Micro ondas','Micro ondas de aluminio', 40);

--Producto 4
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(24,'Refrigerador','Refrigerador con filtro carbon', 150);

--Producto 5
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(25,'Cama','Cama tamaño king', 600);

--Producto 6
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(26,'Sábanas','Sábanas tamaño king', 60);

--Producto 7
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(27,'Comedor','Comedor para 6 personas con sillas', 500);

--Producto 8
INSERT INTO productos(id, name_Producto, descripcion_Producto, valor_Unitario_Producto) VALUES(28,'Individuales','Individuales de cuero para comedor de 6 personas', 60);

-- 3 categorias

--Categoría 1
INSERT INTO categorias_productos(id,name_Categoria_producto, descripcion_Categoria_producto) VALUES (31,'Tecnología Smart','Lorem Ipsum is simply.');

--Categoría 2
INSERT INTO categorias_productos(id,name_Categoria_producto, descripcion_Categoria_producto) VALUES (32,'Cocina','Lorem Ipsum is simply.');

--Categoría 3
INSERT INTO categorias_productos(id,name_Categoria_producto, descripcion_Categoria_producto) VALUES (33,'Dormitorio y Living','Lorem Ipsum is simply dummy.');

-- 10 facturas
-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto

-- Para el cliente 1: 2 facturas con 2 y 3 productos.
--Factura 1, con 2 productos:
INSERT INTO facturas(id,fecha_factura,sub_total,iva,precio_Total,id_Cliente) VALUES(1,'2020-06-27',500,0.19,595,11);
INSERT INTO factura_Con_productos(id,id_productos,cantidad_Producto) VALUES(1,21,1), (1,22,1);

--Factura 2, con 3 productos:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(2,'2020-06-28', 790, 0.19, 940.1, 11);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(2, 23, 1),(2, 24, 1),(2, 25, 1);

--Para el Cliente 2: 3 facturas con 3, 2 y 3 productos.
--Factura 1, con 3 productos:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(3,'2020-06-29', 620, 0.19, 737.8, 12);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(3, 26, 1), (3, 27, 1), (3, 28, 1);
--Factura 2, con 2 productos:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(4,'2020-06-30', 500, 0.19, 595, 12);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(4, 21, 1),(4, 22, 1);
--Factura 3, con 3 productos:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(5,'2020-07-01', 790, 0.19, 940.1, 12);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(5, 23, 1), (5, 24, 1), (5, 25, 1);

--Para el Cliente 3: 1 factura con 1 producto.
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(6,'2020-07-01', 60, 0.19, 71.4, 13);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(6, 26, 1);

--Para el Cliente 4: 4 facturas con 2, 3, 4 y 1 producto.
--Factura 1, con 2 productos:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(7,'2020-07-02', 500, 0.19, 595, 14);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(7, 21, 1), (7, 22, 1);
--Factura 2, con 3 productos:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(8,'2020-07-03', 790, 0.19, 940.1, 14);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(8, 23, 1), (8, 24, 1), (8, 25, 1);
--Factura 3, con 4 productos:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(9,'2020-07-04', 850, 0.19, 1011.5, 14);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(9, 23, 1), (9, 24, 1), (9, 25, 1), (9, 26, 1);
--Factura 4, con 1 producto:
INSERT INTO facturas(id, fecha_factura, sub_total, iva, precio_Total, id_Cliente) VALUES(10,'2020-07-05', 60, 0.19, 71.4, 14);
INSERT INTO factura_Con_productos(id, id_productos, cantidad_Producto) VALUES(10, 26, 1);


-- Parte 3: Consultas
-- Realizar las siguientes consultas:

-- ¿Que cliente realizó la compra más cara?
SELECT name_cliente FROM clientes
JOIN facturas ON clientes.id=facturas.id_Cliente 
WHERE facturas.precio_Total=(SELECT MAX(precio_Total) FROM facturas);

-- ¿Que cliente pagó sobre 1000 de monto?
SELECT DISTINCT name_cliente FROM clientes
JOIN facturas ON clientes.id=facturas.id_Cliente 
WHERE facturas.precio_total>1000;

-- ¿Cuantos clientes han comprado el producto 26.
SELECT DISTINCT count(name_cliente) FROM clientes
JOIN facturas ON clientes.id=facturas.id_Cliente 
JOIN factura_Con_productos ON facturas.id=factura_Con_productos.id 
WHERE factura_Con_productos.id_productos=26;