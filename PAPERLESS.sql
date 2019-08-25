
--PAPERLESS


DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS movimiento;
DROP TABLE IF EXISTS sucursal;
DROP TABLE IF EXISTS ticket;

DROP SEQUENCE IF EXISTS seq_ticket;
DROP SEQUENCE IF EXISTS seq_cliente;

--CREACIÓN DE SUQ
CREATE SEQUENCE seq_ticket 
MINVALUE 1
INCREMENT BY 1
;

CREATE SEQUENCE seq_cliente 
MINVALUE 1
INCREMENT BY 1
;

--CREACIÓN DE TABLAS
CREATE TABLE usuario(
num_cliente NUMERIC(10),
nombre VARCHAR(30) NOT NULL,
ap_pat VARCHAR(30) NOT NULL,
ap_mat VARCHAR(30) NULL,
direccion VARCHAR(60) NOT NULL,
CONSTRAINT pk_usuario PRIMARY KEY(num_cliente)
);

CREATE TABLE movimiento(
movimiento_id VARCHAR(10),
tipo VARCHAR(40) NOT NULL,
CONSTRAINT pk_movimiento PRIMARY KEY(movimiento_id)
);

CREATE TABLE sucursal(
sucursal_id NUMERIC(10),
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(60) NOT NULL,
CONSTRAINT pk_sucursal PRIMARY KEY(sucursal_id)
);

CREATE TABLE ticket(
ticket_id  NUMERIC(10),
sucursal_id NUMERIC(10) NOT NULL,
monto NUMERIC(7,2) NOT NULL,
fecha TIMESTAMP WITH TIME ZONE NOT NULL,
concepto VARCHAR(40) NOT NULL,
num_cliente NUMERIC(10) NOT NULL,
CONSTRAINT pk_ticket PRIMARY KEY(ticket_id),
CONSTRAINT fk_sucursal FOREIGN KEY(sucursal_id) REFERENCES sucursal(sucursal_id) ON DELETE CASCADE,
CONSTRAINT fk_cliente FOREIGN KEY(num_cliente) REFERENCES usuario(num_cliente) ON DELETE CASCADE
);

--ASIGNACIÓN DE SEQ
ALTER TABLE ticket
ALTER COLUMN ticket_id set DEFAULT nextval('seq_ticket');

ALTER TABLE usuario
ALTER COLUMN num_cliente set DEFAULT nextval('seq_cliente');

INSERT INTO usuario(nombre, ap_pat, ap_mat, direccion) VALUES ('Daniel','Traps','Tech', 'Enrique Segoviano 123');
INSERT INTO usuario(nombre, ap_pat, ap_mat, direccion) VALUES ('Lic','Valeriano',' ', 'Reforma');
INSERT INTO usuario(nombre, ap_pat, ap_mat, direccion) VALUES ('Cristian','O','Ronaldo', 'Ecatepec de Morelos');

INSERT INTO sucursal(sucursal_id, nombre, direccion) VALUES (1,'Gran Sur','Blv. Gran Sur 200');
INSERT INTO sucursal(sucursal_id, nombre, direccion) VALUES (2,'Perinorte','Av. Insurgentes 80');
INSERT INTO sucursal(sucursal_id, nombre, direccion) VALUES (3,'Neza','Que mas aplauda');


INSERT INTO movimiento(movimiento_id, tipo) VALUES ('01','Deposito');
INSERT INTO movimiento(movimiento_id, tipo) VALUES ('02','Retiro');
INSERT INTO movimiento(movimiento_id, tipo) VALUES ('03','Estado de cuenta');
INSERT INTO movimiento(movimiento_id, tipo) VALUES ('04','Compra');




INSERT INTO ticket(sucursal_id,monto, fecha,concepto,num_cliente) VALUES (1,1000,current_date,'pruebita',1);

