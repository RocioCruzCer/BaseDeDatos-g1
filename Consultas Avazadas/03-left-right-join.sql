CREATE DATABASE pruebajoinsg1;

use pruebajoinsg1;

CREATE TABLE proveedor (
    provid INT NOT NULL  IDENTITY(1,1),
    nombre VARCHAR(50) not NULL,
    limite_crédito money NOT NULL
    CONSTRAINT pk_proveedor
    PRIMARY KEY (provid),
    CONSTRAINT unico_nombrepro
    UNIQUE(nombre)

);

CREATE TABLE productos (
    productid int not NULL IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    precio money not null,
    existencia int not null,
    proveedor int,
    CONSTRAINT pk_producto
    PRIMARY KEY(productid),
    CONSTRAINT unico_nombre_proveedor
    UNIQUE(nombre),
    CONSTRAINT fk_proveedor_producto
    FOREIGN KEY(proveedor)
    REFERENCES proveedor(provid)
)

--agregar registros a las tablas proveedor y producto

INSERT INTO proveedor(nombre, limite_crédito)
VALUES 
('Proveedor1', 5000),
('Proveedor2', 6778),
('Proveedor3', 6788),
('Proveedor4', 5677),
('Proveedor5', 6666);

select * FROM proveedor;

INSERT INTO productos(nombre, precio, existencia, proveedor)
VALUES
('Producto1', 56, 34, 1),
('Producto2', 56, 56, 12, 1),
('Producto3', 45, 6, 33, 2),
('Producto4', 22, 34, 666, 3);

SELECT * FROM productos;

SELECT * FROM
proveedor as p 
INNER JOIN productos as pr 
on pr.proveedor = p.provid