-- View: public.Alquileres

-- DROP VIEW public."Alquileres";

CREATE OR REPLACE VIEW public."Alquileres"
 AS
 SELECT a.idalquiler,
    a.cliente,
    a.direccion,
    a.fecha,
    a.fechaevento,
    a.fecharegistro,
    a.monto,
    a.observaciones,
    a.telefono,
    d.id_dalquiler,
    d.idproducto,
    p.nombre,
    d.cantidad,
    d.precio,
    d.cantidad::double precision * d.precio AS montod
   FROM alquiler a
     JOIN dalquiler d ON a.idalquiler = d.idalquiler
     JOIN productos p ON d.idproducto = p.idproducto;

ALTER TABLE public."Alquileres"
    OWNER TO postgres;

