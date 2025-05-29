RESUMEN DE RELACIONES

Stock se relaciona con Empleados (quién lo registró).
Stock se relaciona con Precio (cuánto cuesta ese producto).
Empleados se relacionan con Sucursales (dónde trabajan).

-- Tabla de Sucursales
CREATE TABLE Sucursales (
id_Sucursales  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
Pais VARCHAR(100),
Ciudad VARCHAR(100),
Horario_abierto TIME,
Horario_cerrado TIME);

INSERT INTO Sucursales (Pais, Ciudad, Horario_abierto, Horario_cerrado)
VALUES('Argentina', 'Buenos Aires', '10:00', '22:00'),
      ('Argentina', 'Córdoba', '11:00', '23:00');
      ('Argentina', 'Rosario', '08:00', '17:00'),
      ('Chile', 'Valparaíso', '09:00', '18:00'),
      ('Uruguay', 'Punta del Este', '08:30', '17:30'),
      ('Paraguay', 'Ciudad del Este', '09:00', '18:00'),
      ('Perú', 'Arequipa', '08:00', '16:00'),
      ('Bolivia', 'Cochabamba', '10:00', '19:00'),
      ('Brasil', 'Rio de Janeiro', '08:00', '17:00'),
      ('Colombia', 'Medellín', '09:00', '18:00');



-- Tabla de Empleados
CREATE TABLE Empleados (
    id_Empleados INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Email VARCHAR(100),
    Numero INT,
    id_Sucursales INT,
    CONSTRAINT fk_empleado_sucursal
    FOREIGN KEY (id_Sucursales) REFERENCES Sucursales(id_Sucursales)
);

INSERT INTO Empleados (Nombre, Apellido, Email, Numero, id_Sucursales)
VALUES('Valentin', 'Velazquez', 'valesergiovelazquez@gmail.com', 1161138645, 1),
      ('Lian', 'Leyenda', 'leyendita78@gmail.com', 1157368754, 2);
      ('Bruno', 'Morales', 'bruno.morales@mail.com', '1160012233', 10),
      ('Renata', 'Vega', 'renata.vega@mail.com', '1160012234', 9),
      ('Elías', 'Castro', 'elias.castro@mail.com', '1160012235', 3),
      ('Mía', 'Silva', 'mia.silva@mail.com', '1160012236', 7),
      ('Gael', 'Rojas', 'gael.rojas@mail.com', '1160012237', 8),
      ('Catalina', 'Navarro', 'catalina.navarro@mail.com', '1160012238', 3),
      ('Facundo', 'Mendoza', 'facundo.mendoza@mail.com', '1160012239', 6),
      ('Isabela', 'Cabrera', 'isabela.cabrera@mail.com', '1160012240', 5);



-- Tabla de Stock
CREATE TABLE Stock (
    id_Stock INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Distribuidora VARCHAR(100),
    Ingreso DATE,
    Producto VARCHAR(100),
    Cantidad INT CHECK (Cantidad >= 0),
    id_Empleados INT,
    CONSTRAINT fk_stock_empleado
    FOREIGN KEY (id_Empleados) REFERENCES Empleados(id_Empleados)
);

INSERT INTO Stock (Distribuidora, Ingreso, Producto, Cantidad, id_Empleados)
VALUES('Distribuidora Sergio', '2025-05-20', 'Pan de papa', 30, 1),
      ('Distribuidora Thierri', '2025-05-21', 'Pan de queso', 25, 2);  
      ('Alimentos San Juan', '2025-05-01', 'Harina de trigo 000', 100, 1),
      ('Distribuidora La Huerta', '2025-05-02', 'Arroz largo fino', 200, 2),
      ('Frutas del Valle', '2025-05-03', 'Manzanas rojas', 150, 3),
      ('Verduras del Sur', '2025-05-04', 'Zanahorias frescas', 180, 4),
      ('Lácteos Unión', '2025-05-05', 'Leche entera 1L', 120, 5),
      ('Panadería El Trigal', '2025-05-06', 'Pan francés', 300, 6),
      ('Conservas Mendoza', '2025-05-07', 'Lentejas en lata', 90, 7),
      ('Bebidas del Oeste', '2025-05-08', 'Agua mineral 2L', 250, 8);



-- Tabla de Precio
CREATE TABLE Precio (
    id_Precio INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    id_Stock INTEGER,
    Producto VARCHAR(100),
    Costo DECIMAL(10,2),
    CONSTRAINT fk_precio_stock
    FOREIGN KEY (id_Stock) REFERENCES Stock(id_Stock)
);

INSERT INTO Precio (id_Stock, Producto, Costo)
VALUES(1, 'Pan de papa', 600.50),
      (2, 'Pan de queso', 700.20);
      (3, 'Harina de trigo 000', 150.00),
      (4, 'Arroz largo fino', 120.50),
      (5, 'Manzanas rojas', 80.00),
      (6, 'Zanahorias frescas', 60.00),
      (7, 'Leche entera 1L', 90.00),
      (8, 'Pan francés', 50.00),
      (9, 'Lentejas en lata', 110.00),
      (10, 'Agua mineral 2L', 40.00);





-- Tabla Clientes
CREATE TABLE Clientes (
    id_Cliente INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Email VARCHAR(100)
);

-- insertar a los clientes
INSERT INTO Clientes (Nombre, Apellido, Email)
VALUES ('juan', 'parrado', 'juan@gmail.com'),
       ('diego', 'ajata', 'diego@gmail.com');
       ('Lucía', 'Ramírez', 'lucia.ramirez@mail.com'),
       ('Mateo', 'González', 'mateo.gonzalez@mail.com'),
       ('Camila', 'Fernández', 'camila.fernandez@mail.com'),
       ('Santiago', 'López', 'santiago.lopez@mail.com'),
       ('Valentina', 'Torres', 'valentina.torres@mail.com'),
       ('Joaquín', 'Pérez', 'joaquin.perez@mail.com'),
       ('Martina', 'Sánchez', 'martina.sanchez@mail.com'),
       ('Tomás', 'Herrera', 'tomas.herrera@mail.com');      


-- Tabla Ventas
CREATE TABLE Ventas (
    id_Venta INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Fecha DATE,
    id_Cliente INT,
    id_Stock INT,
    Cantidad INT CHECK (Cantidad > 0),
    Total DECIMAL(10,2),
    FOREIGN KEY (id_Cliente) REFERENCES Clientes(id_Cliente),
    FOREIGN KEY (id_Stock) REFERENCES Stock(id_Stock)
);

INSERT INTO Ventas (Fecha, id_Cliente, id_Stock, Cantidad, Total)
VALUES('2025-05-22', 1, 1, 2, 2401.00),
      ('2025-05-22', 2, 2, 1, 1150.75);
      ('2025-05-10', 3, 3, 5, 400.00),
      ('2025-05-11', 4, 4, 10, 600.00),
      ('2025-05-12', 5, 5, 8, 720.00),
      ('2025-05-13', 6, 6, 12, 600.00),
      ('2025-05-14', 7, 7, 3, 330.00),
      ('2025-05-15', 8, 8, 7, 280.00),
      ('2025-05-16', 9, 9, 4, 500.00),
      ('2025-05-17', 10, 10, 6, 900.00);







