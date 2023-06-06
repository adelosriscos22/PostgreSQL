/* TEORIA

	SELECT {* | [DISTINCT] nomcol [,nomcol2,...] [AS nomcol]| expressio}
	FROM nomtaula1 [AS alias][,nomtaula2...] 
	[WHERE condicio]
	[ORDER BY nom [DESC | ASC] ];

	SELECT nomtaula.nomcolumna
	FROM nomtaula 

	SELECT n.nomcolumna
	FROM nomtaula n

*/

/* EXEMPLE *

CREATE TABLE empleat
(
cod integer primary key,
nom CHARACTER VARYING(20),
ofi integer
);

CREATE TABLE oficina
( 
cod integer primary key,
ciutat CHARACTER VARYING(20),
ofi integer
);

ALTER TABLE empleat ADD CONSTRAINT fk_empleat FOREIGN KEY(ofi) REFERENCES oficina;

INSERT INTO oficina VALUES (11,'Barcelona');
INSERT INTO oficina VALUES(22,'Madrid');
INSERT INTO oficina VALUES(33,'Valencia');
INSERT INTO oficina VALUES(3,'MAL');

SELECT * FROM oficina;
INSERT INTO empleat VALUES(1,'Pepe',NULL);
INSERT INTO empleat VALUES(2,'Mario',11);
INSERT INTO empleat VALUES(3,'Carol',22);

SELECT * FROM empleat;

-- */

--SELECT * FROM empleat,oficina; --Producto cartesiano
--SELECT * FROM empleat CROSS JOIN oficina; --Producto cartesiano

--SELECT * FROM empleat,oficina WHERE oficina.cod = empleat.ofi; --Combinacion
--SELECT * FROM empleat JOIN oficina ON oficina.cod = empleat.ofi; --Combinacion
--SELECT * FROM empleat JOIN oficina USING(cod,ofi); --Combinacion, error porque existe

--NO es necessari escriure INNER
--SELECT * FROM empleat INNER JOIN oficina ON oficina.cod = empleat.ofi;--Combinacion
--SELECT * FROM empleat NATURAL JOIN oficina; --Combinacion, busca columnas con el mismo nombre


-- No es neccesari escriure OUTER

--SELECT * FROM oficina LEFT OUTER JOIN empleat ON oficina.cod = empleat.ofi;
--SELECT * FROM empleat RIGHT OUTER JOIN oficina ON oficina.cod = empleat.ofi;

--SELECT * FROM oficina RIGHT OUTER JOIN empleat ON oficina.cod = empleat.ofi;
--SELECT * FROM empleat LEFT OUTER JOIN oficina ON oficina.cod = empleat.ofi;


--SELECT * FROM empleat FULL OUTER JOIN oficina ON oficina.cod = empleat.ofi;

--DELETE TABLE empleat;
--DELETE TABLE oficina;

-------------------------------------------------------------------------------
--          Consultes multitaula
-------------------------------------------------------------------------------

-- 2.1 Llista de les oficines la ciutat i el nom i titol dels directors de cada oficina
SELECT ofi.oficina AS "Nom Oficina", ofi.ciudad, rep.nombre, rep.titulo
FROM oficinas ofi, repventas rep
WHERE ofi.oficina = rep.oficina_rep
	AND titulo ILIKE 'dir%';

-- 2.2 Llista totes les comandes mostrant el seu numero, import, nom de client i limit de credit.
SELECT ped.num_pedido, ped.importe, cli.empresa AS "Nom client", cli.limite_credito
FROM pedidos ped, clientes cli
WHERE ped.clie = cli.num_clie;

SELECT ped.num_pedido, ped.importe, cli.empresa AS "Nom client", cli.limite_credito
FROM pedidos ped INNER JOIN clientes cli ON ped.clie = cli.num_clie;

-- 2.3 Llista el numero de totes les comandes amb 
--la descripcio del producte demanat.
SELECT count(ventas) FROM repventas r;

SELECT ped.num_pedido, prod.descripcion
FROM pedidos ped, productos prod
WHERE ped.producto = prod.id_producto
	AND ped.fab = prod.id_fab
ORDER BY 1;

SELECT ped.num_pedido, prod.descripcion
FROM pedidos ped INNER JOIN productos prod
ON ped.fab = prod.id_fab
	AND ped.producto = prod.id_producto;

SELECT ped.num_pedido, prod.descripcion
FROM pedidos ped LEFT JOIN productos prod ON ped.fab = prod.id_fab
	AND ped.producto = prod.id_producto;

SELECT ped.num_pedido, prod.descripcion
FROM productos prod RIGHT JOIN pedidos ped ON ped.fab = prod.id_fab
	AND ped.producto = prod.id_producto
ORDER BY 1;

-- 2.4 Llista el nom de tots els clients amb
-- el nom del representant de vendes assignat.
SELECT count(*) FROM clientes c;

SELECT cli.empresa AS "Nom client", rep.Nombre AS "Represetant vendes", REP.num_empl 
FROM clientes cli LEFT JOIN repventas rep
ON cli.rep_clie = rep.num_empl
ORDER BY 2;

-- 2.5 Llista la data de totes les comandes amb 
--el numero comanda i nom del client de la comanda.
SELECT ped.fecha_pedido, ped.num_pedido, cli.empresa AS "Nom client"
FROM pedidos ped INNER JOIN clientes cli ON ped.clie = cli.num_clie;

-- 2.6 Llista les oficines, noms i titols del seus directors
-- amb un objectiu superior a 600.000.
SELECT ofi.oficina, rep.nombre, rep.titulo
FROM oficinas ofi, repventas rep
WHERE ofi.dir = rep.director
	AND ofi.objetivo > 600000;

-- 2.7 Llista els venedors de les oficines de la region 'Este'



-- 2.8 Llista les comandes superiors a 25000, 
--incloent el nom del venedor que va servir la comanda 
-- i el nom del client que el va sol·licitar.



-- 2.9 Informa sobre tots els venedors i les oficines en les que treballen.



-- 2.10 Llista les comandes superiors a 25000, mostrant el nom del client que el
-- va ordenar, el venedor associat al client, i l'oficina on el venedor treballa.



/*MES EXERCICIS*********************************/
-- 2.11 Llista totes les combinacions de venedors i oficines on la quota del venedor 
-- es superior o igual a l'objectiu de l'oficina.



-- 2.12 Llista les comandes superiors a 25000, mostrant el client que va servir
-- la comanda i el nom del venedor que te assignat el client. Ordenat per comanda.



-- 2.13 Llista els venedors i els seus directors ordenats per nom de l'empleat amb :
--	a) una quota superior a la dels seus directors.



--	b) una quota menor o igual a la dels seus directors.



--	c) Que empleat entre A i B no ha sortit?



-- 2.14 Llistar el nom de l'empresa i totes les comandes fetes pel client 2103.



-- 2.15 Llista aquelles comandes que el seu import sigui superior a 10000, mostrant el numero de comanda,
-- els imports i les descripcions del producte.



-- 2.16 Llista les comandes superiors a 25000, mostrant el nom del client que la va demanar, 
-- el venedor associat al client, l'oficina on el venedor treballa i la descripcio del producte 
-- ordenats per numero de comanda



-- 2.17 Trobar totes les comandes rebudes en els dies en que un nou venedor va ser contractat.
-- Per cada comanda mostrar un cop el numero, import i data de la comanda.



-- 2.18- Mostra el nom, les vendes dels treballadors que tenen assignada una oficina, amb la ciutat i l'objectiu de l'oficina de cada venedor.



--	a) Amb les vendes de cada treballador



-- 2.19- Llista el nom de tots els venedors i el del seu director en cas de tenir-ne. 
-- El camp que conte el nom del treballador s'ha d'identificar amb "nombre empleado" i el camp que conte 
-- el nom del director amb "nombre director" ordenat per nom de l'empleat



-- 2.20- Llista totes les combinacions possibles de venedors i ciutats.


