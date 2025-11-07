DELETE FROM Productos

ALTER SEQUENCE idproducto_seq RESTART WITH 1;


SELECT idproducto,nombre,precio
FROM productos

SELECT *
FROM xx 

update  xx 
set existencia = 1
where existencia is null



delete FROM xx 
where nombre is null


select * from inventario

INSERT INTO inventario
SELECT p.idproducto,xx.existencia as existencia_i,xx.existencia as existencia_f
FROM xx 
INNER JOIN productos p
	ON xx.nombre = p.nombre


SELECT I.*,P.NOMBRE
FROM INVENTARIO I
INNER JOIN PRODUCTOS P
	ON I.IDPRODUCTO = P.IDPRODUCTO
	


CREATE SEQUENCE idpaquete_seq
    START 1       -- valor inicial
    INCREMENT 1   -- de cuánto en cuánto aumenta
    MINVALUE 1

ALTER SEQUENCE idpaquete_seq RESTART WITH 1;


CREATE SEQUENCE idproveedor_seq
    START 1       -- valor inicial
    INCREMENT 1   -- de cuánto en cuánto aumenta
    MINVALUE 1

ALTER SEQUENCE idproveedor_seq RESTART WITH 1;	


CREATE SEQUENCE idfactura_seq
    START 1       -- valor inicial
    INCREMENT 1   -- de cuánto en cuánto aumenta
    MINVALUE 1

ALTER SEQUENCE idfactura_seq RESTART WITH 1;	

delete from factura

select * from dfactura


CREATE SEQUENCE idcliente_seq
    START 1       -- valor inicial
    INCREMENT 1   -- de cuánto en cuánto aumenta
    MINVALUE 1

ALTER SEQUENCE idcliente_seq RESTART WITH 1;	


CREATE SEQUENCE idalquiler_seq
    START 1       -- valor inicial
    INCREMENT 1   -- de cuánto en cuánto aumenta
    MINVALUE 1

ALTER SEQUENCE idalquiler_seq RESTART WITH 1;	

SELECT * FROM ALQUILER
SELECT * FROM DALQUILER


NOT NULL DEFAULT nextval('Productos.idproducto_seq'::regclass)



CREATE SEQUENCE IF NOT EXISTS usuarios_id_usuario_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE usuarios_id_usuario_seq RESTART WITH 1;



INSERT INTO usuarios VALUES (1, 'EDGARD', 'GONZALEZ', 'egonzalez@bcn.gob.ni', 'egonzalez', '$2y$10$33fRfgxTOCiQFdlLFm22K.pQHvIdPdGhowaZXDKlSOSk/1NP8WtvG', 1, 0, 1, 0, 0, '2025-09-25', 0, '2025-02-03 00:00:00', 1, '2025-09-26 00:00:00', 2, 1);


CREATE TABLE IF NOT EXISTS institucion
(
    codigo integer NOT NULL,
    descripcion character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT instituc_pkey PRIMARY KEY (codigo)
)


INSERT INTO institucion VALUES (1, 'Barbara Eventos');
    

CREATE SEQUENCE IF NOT EXISTS id_dpaquete_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

NOT NULL DEFAULT nextval('id_dpaquete_seq'::regclass),

-- DROP TABLE IF EXISTS public.dpaquete;

CREATE TABLE IF NOT EXISTS dpaquete
(
	
	id_dpaquete integer NOT NULL DEFAULT nextval('id_dpaquete_seq'::regclass),
    idpaquete integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL
)

CREATE SEQUENCE IF NOT EXISTS id_dalquiler_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;


CREATE TABLE IF NOT EXISTS public.dalquiler
(
	id_dalquiler integer NOT NULL DEFAULT nextval('id_dalquiler_seq'::regclass),
    idalquiler integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL,
    activod integer NOT NULL
)	


CREATE SEQUENCE IF NOT EXISTS id_dfactura_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

	CREATE TABLE IF NOT EXISTS public.dfactura
(
	id_dfactura integer NOT NULL DEFAULT nextval('id_dfactura_seq'::regclass),
    idfactura integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL,
    activod integer
)