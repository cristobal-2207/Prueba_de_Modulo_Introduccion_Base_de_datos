-- Prueba
-- Para realizar esta prueba debes haber estudiado previamente todo el material disponibilizado en
-- las sesiones online y presenciales correspondiente al módulo.
-- Una vez terminada la prueba, comprime la carpeta y sube el .zip

-- Descripción
-- En el siguiente caso, se deberá modelar la siguiente problematica, revisar que el modelo haya
-- quedado en 3FN, para luego pasar a crear el modelo en la base de datos, poblar la base de datos y
-- finalmente realizar consultas sobre la misma. Para realizar los diagramas se recomienda utilizar http://
-- draw.io

-- Parte 1: Crear modelo lógico para el siguiente caso.
-- Una Factura pertenece a un cliente
-- El cliente tiene id, nombre, rut y dirección
-- Una factura tiene numero de factura, fecha de la factura, subtotal, iva y precio total
-- Una factura tiene un listado de productos, con su precio unitario, cantidad, y valor total por
-- producto.
-- Para la factura se deberá almacenar el subtotal de la factura, que corresponde a la suma de
-- todos los valores unitarios multiplicado por la cantidad respectiva.
-- Cada producto tiene un id, un nombre, descripción y un valor unitario
-- Cada producto pertenece a una categoría, la cual tiene un id, el nombre de la categoría y una
-- descripción.

-- Parte 2: Creando el modelo en la base de datos
-- Se debe crear el modelo en la base de datos, en una base de datos llamada prueba , e insertar los siguientes registros:

-- 5 clientes
-- 8 productos
-- 3 categorias
-- 10 facturas
-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto
-- Parte 3: Consultas
-- Realizar las siguientes consultas:
-- ¿Que cliente realizó la compra más cara?
-- ¿Que cliente pagó sobre 100 de monto?
-- ¿Cuantos clientes han comprado el producto 6.