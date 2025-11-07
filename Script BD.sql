--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2025-11-07 09:11:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 222 (class 1259 OID 24744)
-- Name: idalquiler_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.idalquiler_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idalquiler_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 41002)
-- Name: alquiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alquiler (
    idalquiler integer DEFAULT nextval('public.idalquiler_seq'::regclass) NOT NULL,
    cliente character(200) NOT NULL,
    direccion character(200) NOT NULL,
    telefono character(50) NOT NULL,
    fechaevento date NOT NULL,
    fecha date NOT NULL,
    monto double precision NOT NULL,
    adelanto double precision,
    observaciones character(200),
    fecharegistro timestamp without time zone NOT NULL
);


ALTER TABLE public.alquiler OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24825)
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24822)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente integer DEFAULT nextval('public.clientes_id_cliente_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(100)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 41010)
-- Name: id_dalquiler_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_dalquiler_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.id_dalquiler_seq OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 41023)
-- Name: dalquiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dalquiler (
    id_dalquiler integer DEFAULT nextval('public.id_dalquiler_seq'::regclass) NOT NULL,
    idalquiler integer NOT NULL,
    id_dpaquete integer,
    idproducto integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL,
    activod integer NOT NULL
);


ALTER TABLE public.dalquiler OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 41052)
-- Name: id_dfactura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_dfactura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.id_dfactura_seq OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 41053)
-- Name: dfactura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dfactura (
    id_dfactura integer DEFAULT nextval('public.id_dfactura_seq'::regclass) NOT NULL,
    idfactura integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL,
    activod integer
);


ALTER TABLE public.dfactura OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32793)
-- Name: id_dpaquete_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_dpaquete_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.id_dpaquete_seq OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 32794)
-- Name: dpaquete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dpaquete (
    id_dpaquete integer DEFAULT nextval('public.id_dpaquete_seq'::regclass) NOT NULL,
    idpaquete integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL,
    activod integer
);


ALTER TABLE public.dpaquete OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24690)
-- Name: idfactura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.idfactura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idfactura_seq OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 41038)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    idfactura integer DEFAULT nextval('public.idfactura_seq'::regclass) NOT NULL,
    idproveedor integer NOT NULL,
    numfactura character(50) NOT NULL,
    fechacompra date NOT NULL,
    monto double precision NOT NULL,
    activo integer NOT NULL,
    fecharegistro timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24663)
-- Name: idpaquete_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.idpaquete_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idpaquete_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24620)
-- Name: idproducto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.idproducto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idproducto_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24678)
-- Name: idproveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.idproveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idproveedor_seq OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24770)
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institucion (
    codigo integer NOT NULL,
    descripcion character varying(200) NOT NULL
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24660)
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    idproducto integer NOT NULL,
    existencia_i integer NOT NULL,
    existencia_f integer NOT NULL
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 32786)
-- Name: paquetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paquetes (
    idpaquete integer DEFAULT nextval('public.idpaquete_seq'::regclass) NOT NULL,
    nombrepaquete character varying(200) NOT NULL,
    activo integer NOT NULL,
    fecharegistro timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.paquetes OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24829)
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24826)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido integer DEFAULT nextval('public.pedidos_id_pedido_seq'::regclass) NOT NULL,
    id_cliente integer NOT NULL,
    producto character varying(100) NOT NULL,
    cantidad integer NOT NULL,
    precio numeric(10,2) NOT NULL
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24652)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    idproducto integer DEFAULT nextval('public.idproducto_seq'::regclass) NOT NULL,
    nombre character varying(200) NOT NULL,
    precio double precision NOT NULL,
    precio_renta double precision
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24679)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor (
    idproveedor integer DEFAULT nextval('public.idproveedor_seq'::regclass) NOT NULL,
    nombre character varying(200) NOT NULL
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24755)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24756)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass) NOT NULL,
    u_nombre_completo character varying(200) NOT NULL,
    u_apellido_completo character varying(200) NOT NULL,
    u_email character varying(75) DEFAULT NULL::character varying,
    usuario character varying(15) DEFAULT NULL::character varying,
    u_clave character varying(75) NOT NULL,
    administ integer NOT NULL,
    operador integer NOT NULL,
    u_estado smallint DEFAULT '1'::smallint NOT NULL,
    reset_clave smallint DEFAULT '0'::smallint,
    u_bloqueado smallint DEFAULT '0'::smallint,
    fecha_vencimiento date NOT NULL,
    cantidad_intento integer,
    fecha_creacion timestamp without time zone NOT NULL,
    usuario_creacion integer NOT NULL,
    fecha_modifica timestamp without time zone,
    usuario_modifica integer,
    idinstitucion integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24622)
-- Name: xx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xx (
    nombre character varying(200),
    existencia integer
);


ALTER TABLE public.xx OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 41002)
-- Dependencies: 233
-- Data for Name: alquiler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alquiler VALUES (13, 'mario romero4                                                                                                                                                                                           ', 'Villa jose benito escobar, de enabas 300 mts. al sur 4c                                                                                                                                                 ', '2258-7694                                         ', '2025-12-01', '2025-10-15', 8000, 3000, 'llegar a las 10am el dia del evento f                                                                                                                                                                   ', '2025-10-20 15:51:54.240955');
INSERT INTO public.alquiler VALUES (14, 'jose perez                                                                                                                                                                                              ', 'villa fontana                                                                                                                                                                                           ', '2258-7694                                         ', '2025-12-03', '2025-10-21', 5000, 2000, 'n/a                                                                                                                                                                                                     ', '2025-10-21 10:01:43.274749');
INSERT INTO public.alquiler VALUES (12, 'mario romero6                                                                                                                                                                                           ', 'Villa jose benito escobar, de enabas 300 mts. al sur 4                                                                                                                                                  ', '2258-7694                                         ', '2025-12-03', '2025-10-15', 8000, 3000, 'llegar a las 10am el dia del evento f                                                                                                                                                                   ', '2025-10-15 13:44:42.017945');


--
-- TOC entry 3420 (class 0 OID 24822)
-- Dependencies: 226
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (3, 'Jose perez', 'jperez@yahoo.com');
INSERT INTO public.clientes VALUES (2, 'Jose perez cEE', 'jperez@yahoo.com');
INSERT INTO public.clientes VALUES (1, 'Edgard gonzalez Ferrufino', 'egonzalez@bcn.gob.ni');
INSERT INTO public.clientes VALUES (4, 'mario perez', 'mgomez@bcn.gob.ni');


--
-- TOC entry 3429 (class 0 OID 41023)
-- Dependencies: 235
-- Data for Name: dalquiler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dalquiler VALUES (2, 12, 10, 9, 10, 200, 1);
INSERT INTO public.dalquiler VALUES (6, 12, NULL, 15, 1, 1, 1);
INSERT INTO public.dalquiler VALUES (9, 12, NULL, 4, 25, 74, 1);
INSERT INTO public.dalquiler VALUES (3, 12, 9, 2, 12, 37, 1);
INSERT INTO public.dalquiler VALUES (10, 12, NULL, 16, 1, 111, 1);
INSERT INTO public.dalquiler VALUES (11, 14, 11, 9, 10, 200, 1);


--
-- TOC entry 3432 (class 0 OID 41053)
-- Dependencies: 238
-- Data for Name: dfactura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dfactura VALUES (1, 1, 2, 2, 200, 1);
INSERT INTO public.dfactura VALUES (2, 1, 1, 1, 200, 1);
INSERT INTO public.dfactura VALUES (3, 1, 205, 10, 74, 1);


--
-- TOC entry 3426 (class 0 OID 32794)
-- Dependencies: 232
-- Data for Name: dpaquete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dpaquete VALUES (9, 5, 2, 20, 37, 1);
INSERT INTO public.dpaquete VALUES (12, 5, 5, 1, 437, 1);
INSERT INTO public.dpaquete VALUES (10, 5, 9, 10, 200, 1);
INSERT INTO public.dpaquete VALUES (11, 6, 9, 10, 200, 1);


--
-- TOC entry 3430 (class 0 OID 41038)
-- Dependencies: 236
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura VALUES (1, 2, '12543                                             ', '2025-10-25', 10000, 1, '2025-10-27 13:28:33.779578');


--
-- TOC entry 3419 (class 0 OID 24770)
-- Dependencies: 225
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.institucion VALUES (1, 'Barbara Eventos');


--
-- TOC entry 3411 (class 0 OID 24660)
-- Dependencies: 217
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventario VALUES (3, 100, 100);
INSERT INTO public.inventario VALUES (4, 100, 100);
INSERT INTO public.inventario VALUES (5, 35, 35);
INSERT INTO public.inventario VALUES (6, 40, 40);
INSERT INTO public.inventario VALUES (7, 10, 10);
INSERT INTO public.inventario VALUES (8, 10, 10);
INSERT INTO public.inventario VALUES (9, 30, 30);
INSERT INTO public.inventario VALUES (10, 30, 30);
INSERT INTO public.inventario VALUES (11, 20, 20);
INSERT INTO public.inventario VALUES (12, 10, 10);
INSERT INTO public.inventario VALUES (13, 1, 1);
INSERT INTO public.inventario VALUES (14, 3, 3);
INSERT INTO public.inventario VALUES (16, 30, 30);
INSERT INTO public.inventario VALUES (17, 40, 40);
INSERT INTO public.inventario VALUES (18, 10, 10);
INSERT INTO public.inventario VALUES (19, 10, 10);
INSERT INTO public.inventario VALUES (20, 10, 10);
INSERT INTO public.inventario VALUES (21, 10, 10);
INSERT INTO public.inventario VALUES (22, 10, 10);
INSERT INTO public.inventario VALUES (23, 10, 10);
INSERT INTO public.inventario VALUES (24, 10, 10);
INSERT INTO public.inventario VALUES (25, 10, 10);
INSERT INTO public.inventario VALUES (26, 10, 10);
INSERT INTO public.inventario VALUES (27, 10, 10);
INSERT INTO public.inventario VALUES (28, 10, 10);
INSERT INTO public.inventario VALUES (29, 10, 10);
INSERT INTO public.inventario VALUES (30, 5, 5);
INSERT INTO public.inventario VALUES (31, 5, 5);
INSERT INTO public.inventario VALUES (32, 20, 20);
INSERT INTO public.inventario VALUES (33, 10, 10);
INSERT INTO public.inventario VALUES (34, 1, 1);
INSERT INTO public.inventario VALUES (35, 1, 1);
INSERT INTO public.inventario VALUES (36, 1, 1);
INSERT INTO public.inventario VALUES (37, 1, 1);
INSERT INTO public.inventario VALUES (38, 1, 1);
INSERT INTO public.inventario VALUES (40, 12, 12);
INSERT INTO public.inventario VALUES (41, 10, 10);
INSERT INTO public.inventario VALUES (42, 10, 10);
INSERT INTO public.inventario VALUES (43, 10, 10);
INSERT INTO public.inventario VALUES (44, 10, 10);
INSERT INTO public.inventario VALUES (47, 12, 12);
INSERT INTO public.inventario VALUES (48, 40, 40);
INSERT INTO public.inventario VALUES (49, 12, 12);
INSERT INTO public.inventario VALUES (50, 12, 12);
INSERT INTO public.inventario VALUES (51, 12, 12);
INSERT INTO public.inventario VALUES (52, 12, 12);
INSERT INTO public.inventario VALUES (53, 12, 12);
INSERT INTO public.inventario VALUES (54, 12, 12);
INSERT INTO public.inventario VALUES (55, 12, 12);
INSERT INTO public.inventario VALUES (56, 12, 12);
INSERT INTO public.inventario VALUES (57, 12, 12);
INSERT INTO public.inventario VALUES (58, 12, 12);
INSERT INTO public.inventario VALUES (59, 12, 12);
INSERT INTO public.inventario VALUES (60, 12, 12);
INSERT INTO public.inventario VALUES (61, 12, 12);
INSERT INTO public.inventario VALUES (62, 300, 300);
INSERT INTO public.inventario VALUES (63, 100, 100);
INSERT INTO public.inventario VALUES (64, 150, 150);
INSERT INTO public.inventario VALUES (65, 110, 110);
INSERT INTO public.inventario VALUES (66, 110, 110);
INSERT INTO public.inventario VALUES (67, 110, 110);
INSERT INTO public.inventario VALUES (68, 100, 100);
INSERT INTO public.inventario VALUES (69, 70, 70);
INSERT INTO public.inventario VALUES (70, 110, 110);
INSERT INTO public.inventario VALUES (71, 50, 50);
INSERT INTO public.inventario VALUES (72, 100, 100);
INSERT INTO public.inventario VALUES (73, 150, 150);
INSERT INTO public.inventario VALUES (74, 150, 150);
INSERT INTO public.inventario VALUES (75, 100, 100);
INSERT INTO public.inventario VALUES (76, 100, 100);
INSERT INTO public.inventario VALUES (77, 100, 100);
INSERT INTO public.inventario VALUES (78, 120, 120);
INSERT INTO public.inventario VALUES (79, 300, 300);
INSERT INTO public.inventario VALUES (80, 250, 250);
INSERT INTO public.inventario VALUES (81, 15, 15);
INSERT INTO public.inventario VALUES (82, 10, 10);
INSERT INTO public.inventario VALUES (83, 250, 250);
INSERT INTO public.inventario VALUES (84, 350, 350);
INSERT INTO public.inventario VALUES (85, 350, 350);
INSERT INTO public.inventario VALUES (86, 5, 5);
INSERT INTO public.inventario VALUES (87, 2, 2);
INSERT INTO public.inventario VALUES (88, 2, 2);
INSERT INTO public.inventario VALUES (89, 1, 1);
INSERT INTO public.inventario VALUES (90, 50, 50);
INSERT INTO public.inventario VALUES (91, 100, 100);
INSERT INTO public.inventario VALUES (92, 30, 30);
INSERT INTO public.inventario VALUES (95, 30, 30);
INSERT INTO public.inventario VALUES (93, 30, 30);
INSERT INTO public.inventario VALUES (94, 20, 20);
INSERT INTO public.inventario VALUES (95, 20, 20);
INSERT INTO public.inventario VALUES (93, 20, 20);
INSERT INTO public.inventario VALUES (96, 20, 20);
INSERT INTO public.inventario VALUES (97, 150, 150);
INSERT INTO public.inventario VALUES (98, 30, 30);
INSERT INTO public.inventario VALUES (99, 30, 30);
INSERT INTO public.inventario VALUES (100, 250, 250);
INSERT INTO public.inventario VALUES (101, 200, 200);
INSERT INTO public.inventario VALUES (102, 20, 20);
INSERT INTO public.inventario VALUES (103, 10, 10);
INSERT INTO public.inventario VALUES (104, 10, 10);
INSERT INTO public.inventario VALUES (105, 20, 20);
INSERT INTO public.inventario VALUES (106, 30, 30);
INSERT INTO public.inventario VALUES (107, 100, 100);
INSERT INTO public.inventario VALUES (108, 350, 350);
INSERT INTO public.inventario VALUES (109, 150, 150);
INSERT INTO public.inventario VALUES (110, 100, 100);
INSERT INTO public.inventario VALUES (111, 5, 5);
INSERT INTO public.inventario VALUES (112, 20, 20);
INSERT INTO public.inventario VALUES (113, 10, 10);
INSERT INTO public.inventario VALUES (114, 10, 10);
INSERT INTO public.inventario VALUES (115, 1, 1);
INSERT INTO public.inventario VALUES (116, 500, 500);
INSERT INTO public.inventario VALUES (117, 10, 10);
INSERT INTO public.inventario VALUES (118, 500, 500);
INSERT INTO public.inventario VALUES (119, 10, 10);
INSERT INTO public.inventario VALUES (120, 50, 50);
INSERT INTO public.inventario VALUES (121, 10, 10);
INSERT INTO public.inventario VALUES (122, 40, 40);
INSERT INTO public.inventario VALUES (123, 30, 30);
INSERT INTO public.inventario VALUES (124, 50, 50);
INSERT INTO public.inventario VALUES (125, 50, 50);
INSERT INTO public.inventario VALUES (126, 30, 30);
INSERT INTO public.inventario VALUES (127, 50, 50);
INSERT INTO public.inventario VALUES (128, 20, 20);
INSERT INTO public.inventario VALUES (129, 100, 100);
INSERT INTO public.inventario VALUES (130, 5, 5);
INSERT INTO public.inventario VALUES (131, 1, 1);
INSERT INTO public.inventario VALUES (132, 5, 5);
INSERT INTO public.inventario VALUES (133, 6, 6);
INSERT INTO public.inventario VALUES (134, 4, 4);
INSERT INTO public.inventario VALUES (135, 20, 20);
INSERT INTO public.inventario VALUES (136, 5, 5);
INSERT INTO public.inventario VALUES (137, 2, 2);
INSERT INTO public.inventario VALUES (138, 3, 3);
INSERT INTO public.inventario VALUES (139, 2, 2);
INSERT INTO public.inventario VALUES (140, 3, 3);
INSERT INTO public.inventario VALUES (141, 4, 4);
INSERT INTO public.inventario VALUES (142, 2, 2);
INSERT INTO public.inventario VALUES (143, 4, 4);
INSERT INTO public.inventario VALUES (144, 4, 4);
INSERT INTO public.inventario VALUES (15, 1, 1);
INSERT INTO public.inventario VALUES (145, 5, 5);
INSERT INTO public.inventario VALUES (146, 15, 15);
INSERT INTO public.inventario VALUES (147, 4, 4);
INSERT INTO public.inventario VALUES (148, 2, 2);
INSERT INTO public.inventario VALUES (149, 2, 2);
INSERT INTO public.inventario VALUES (150, 1, 1);
INSERT INTO public.inventario VALUES (151, 2, 2);
INSERT INTO public.inventario VALUES (152, 6, 6);
INSERT INTO public.inventario VALUES (153, 1, 1);
INSERT INTO public.inventario VALUES (154, 1, 1);
INSERT INTO public.inventario VALUES (155, 1, 1);
INSERT INTO public.inventario VALUES (156, 1, 1);
INSERT INTO public.inventario VALUES (157, 1, 1);
INSERT INTO public.inventario VALUES (158, 1, 1);
INSERT INTO public.inventario VALUES (1, 241, 240);
INSERT INTO public.inventario VALUES (159, 1, 1);
INSERT INTO public.inventario VALUES (160, 1, 1);
INSERT INTO public.inventario VALUES (161, 1, 1);
INSERT INTO public.inventario VALUES (162, 1, 1);
INSERT INTO public.inventario VALUES (163, 1, 1);
INSERT INTO public.inventario VALUES (164, 1, 1);
INSERT INTO public.inventario VALUES (165, 3, 3);
INSERT INTO public.inventario VALUES (166, 2, 2);
INSERT INTO public.inventario VALUES (167, 2, 2);
INSERT INTO public.inventario VALUES (168, 2, 2);
INSERT INTO public.inventario VALUES (169, 1, 1);
INSERT INTO public.inventario VALUES (170, 1, 1);
INSERT INTO public.inventario VALUES (171, 1, 1);
INSERT INTO public.inventario VALUES (172, 1, 1);
INSERT INTO public.inventario VALUES (173, 1, 1);
INSERT INTO public.inventario VALUES (174, 1, 1);
INSERT INTO public.inventario VALUES (175, 3, 3);
INSERT INTO public.inventario VALUES (176, 4, 4);
INSERT INTO public.inventario VALUES (177, 100, 100);
INSERT INTO public.inventario VALUES (178, 15, 15);
INSERT INTO public.inventario VALUES (179, 15, 15);
INSERT INTO public.inventario VALUES (180, 2, 2);
INSERT INTO public.inventario VALUES (181, 1, 1);
INSERT INTO public.inventario VALUES (182, 1, 1);
INSERT INTO public.inventario VALUES (183, 2, 2);
INSERT INTO public.inventario VALUES (184, 1, 1);
INSERT INTO public.inventario VALUES (185, 1, 1);
INSERT INTO public.inventario VALUES (186, 1, 1);
INSERT INTO public.inventario VALUES (187, 2, 2);
INSERT INTO public.inventario VALUES (188, 3, 3);
INSERT INTO public.inventario VALUES (189, 3, 3);
INSERT INTO public.inventario VALUES (190, 1, 1);
INSERT INTO public.inventario VALUES (191, 4, 4);
INSERT INTO public.inventario VALUES (192, 4, 4);
INSERT INTO public.inventario VALUES (193, 5, 5);
INSERT INTO public.inventario VALUES (194, 1000, 1000);
INSERT INTO public.inventario VALUES (195, 30, 30);
INSERT INTO public.inventario VALUES (196, 1000, 1000);
INSERT INTO public.inventario VALUES (197, 3, 3);
INSERT INTO public.inventario VALUES (198, 1, 1);
INSERT INTO public.inventario VALUES (199, 1, 1);
INSERT INTO public.inventario VALUES (200, 2, 2);
INSERT INTO public.inventario VALUES (201, 8, 8);
INSERT INTO public.inventario VALUES (202, 16, 16);
INSERT INTO public.inventario VALUES (203, 8, 8);
INSERT INTO public.inventario VALUES (39, 1, 1);
INSERT INTO public.inventario VALUES (45, 1, 1);
INSERT INTO public.inventario VALUES (46, 1, 1);
INSERT INTO public.inventario VALUES (2, 103, 100);
INSERT INTO public.inventario VALUES (205, 110, 100);


--
-- TOC entry 3424 (class 0 OID 32786)
-- Dependencies: 230
-- Data for Name: paquetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paquetes VALUES (6, 'paquete2', 1, '2025-10-09 11:43:00.6976');
INSERT INTO public.paquetes VALUES (8, 'paquete3', 1, '2025-10-10 09:38:06.872041');
INSERT INTO public.paquetes VALUES (7, 'paquete3', 1, '2025-10-09 14:10:56.598695');
INSERT INTO public.paquetes VALUES (9, 'Paquete1 completo223', 1, '2025-10-15 12:16:21.789426');
INSERT INTO public.paquetes VALUES (10, 'Paquete1 completo2', 1, '2025-10-21 09:48:10.602172');
INSERT INTO public.paquetes VALUES (5, 'paquete11', 1, '2025-10-09 10:36:51.781104');


--
-- TOC entry 3422 (class 0 OID 24826)
-- Dependencies: 228
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos VALUES (3, 1, 'cargador', 1200, 20.00);
INSERT INTO public.pedidos VALUES (2, 1, 'camaras', 100, 150.00);
INSERT INTO public.pedidos VALUES (4, 4, 'camaras', 50, 25.00);
INSERT INTO public.pedidos VALUES (1, 1, 'celulares', 500, 250.00);
INSERT INTO public.pedidos VALUES (5, 1, '5', 5, 5.00);
INSERT INTO public.pedidos VALUES (6, 1, '7', 7, 7.00);


--
-- TOC entry 3410 (class 0 OID 24652)
-- Dependencies: 216
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (205, 'xxx', 10, 10);
INSERT INTO public.productos VALUES (1, 'Sillas Folding', 17, 17);
INSERT INTO public.productos VALUES (2, 'Sillas Garden', 37, 37);
INSERT INTO public.productos VALUES (3, 'Sillas tifany dorada', 74, 74);
INSERT INTO public.productos VALUES (4, 'Sillas tifany plateada', 74, 74);
INSERT INTO public.productos VALUES (5, 'Sillas hoteleras', 437, 437);
INSERT INTO public.productos VALUES (6, 'Sillas cocteleras aluminio', 74, 74);
INSERT INTO public.productos VALUES (7, 'Bancos cocteleros', 74, 74);
INSERT INTO public.productos VALUES (8, 'Mesas cocteleras', 370, 370);
INSERT INTO public.productos VALUES (9, 'Mesas redondas 8 personas', 200, 200);
INSERT INTO public.productos VALUES (10, 'Mesas redondas 10 personas', 220, 220);
INSERT INTO public.productos VALUES (11, 'Mesas cuadradas', 74, 74);
INSERT INTO public.productos VALUES (12, 'Mesas Cocteleras', 370, 370);
INSERT INTO public.productos VALUES (13, 'Mesas decoracion madera', 740, 740);
INSERT INTO public.productos VALUES (14, 'Mesa Decoracion hierro', 555, 555);
INSERT INTO public.productos VALUES (15, 'Otras mesas', 1, 1);
INSERT INTO public.productos VALUES (16, 'Manteles blancos redon lisos', 111, 111);
INSERT INTO public.productos VALUES (17, 'Manteles blancos redon lujo', 148, 148);
INSERT INTO public.productos VALUES (18, 'Manteles rojos redondos', 185, 185);
INSERT INTO public.productos VALUES (19, 'Manteles azules redondos', 185, 185);
INSERT INTO public.productos VALUES (20, 'Manteles dorados redondos', 222, 222);
INSERT INTO public.productos VALUES (21, 'Manteles amarillos redon', 148, 148);
INSERT INTO public.productos VALUES (22, 'Manteles verdes redondos', 185, 185);
INSERT INTO public.productos VALUES (23, 'Manteles celestes redondos', 148, 148);
INSERT INTO public.productos VALUES (24, 'Manteles cafe redondos', 185, 185);
INSERT INTO public.productos VALUES (25, 'Manteles rosados redondos', 148, 148);
INSERT INTO public.productos VALUES (26, 'Manteles fucsia redondos', 148, 148);
INSERT INTO public.productos VALUES (27, 'Manteles lilas redondos', 148, 148);
INSERT INTO public.productos VALUES (28, 'Manteles negros redondos', 185, 185);
INSERT INTO public.productos VALUES (29, 'Manteles spandex coctel', 185, 185);
INSERT INTO public.productos VALUES (30, 'Manteles spandex mesa red', 185, 185);
INSERT INTO public.productos VALUES (31, 'Manteles spandex rectang', 185, 185);
INSERT INTO public.productos VALUES (32, 'Manteles Rect Blanco liso', 148, 148);
INSERT INTO public.productos VALUES (33, 'Manteles rect blancos lujo', 185, 185);
INSERT INTO public.productos VALUES (34, 'Manteles rect rosados', 185, 185);
INSERT INTO public.productos VALUES (35, 'Manteles rectangulares lila', 185, 185);
INSERT INTO public.productos VALUES (36, 'Manteles rectang. morad', 185, 185);
INSERT INTO public.productos VALUES (37, 'Manteles rectang dorado', 185, 185);
INSERT INTO public.productos VALUES (38, 'Manteles rectang azul', 185, 185);
INSERT INTO public.productos VALUES (39, 'Manteles  (otros)', 1, 1);
INSERT INTO public.productos VALUES (40, 'Cubremanteles redon rojos', 185, 185);
INSERT INTO public.productos VALUES (41, 'Cubremanteles redon dora', 185, 185);
INSERT INTO public.productos VALUES (42, 'Cubremanteles redon azul', 185, 185);
INSERT INTO public.productos VALUES (43, 'Cubremanteles redon amar', 185, 185);
INSERT INTO public.productos VALUES (44, 'Cubremanteles spandex', 185, 185);
INSERT INTO public.productos VALUES (45, 'Cubremanteles cuadrados', 148, 148);
INSERT INTO public.productos VALUES (46, 'Cubremanteles  (otros)', 1, 1);
INSERT INTO public.productos VALUES (47, 'Caminos cafe', 92.5, 92.5);
INSERT INTO public.productos VALUES (48, 'Caminos dorados', 92.5, 92.5);
INSERT INTO public.productos VALUES (49, 'Caminos verdes menta', 92.5, 92.5);
INSERT INTO public.productos VALUES (50, 'Caminos rosados', 92.5, 92.5);
INSERT INTO public.productos VALUES (51, 'Caminos amarillos', 92.5, 92.5);
INSERT INTO public.productos VALUES (52, 'Caminos rojos', 92.5, 92.5);
INSERT INTO public.productos VALUES (53, 'Camonos verde esmeralda', 92.5, 92.5);
INSERT INTO public.productos VALUES (54, 'Caminos celestes', 92.5, 92.5);
INSERT INTO public.productos VALUES (55, 'Caminos coral', 92.5, 92.5);
INSERT INTO public.productos VALUES (56, 'Caminos terracota', 92.5, 92.5);
INSERT INTO public.productos VALUES (57, 'Caminos negros', 92.5, 92.5);
INSERT INTO public.productos VALUES (58, 'Caminos anaranjados', 92.5, 92.5);
INSERT INTO public.productos VALUES (59, 'Caminos azules', 92.5, 92.5);
INSERT INTO public.productos VALUES (60, 'Caminos plateados', 92.5, 92.5);
INSERT INTO public.productos VALUES (61, 'Caminos  (otros)', 92.5, 92.5);
INSERT INTO public.productos VALUES (62, 'Lazos dorados', 20, 20);
INSERT INTO public.productos VALUES (63, 'Lazos verdes', 20, 20);
INSERT INTO public.productos VALUES (64, 'Lazos azules', 20, 20);
INSERT INTO public.productos VALUES (65, 'Lazos celestes', 20, 20);
INSERT INTO public.productos VALUES (66, 'Lazos rojos', 20, 20);
INSERT INTO public.productos VALUES (67, 'Lazos anaranjados', 20, 20);
INSERT INTO public.productos VALUES (68, 'Lazos negros', 20, 20);
INSERT INTO public.productos VALUES (69, 'Lazos blancos', 20, 20);
INSERT INTO public.productos VALUES (70, 'lazos cafe', 20, 20);
INSERT INTO public.productos VALUES (71, 'Lazos terracota', 20, 20);
INSERT INTO public.productos VALUES (72, 'Lazos coral', 20, 20);
INSERT INTO public.productos VALUES (73, 'Lazos rosados', 20, 20);
INSERT INTO public.productos VALUES (74, 'Lazos fucsia', 20, 20);
INSERT INTO public.productos VALUES (75, 'Lazos amarillos', 20, 20);
INSERT INTO public.productos VALUES (76, 'lazos lilas', 20, 20);
INSERT INTO public.productos VALUES (77, 'Lazos morados', 20, 20);
INSERT INTO public.productos VALUES (78, 'Lazos plateados', 20, 20);
INSERT INTO public.productos VALUES (79, 'Servilletas de lujo', 37, 37);
INSERT INTO public.productos VALUES (80, 'Servilletas corrientes', 27.75, 27.75);
INSERT INTO public.productos VALUES (81, 'Servilletas doradas', 37, 37);
INSERT INTO public.productos VALUES (82, 'Servilletas plateadas', 37, 37);
INSERT INTO public.productos VALUES (83, 'Vestidos de sillas redondos', 25, 25);
INSERT INTO public.productos VALUES (84, 'Vestidos de sillas cuadradas', 25, 25);
INSERT INTO public.productos VALUES (85, 'Cojines para sillas tifany', 37, 37);
INSERT INTO public.productos VALUES (86, 'Bambalinas para buffet', 259, 259);
INSERT INTO public.productos VALUES (87, 'Bambalinas tarima 1/2 mt', 500, 500);
INSERT INTO public.productos VALUES (88, 'Bambalinas tarima metro', 700, 700);
INSERT INTO public.productos VALUES (89, 'Bambalina tarima 1 1/2', 500, 500);
INSERT INTO public.productos VALUES (90, 'Tela decoracion rosada', 300, 300);
INSERT INTO public.productos VALUES (91, 'Tela decoracion verde', 300, 300);
INSERT INTO public.productos VALUES (92, 'Tela decoracion dorada', 300, 300);
INSERT INTO public.productos VALUES (93, 'Tela decoracion plateada', 300, 300);
INSERT INTO public.productos VALUES (94, 'Tela decoracion celeste', 300, 300);
INSERT INTO public.productos VALUES (95, 'Tela decoracion plateada', 300, 300);
INSERT INTO public.productos VALUES (96, 'Tela decoracion negra', 300, 300);
INSERT INTO public.productos VALUES (97, 'Tela decoracion blanca', 300, 300);
INSERT INTO public.productos VALUES (98, 'Tela decoracion blan/negro', 300, 300);
INSERT INTO public.productos VALUES (99, 'Platones vidrio redon No12', 46.25, 46.25);
INSERT INTO public.productos VALUES (100, 'Platos red vidrio No 9', 45795, 45795);
INSERT INTO public.productos VALUES (101, 'Plato red melamina No 9', 45795, 45795);
INSERT INTO public.productos VALUES (102, 'Plato cuadrado No 9', 27.75, 27.75);
INSERT INTO public.productos VALUES (103, 'Platones cuadrados', 55.5, 55.5);
INSERT INTO public.productos VALUES (104, 'Platos cuadrados ensalada', 185, 185);
INSERT INTO public.productos VALUES (105, 'Platos redondos ensalada', 185, 185);
INSERT INTO public.productos VALUES (106, 'Platos redondos cafe', 45841, 45841);
INSERT INTO public.productos VALUES (107, 'Platos redondos postre', 45840, 45840);
INSERT INTO public.productos VALUES (108, 'Vasos lisos 10 onz', 45782, 45782);
INSERT INTO public.productos VALUES (109, 'Vasos no lisos 10 onz', 45782, 45782);
INSERT INTO public.productos VALUES (110, 'Vasos para tragos', 6.29, 6.29);
INSERT INTO public.productos VALUES (111, 'Shot (chupitos)', 45841, 45841);
INSERT INTO public.productos VALUES (112, 'Tazas para cafe', 45841, 45841);
INSERT INTO public.productos VALUES (113, 'Tazas para consome redon', 9.25, 9.25);
INSERT INTO public.productos VALUES (114, 'Tazas para consome cuadra', 45668, 45668);
INSERT INTO public.productos VALUES (115, 'Tazas para sopas', 12.95, 12.95);
INSERT INTO public.productos VALUES (116, 'Tenedores plato fuerte', 45782, 45782);
INSERT INTO public.productos VALUES (117, 'Tenedores ensalada', 45782, 45782);
INSERT INTO public.productos VALUES (118, 'Cuchillos plato fuerte', 45782, 45782);
INSERT INTO public.productos VALUES (119, 'Cuchillos para ensalada', 45782, 45782);
INSERT INTO public.productos VALUES (120, 'Cucharas para postre', 45782, 45782);
INSERT INTO public.productos VALUES (121, 'Cucharas para sopa', 45782, 45782);
INSERT INTO public.productos VALUES (122, 'Salsera para coleslow blan', 45841, 45841);
INSERT INTO public.productos VALUES (123, 'Salsera para coleslow negra', 4.44, 4.44);
INSERT INTO public.productos VALUES (124, 'Panitas  comidas de niño', 5.55, 5.55);
INSERT INTO public.productos VALUES (125, 'Copas para vino blanco', 45668, 45668);
INSERT INTO public.productos VALUES (126, 'Copas para vino tinto', 45668, 45668);
INSERT INTO public.productos VALUES (127, 'Copas  para champagne', 12.95, 12.95);
INSERT INTO public.productos VALUES (128, 'Copas para martini', 16.65, 16.65);
INSERT INTO public.productos VALUES (129, 'Copas para agua', 6.66, 6.66);
INSERT INTO public.productos VALUES (130, 'Picheles grandes', 37, 37);
INSERT INTO public.productos VALUES (131, 'Picheles pequeños', 45837, 45837);
INSERT INTO public.productos VALUES (132, 'Bandejas redondas grandes', 30, 30);
INSERT INTO public.productos VALUES (133, 'Bandejas redondas peque', 25, 25);
INSERT INTO public.productos VALUES (134, 'Bandejas cuadradas', 25, 25);
INSERT INTO public.productos VALUES (135, 'Shaffing ', 200, 200);
INSERT INTO public.productos VALUES (136, 'Shaffing de lujo', 500, 500);
INSERT INTO public.productos VALUES (137, 'Shaffing de salsa', 200, 200);
INSERT INTO public.productos VALUES (138, 'Platones ovalados bocadi', 100, 100);
INSERT INTO public.productos VALUES (139, 'Platones redon lujo ensala', 120, 120);
INSERT INTO public.productos VALUES (140, 'Bandeja  rect bocadillos', 50, 50);
INSERT INTO public.productos VALUES (141, 'Medida para arroz 4 onz', 10, 10);
INSERT INTO public.productos VALUES (142, 'Medida para arroz 6 onz', 10, 10);
INSERT INTO public.productos VALUES (143, 'Cucharon pequeño', 10, 10);
INSERT INTO public.productos VALUES (144, 'Palita para carne o pollo', 10, 10);
INSERT INTO public.productos VALUES (145, 'Cuchara  grande', 10, 10);
INSERT INTO public.productos VALUES (146, 'Pinzas', 7, 7);
INSERT INTO public.productos VALUES (147, 'Cuchara para pasta', 10, 10);
INSERT INTO public.productos VALUES (148, 'Techo estructura 10 x 10', 18500, 18500);
INSERT INTO public.productos VALUES (149, 'Techo estructura 10 x 5', 12950, 12950);
INSERT INTO public.productos VALUES (150, 'Techo estructura 7,5 x 7,5', 11100, 11100);
INSERT INTO public.productos VALUES (151, 'Techo estructura 5 x 5', 11100, 11100);
INSERT INTO public.productos VALUES (152, 'Estructura N', 2590, 2590);
INSERT INTO public.productos VALUES (153, 'Piso 4 x 4 madera', 5550, 5550);
INSERT INTO public.productos VALUES (154, 'Piso 6 x 4 madera', 7400, 7400);
INSERT INTO public.productos VALUES (155, 'Estructura 10 x 10', 12000, 12000);
INSERT INTO public.productos VALUES (156, 'Estructura 10 x 5', 10000, 10000);
INSERT INTO public.productos VALUES (157, 'Estructura 7,5 x 7,5', 8000, 8000);
INSERT INTO public.productos VALUES (158, 'Estructura 5 x 5', 7000, 7000);
INSERT INTO public.productos VALUES (159, 'Tarima 10 x 10', 37000, 37000);
INSERT INTO public.productos VALUES (160, 'Tarima 10 x 5', 18500, 18500);
INSERT INTO public.productos VALUES (161, 'Tarima 6 x 4', 11100, 11100);
INSERT INTO public.productos VALUES (162, 'Tarima 5 x 5', 10800, 10800);
INSERT INTO public.productos VALUES (163, 'Tarima 7,5 x 7,5', 20812, 20812);
INSERT INTO public.productos VALUES (164, 'Toldo 4 x 4', 1200, 1200);
INSERT INTO public.productos VALUES (165, 'Toldo 6 x 4', 1300, 1300);
INSERT INTO public.productos VALUES (166, 'Toldo 8 x 8', 2500, 2500);
INSERT INTO public.productos VALUES (167, 'Toldo 6 x 8', 2200, 2200);
INSERT INTO public.productos VALUES (168, 'Toldo 10 x 10', 3700, 3700);
INSERT INTO public.productos VALUES (169, 'Pista led 4 x 4', 24950, 24950);
INSERT INTO public.productos VALUES (170, 'Pista led 5 x 5', 29600, 29600);
INSERT INTO public.productos VALUES (171, 'Pantalla 3 x 2', 22200, 22200);
INSERT INTO public.productos VALUES (172, 'Pantalla  TV', 2590, 2590);
INSERT INTO public.productos VALUES (173, 'Equipo de audio Grande', 11100, 11100);
INSERT INTO public.productos VALUES (174, 'Equipo de audio mediano', 9250, 9250);
INSERT INTO public.productos VALUES (175, 'Equipo de audio pequeño', 5550, 5550);
INSERT INTO public.productos VALUES (176, 'Sonido luces y dj', 12950, 12950);
INSERT INTO public.productos VALUES (177, 'Luces led', 370, 370);
INSERT INTO public.productos VALUES (178, 'Luces para jardin', 370, 370);
INSERT INTO public.productos VALUES (179, 'Luz blanca', 370, 370);
INSERT INTO public.productos VALUES (180, 'Cabezas mobiles', 1850, 1850);
INSERT INTO public.productos VALUES (181, 'Seguidor', 1480, 1480);
INSERT INTO public.productos VALUES (182, 'Cañon de confeti', 4440, 4440);
INSERT INTO public.productos VALUES (183, 'Chispas frias', 3700, 3700);
INSERT INTO public.productos VALUES (184, '360', 5550, 5550);
INSERT INTO public.productos VALUES (185, 'Proyector', 2590, 2590);
INSERT INTO public.productos VALUES (186, 'Lazer', 1850, 1850);
INSERT INTO public.productos VALUES (187, 'Maquina de humo', 1850, 1850);
INSERT INTO public.productos VALUES (188, 'Brinca Brinca', 1850, 1850);
INSERT INTO public.productos VALUES (189, 'Maquina de palomitas', 500, 500);
INSERT INTO public.productos VALUES (190, 'Cabina', 9250, 9250);
INSERT INTO public.productos VALUES (191, 'Fotos', 5550, 5550);
INSERT INTO public.productos VALUES (192, 'Videos', 7400, 7400);
INSERT INTO public.productos VALUES (193, 'Decoracion', 7400, 7400);
INSERT INTO public.productos VALUES (194, 'Comidas', 370, 370);
INSERT INTO public.productos VALUES (195, 'Meseros', 1500, 1500);
INSERT INTO public.productos VALUES (196, 'Bebidas', 129.5, 129.5);
INSERT INTO public.productos VALUES (197, 'Chandelier', 3700, 3700);
INSERT INTO public.productos VALUES (198, 'Trono dorado', 1850, 1850);
INSERT INTO public.productos VALUES (199, 'Trono plateado', 1850, 1850);
INSERT INTO public.productos VALUES (200, 'Bancos blancos', 740, 740);
INSERT INTO public.productos VALUES (201, 'Sofa lounge', 555, 555);
INSERT INTO public.productos VALUES (202, 'Butacos lounge', 370, 370);
INSERT INTO public.productos VALUES (203, 'Mesa lounge', 370, 370);


--
-- TOC entry 3414 (class 0 OID 24679)
-- Dependencies: 220
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proveedor VALUES (2, 'Muebleria Gutierrez');
INSERT INTO public.proveedor VALUES (1, 'FABRICA CHINAX');


--
-- TOC entry 3418 (class 0 OID 24756)
-- Dependencies: 224
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES (1, 'EDGARD', 'GONZALEZ', 'egonzalez@bcn.gob.ni', 'egonzalez', '$2y$10$33fRfgxTOCiQFdlLFm22K.pQHvIdPdGhowaZXDKlSOSk/1NP8WtvG', 1, 0, 1, 0, 0, '2025-09-25', 0, '2025-02-03 00:00:00', 1, '2025-11-07 00:00:00', 1, 1);


--
-- TOC entry 3409 (class 0 OID 24622)
-- Dependencies: 215
-- Data for Name: xx; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.xx VALUES ('Sillas Folding', 240);
INSERT INTO public.xx VALUES ('Sillas Garden', 100);
INSERT INTO public.xx VALUES ('Sillas tifany dorada', 100);
INSERT INTO public.xx VALUES ('Sillas tifany plateada', 100);
INSERT INTO public.xx VALUES ('Sillas hoteleras', 35);
INSERT INTO public.xx VALUES ('Sillas cocteleras aluminio', 40);
INSERT INTO public.xx VALUES ('Bancos cocteleros', 10);
INSERT INTO public.xx VALUES ('Mesas cocteleras', 10);
INSERT INTO public.xx VALUES ('Mesas redondas 8 personas', 30);
INSERT INTO public.xx VALUES ('Mesas redondas 10 personas', 30);
INSERT INTO public.xx VALUES ('Mesas cuadradas', 20);
INSERT INTO public.xx VALUES ('Mesas Cocteleras', 10);
INSERT INTO public.xx VALUES ('Mesas decoracion madera', 1);
INSERT INTO public.xx VALUES ('Mesa Decoracion hierro', 3);
INSERT INTO public.xx VALUES ('Manteles blancos redon lisos', 30);
INSERT INTO public.xx VALUES ('Manteles blancos redon lujo', 40);
INSERT INTO public.xx VALUES ('Manteles rojos redondos', 10);
INSERT INTO public.xx VALUES ('Manteles azules redondos', 10);
INSERT INTO public.xx VALUES ('Manteles dorados redondos', 10);
INSERT INTO public.xx VALUES ('Manteles amarillos redon', 10);
INSERT INTO public.xx VALUES ('Manteles verdes redondos', 10);
INSERT INTO public.xx VALUES ('Manteles celestes redondos', 10);
INSERT INTO public.xx VALUES ('Manteles cafe redondos', 10);
INSERT INTO public.xx VALUES ('Manteles rosados redondos', 10);
INSERT INTO public.xx VALUES ('Manteles fucsia redondos', 10);
INSERT INTO public.xx VALUES ('Manteles lilas redondos', 10);
INSERT INTO public.xx VALUES ('Manteles negros redondos', 10);
INSERT INTO public.xx VALUES ('Manteles spandex coctel', 10);
INSERT INTO public.xx VALUES ('Manteles spandex mesa red', 5);
INSERT INTO public.xx VALUES ('Manteles spandex rectang', 5);
INSERT INTO public.xx VALUES ('Manteles Rect Blanco liso', 20);
INSERT INTO public.xx VALUES ('Manteles rect blancos lujo', 10);
INSERT INTO public.xx VALUES ('Manteles rect rosados', 1);
INSERT INTO public.xx VALUES ('Manteles rectangulares lila', 1);
INSERT INTO public.xx VALUES ('Manteles rectang. morad', 1);
INSERT INTO public.xx VALUES ('Manteles rectang dorado', 1);
INSERT INTO public.xx VALUES ('Manteles rectang azul', 1);
INSERT INTO public.xx VALUES ('Cubremanteles redon rojos', 12);
INSERT INTO public.xx VALUES ('Cubremanteles redon dora', 10);
INSERT INTO public.xx VALUES ('Cubremanteles redon azul', 10);
INSERT INTO public.xx VALUES ('Cubremanteles redon amar', 10);
INSERT INTO public.xx VALUES ('Cubremanteles spandex', 10);
INSERT INTO public.xx VALUES ('Caminos cafe', 12);
INSERT INTO public.xx VALUES ('Caminos dorados', 40);
INSERT INTO public.xx VALUES ('Caminos verdes menta', 12);
INSERT INTO public.xx VALUES ('Caminos rosados', 12);
INSERT INTO public.xx VALUES ('Caminos amarillos', 12);
INSERT INTO public.xx VALUES ('Caminos rojos', 12);
INSERT INTO public.xx VALUES ('Camonos verde esmeralda', 12);
INSERT INTO public.xx VALUES ('Caminos celestes', 12);
INSERT INTO public.xx VALUES ('Caminos coral', 12);
INSERT INTO public.xx VALUES ('Caminos terracota', 12);
INSERT INTO public.xx VALUES ('Caminos negros', 12);
INSERT INTO public.xx VALUES ('Caminos anaranjados', 12);
INSERT INTO public.xx VALUES ('Caminos azules', 12);
INSERT INTO public.xx VALUES ('Caminos plateados', 12);
INSERT INTO public.xx VALUES ('Caminos  (otros)', 12);
INSERT INTO public.xx VALUES ('Lazos dorados', 300);
INSERT INTO public.xx VALUES ('Lazos verdes', 100);
INSERT INTO public.xx VALUES ('Lazos azules', 150);
INSERT INTO public.xx VALUES ('Lazos celestes', 110);
INSERT INTO public.xx VALUES ('Lazos rojos', 110);
INSERT INTO public.xx VALUES ('Lazos anaranjados', 110);
INSERT INTO public.xx VALUES ('Lazos negros', 100);
INSERT INTO public.xx VALUES ('Lazos blancos', 70);
INSERT INTO public.xx VALUES ('lazos cafe', 110);
INSERT INTO public.xx VALUES ('Lazos terracota', 50);
INSERT INTO public.xx VALUES ('Lazos coral', 100);
INSERT INTO public.xx VALUES ('Lazos rosados', 150);
INSERT INTO public.xx VALUES ('Lazos fucsia', 150);
INSERT INTO public.xx VALUES ('Lazos amarillos', 100);
INSERT INTO public.xx VALUES ('lazos lilas', 100);
INSERT INTO public.xx VALUES ('Lazos morados', 100);
INSERT INTO public.xx VALUES ('Lazos plateados', 120);
INSERT INTO public.xx VALUES ('Servilletas de lujo', 300);
INSERT INTO public.xx VALUES ('Servilletas corrientes', 250);
INSERT INTO public.xx VALUES ('Servilletas doradas', 15);
INSERT INTO public.xx VALUES ('Servilletas plateadas', 10);
INSERT INTO public.xx VALUES ('Vestidos de sillas redondos', 250);
INSERT INTO public.xx VALUES ('Vestidos de sillas cuadradas', 350);
INSERT INTO public.xx VALUES ('Cojines para sillas tifany', 350);
INSERT INTO public.xx VALUES ('Bambalinas para buffet', 5);
INSERT INTO public.xx VALUES ('Bambalinas tarima 1/2 mt', 2);
INSERT INTO public.xx VALUES ('Bambalinas tarima metro', 2);
INSERT INTO public.xx VALUES ('Bambalina tarima 1 1/2', 1);
INSERT INTO public.xx VALUES ('Tela decoracion rosada', 50);
INSERT INTO public.xx VALUES ('Tela decoracion verde', 100);
INSERT INTO public.xx VALUES ('Tela decoracion dorada', 30);
INSERT INTO public.xx VALUES ('Tela decoracion plateada', 30);
INSERT INTO public.xx VALUES ('Tela decoracion celeste', 20);
INSERT INTO public.xx VALUES ('Tela decoracion plateada', 20);
INSERT INTO public.xx VALUES ('Tela decoracion negra', 20);
INSERT INTO public.xx VALUES ('Tela decoracion blanca', 150);
INSERT INTO public.xx VALUES ('Tela decoracion blan/negro', 30);
INSERT INTO public.xx VALUES ('Platones vidrio redon No12', 30);
INSERT INTO public.xx VALUES ('Platos red vidrio No 9', 250);
INSERT INTO public.xx VALUES ('Plato red melamina No 9', 200);
INSERT INTO public.xx VALUES ('Plato cuadrado No 9', 20);
INSERT INTO public.xx VALUES ('Platones cuadrados', 10);
INSERT INTO public.xx VALUES ('Platos cuadrados ensalada', 10);
INSERT INTO public.xx VALUES ('Platos redondos ensalada', 20);
INSERT INTO public.xx VALUES ('Platos redondos cafe', 30);
INSERT INTO public.xx VALUES ('Platos redondos postre', 100);
INSERT INTO public.xx VALUES ('Vasos lisos 10 onz', 350);
INSERT INTO public.xx VALUES ('Vasos no lisos 10 onz', 150);
INSERT INTO public.xx VALUES ('Vasos para tragos', 100);
INSERT INTO public.xx VALUES ('Shot (chupitos)', 5);
INSERT INTO public.xx VALUES ('Tazas para cafe', 20);
INSERT INTO public.xx VALUES ('Tazas para consome redon', 10);
INSERT INTO public.xx VALUES ('Tazas para consome cuadra', 10);
INSERT INTO public.xx VALUES ('Tazas para sopas', 1);
INSERT INTO public.xx VALUES ('Tenedores plato fuerte', 500);
INSERT INTO public.xx VALUES ('Tenedores ensalada', 10);
INSERT INTO public.xx VALUES ('Cuchillos plato fuerte', 500);
INSERT INTO public.xx VALUES ('Cuchillos para ensalada', 10);
INSERT INTO public.xx VALUES ('Cucharas para postre', 50);
INSERT INTO public.xx VALUES ('Cucharas para sopa', 10);
INSERT INTO public.xx VALUES ('Salsera para coleslow blan', 40);
INSERT INTO public.xx VALUES ('Salsera para coleslow negra', 30);
INSERT INTO public.xx VALUES ('Panitas  comidas de niño', 50);
INSERT INTO public.xx VALUES ('Copas para vino blanco', 50);
INSERT INTO public.xx VALUES ('Copas para vino tinto', 30);
INSERT INTO public.xx VALUES ('Copas  para champagne', 50);
INSERT INTO public.xx VALUES ('Copas para martini', 20);
INSERT INTO public.xx VALUES ('Copas para agua', 100);
INSERT INTO public.xx VALUES ('Picheles grandes', 5);
INSERT INTO public.xx VALUES ('Picheles pequeños', 1);
INSERT INTO public.xx VALUES ('Bandejas redondas grandes', 5);
INSERT INTO public.xx VALUES ('Bandejas redondas peque', 6);
INSERT INTO public.xx VALUES ('Bandejas cuadradas', 4);
INSERT INTO public.xx VALUES ('Shaffing ', 20);
INSERT INTO public.xx VALUES ('Shaffing de lujo', 5);
INSERT INTO public.xx VALUES ('Shaffing de salsa', 2);
INSERT INTO public.xx VALUES ('Platones ovalados bocadi', 3);
INSERT INTO public.xx VALUES ('Platones redon lujo ensala', 2);
INSERT INTO public.xx VALUES ('Bandeja  rect bocadillos', 3);
INSERT INTO public.xx VALUES ('Medida para arroz 4 onz', 4);
INSERT INTO public.xx VALUES ('Medida para arroz 6 onz', 2);
INSERT INTO public.xx VALUES ('Cucharon pequeño', 4);
INSERT INTO public.xx VALUES ('Palita para carne o pollo', 4);
INSERT INTO public.xx VALUES ('Otras mesas', 1);
INSERT INTO public.xx VALUES ('Cuchara  grande', 5);
INSERT INTO public.xx VALUES ('Pinzas', 15);
INSERT INTO public.xx VALUES ('Cuchara para pasta', 4);
INSERT INTO public.xx VALUES ('Techo estructura 10 x 10', 2);
INSERT INTO public.xx VALUES ('Techo estructura 10 x 5', 2);
INSERT INTO public.xx VALUES ('Techo estructura 7,5 x 7,5', 1);
INSERT INTO public.xx VALUES ('Techo estructura 5 x 5', 2);
INSERT INTO public.xx VALUES ('Estructura N', 6);
INSERT INTO public.xx VALUES ('Piso 4 x 4 madera', 1);
INSERT INTO public.xx VALUES ('Piso 6 x 4 madera', 1);
INSERT INTO public.xx VALUES ('Estructura 10 x 10', 1);
INSERT INTO public.xx VALUES ('Estructura 10 x 5', 1);
INSERT INTO public.xx VALUES ('Estructura 7,5 x 7,5', 1);
INSERT INTO public.xx VALUES ('Estructura 5 x 5', 1);
INSERT INTO public.xx VALUES ('Tarima 10 x 10', 1);
INSERT INTO public.xx VALUES ('Tarima 10 x 5', 1);
INSERT INTO public.xx VALUES ('Tarima 6 x 4', 1);
INSERT INTO public.xx VALUES ('Tarima 5 x 5', 1);
INSERT INTO public.xx VALUES ('Tarima 7,5 x 7,5', 1);
INSERT INTO public.xx VALUES ('Toldo 4 x 4', 1);
INSERT INTO public.xx VALUES ('Toldo 6 x 4', 3);
INSERT INTO public.xx VALUES ('Toldo 8 x 8', 2);
INSERT INTO public.xx VALUES ('Toldo 6 x 8', 2);
INSERT INTO public.xx VALUES ('Toldo 10 x 10', 2);
INSERT INTO public.xx VALUES ('Pista led 4 x 4', 1);
INSERT INTO public.xx VALUES ('Pista led 5 x 5', 1);
INSERT INTO public.xx VALUES ('Pantalla 3 x 2', 1);
INSERT INTO public.xx VALUES ('Pantalla  TV', 1);
INSERT INTO public.xx VALUES ('Equipo de audio Grande', 1);
INSERT INTO public.xx VALUES ('Equipo de audio mediano', 1);
INSERT INTO public.xx VALUES ('Equipo de audio pequeño', 3);
INSERT INTO public.xx VALUES ('Sonido luces y dj', 4);
INSERT INTO public.xx VALUES ('Luces led', 100);
INSERT INTO public.xx VALUES ('Luces para jardin', 15);
INSERT INTO public.xx VALUES ('Luz blanca', 15);
INSERT INTO public.xx VALUES ('Cabezas mobiles', 2);
INSERT INTO public.xx VALUES ('Seguidor', 1);
INSERT INTO public.xx VALUES ('Cañon de confeti', 1);
INSERT INTO public.xx VALUES ('Chispas frias', 2);
INSERT INTO public.xx VALUES ('360', 1);
INSERT INTO public.xx VALUES ('Proyector', 1);
INSERT INTO public.xx VALUES ('Lazer', 1);
INSERT INTO public.xx VALUES ('Maquina de humo', 2);
INSERT INTO public.xx VALUES ('Brinca Brinca', 3);
INSERT INTO public.xx VALUES ('Maquina de palomitas', 3);
INSERT INTO public.xx VALUES ('Cabina', 1);
INSERT INTO public.xx VALUES ('Fotos', 4);
INSERT INTO public.xx VALUES ('Videos', 4);
INSERT INTO public.xx VALUES ('Decoracion', 5);
INSERT INTO public.xx VALUES ('Comidas', 1000);
INSERT INTO public.xx VALUES ('Meseros', 30);
INSERT INTO public.xx VALUES ('Bebidas', 1000);
INSERT INTO public.xx VALUES ('Chandelier', 3);
INSERT INTO public.xx VALUES ('Trono dorado', 1);
INSERT INTO public.xx VALUES ('Trono plateado', 1);
INSERT INTO public.xx VALUES ('Bancos blancos', 2);
INSERT INTO public.xx VALUES ('Sofa lounge', 8);
INSERT INTO public.xx VALUES ('Butacos lounge', 16);
INSERT INTO public.xx VALUES ('Mesa lounge', 8);
INSERT INTO public.xx VALUES ('Manteles  (otros)', 1);
INSERT INTO public.xx VALUES ('Cubremanteles cuadrados', 1);
INSERT INTO public.xx VALUES ('Cubremanteles  (otros)', 1);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 227
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 4, true);


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 234
-- Name: id_dalquiler_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_dalquiler_seq', 11, true);


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 237
-- Name: id_dfactura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_dfactura_seq', 3, true);


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 231
-- Name: id_dpaquete_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_dpaquete_seq', 12, true);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 222
-- Name: idalquiler_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.idalquiler_seq', 14, true);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 221
-- Name: idfactura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.idfactura_seq', 1, true);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 218
-- Name: idpaquete_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.idpaquete_seq', 10, true);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 214
-- Name: idproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.idproducto_seq', 205, true);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 219
-- Name: idproveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.idproveedor_seq', 2, true);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 229
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 6, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);


--
-- TOC entry 3262 (class 2606 OID 41009)
-- Name: alquiler Alquiler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT "Alquiler_pkey" PRIMARY KEY (idalquiler);


--
-- TOC entry 3264 (class 2606 OID 41044)
-- Name: factura Factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT "Factura_pkey" PRIMARY KEY (idfactura);


--
-- TOC entry 3260 (class 2606 OID 32792)
-- Name: paquetes Paquetes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT "Paquetes_pkey" PRIMARY KEY (idpaquete);


--
-- TOC entry 3248 (class 2606 OID 24657)
-- Name: productos Productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT "Productos_pkey" PRIMARY KEY (idproducto);


--
-- TOC entry 3250 (class 2606 OID 24684)
-- Name: proveedor Proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT "Proveedor_pkey" PRIMARY KEY (idproveedor);


--
-- TOC entry 3256 (class 2606 OID 24833)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3254 (class 2606 OID 24774)
-- Name: institucion instituc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT instituc_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3258 (class 2606 OID 24835)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 3252 (class 2606 OID 24768)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3265 (class 2606 OID 24836)
-- Name: pedidos pedidos_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON DELETE CASCADE;


-- Completed on 2025-11-07 09:11:18

--
-- PostgreSQL database dump complete
--

