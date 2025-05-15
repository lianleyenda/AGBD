--cree la tabla stock

CREATE TABLE "Stock" (
 id_Stock SERIAL PRIMARY KEY,-- le paso que la id se autocomplete (+1) y sea el dato que me pase toda la lista
 Distibudora VARCHAR(100),-- le paso que es un tipo de texto y use 100byts para escribir
 Ingreso date,-- le paso que es un tipo de dato de fecha
 Producto VARCHAR(100),
 Cantidad INT-- le paso que es un valor numerico entero
);
  
  
--Cree la tabla Empleados
CREATE TABLE "Empleados" (
 id_Empleados SERIAL PRIMARY KEY,
 Nombre VARCHAR(100),
 Apellido VARCHAR(100),
 Email VARCHAR(100),
 Numero INT
);


--Cree la tabla de Precio
CREATE TABLE "Precio" (
 id_Precio SERIAL PRIMARY KEY,
 Producto VARCHAR(100),
 Costo DECIMAL(100,2)
);

--Cree la tabla de Sucursales
CREATE TABLE "Sucursales" (
 id_Sucursales SERIAL PRIMARY KEY,
 Pais VARCHAR(100),
 Ciudad VARCHAR(100),
 Horario_abie time,
 Horario_cerr time
);


--Agregue a la tabla stock id_Empleados
ALTER TABLE Stock
ADD id_Empleados INT;



