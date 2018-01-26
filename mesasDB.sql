-- Database: Mesas

-- DROP DATABASE "Mesas";

CREATE DATABASE "Mesas"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Bolivarian Republic of Venezuela.1252'
    LC_CTYPE = 'Spanish_Bolivarian Republic of Venezuela.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
         
    CREATE TABLE clientes (
  id bigserial  PRIMARY KEY,
  nombre VARCHAR NOT NULL,
  tipo VARCHAR NOT NULL
);


CREATE TABLE proveedores (
  id bigserial PRIMARY KEY,
  nombre VARCHAR NOT NULL,
  direccion VARCHAR NOT NULL
);
CREATE TABLE mesas (
  id bigserial PRIMARY KEY,
  modelo VARCHAR NOT NULL,
  marca VARCHAR NOT NULL,
  material VARCHAR NOT NULL,
  precio FLOAT NOT NULL ,
  patas INTEGER NOT NULL,
  dimension VARCHAR NOT NULL,
  forma VARCHAR NOT NULL,
  descripcion VARCHAR NOT NULL
);

CREATE TABLE compras (
  id bigserial  PRIMARY KEY,
  mesas_id INTEGER REFERENCES mesas(id),
  proveedores_id INTEGER REFERENCES proveedores(id),
  fecha_compra DATE NOT NULL,
  precio_compra FLOAT NOT NULL
);



CREATE TABLE ventas (
  id bigserial PRIMARY KEY,
  mesas_id INTEGER REFERENCES mesas(id),
  clientes_id INTEGER REFERENCES clientes(id),
  fecha_venta DATE NOT NULL
	);
	
	INSERT INTO clientes (nombre,tipo) VALUES 
	 ('Apple C.A.','Juridico'),
	 ('Microsoft C.A.','Juridico'),
	 ('LG C.A.','Juridico'),
	 ('Huawei C.A.','Juridico'),
	 ('Rafael Correa','Natural'),
	 ('Leonel Messi','Natural'),
	 ('Miguel Cabrera','Natural'),
	 ('Google','Juridico'),
	 ('Roger Federer','Natural');
	 
INSERT INTO proveedores (nombre,direccion) VALUES 
	 ('Apple C.A.','EEUU'),
	 ('Microsoft C.A.','EEUU'),
	 ('LG C.A.','China'),
	 ('Huawei C.A.','Chile'),
	 ('Samsung','Japon'),
	 ('SonyTables','España'),
	 ('Distribuidora de mesas OP.','Natural'),
	 ('Google mesas branch','Juridico'),
	 ('Roger Federer y asociados','Natural');

INSERT INTO mesas (modelo,marca,material,precio,patas,dimension,forma,descripcion) VALUES 
	 ('Mesa de comedor t41','Apple','Madera',13500.21,4,'4x3','Ovalada','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Comedor de Jardin','Microsoft','Plastico',9000,4,'4x3','Cuadrada','Mesa comoda para trabajar o descansar, ideal para espacios abiertos'),
	 ('Mesa de cuarto','Microsoft','Madera',18000.5,8,'4x3','Rectangular','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Mesa para juegos de azar','Samsung','Metal',13500.21,3,'4x3','Ovalada','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Mesa para bebes','Apple','Metal',7500,2,'4x3','Ovalada','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Mesa familiar','Huawei','Madera',16000.5,4,'4x3','Circular','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Mesa de reuniones','LG','Vidrio',30000.3,4,'4x3','Rectangular','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Comedor de lujo','Apple','Madera',21000,4,'4x3','Circular','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Mesa playera','Apple','Plastico',8500,5,'4x3','Cuadrada','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Mesa sencilla','Huawei','Metal',9800.21,6,'4x3','Triangular','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Comedor para interiores','LG','Aluminio',21200.9,2,'4x3','Rectangular','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones'),
	 ('Mesa espacios abiertos','VIT','Aluminio',9999.9,3,'4x3','Circular','Mesa comoda para trabajar o descansar, ideal para todo tipo de ocasiones');
	 
INSERT INTO compras (mesas_id,proveedores_id,fecha_compra,precio_compra) VALUES 
	 (1,3,'2017-06-16',4000),
	 (2,1,'2017-03-25',3000),
	 (3,1,'2017-02-03',5000),
	 (6,1,'2017-08-21',3500),
	 (8,2,'2017-10-18',8000),
	 (8,2,'2017-10-15',2890.9),
	 (8,3,'2017-12-25',9999.9),
	 (2,2,'2017-11-28',3500),
	 (11,5,'2017-09-01',4000),
	 (10,5,'2017-11-09',3200),
	 (1,8,'2017-12-09',8600),
	 (4,8,'2017-08-09',2290.9),
	 (8,7,'2017-09-16',9099.9),
	 (2,2,'2018-01-28',3500),
	 (11,5,'2018-01-01',4000),
	 (10,5,'2018-01-09',3200),
	 (1,8,'2018-01-09',8600),
	 (4,8,'2018-01-09',2290.9),
	 (8,7,'2018-01-16',9099.9);
	 

	 
INSERT INTO ventas (mesas_id,clientes_id,fecha_venta) VALUES 
	 (1,3,'2018-01-16'),
	 (2,1,'2018-01-25'),
	 (3,1,'2018-01-03'),
	 (6,1,'2018-01-21'),
	 (8,2,'2017-12-18'),
	 (8,2,'2017-11-15'),
	 (3,3,'2017-12-31'),
	 (2,2,'2018-01-28'),
	 (11,5,'2017-11-01'),
	 (10,5,'2017-12-09'),
	 (1,8,'2018-01-09'),
	 (4,8,'2018-01-09'),
	 (12,7,'2017-12-16');
	 
	 
	 select count(*) from mesas; -- distintos tipos de mesa registrados
	 select count(*) from ventas; -- numero de mesas vendidas
	 select count(*) as total,mesas.modelo,mesas.material from ventas INNER join mesas on mesas.id = ventas.mesas_id group by mesas.id order by total DESC; -- cantidad de mesas vendidas ordenadas por su id
	 select count(*) as total,mesas.modelo,mesas.material from compras INNER join mesas on mesas.id = compras.mesas_id group by mesas.id order by total DESC; -- cantidad de mesas compradas ordenadas por id se puede restar con el query de ventas para saber cuantas quedan
	 
	 select count(*) as total,mesas.material from compras INNER join mesas on mesas.id = compras.mesas_id group by mesas.material ORDER BY total DESC;-- el material que la empresa compra mas
	 
	 select count(*) as total,mesas.material from ventas INNER join mesas on mesas.id = ventas.mesas_id group by mesas.material ORDER BY total DESC;--el material que se vende mas a los clientes
     select count(*) as total from compras INNER join mesas on mesas.id = compras.mesas_id where compras.fecha_compra > '2017-12-31'; --mesas compradas en el 2018
     select count(*) as total from ventas INNER join mesas on mesas.id = ventas.mesas_id where ventas.fecha_venta > '2017-12-31'; --mesas vendidas en el 2018
	 
	 select sum(mesas.precio) as total from ventas INNER join mesas on mesas.id = ventas.mesas_id;--total dinero ganado en ventas
	 select sum(compras.precio_compra) as total from compras INNER join mesas on mesas.id = compras.mesas_id;--inversion


     