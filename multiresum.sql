/* * * TEORIA * * *

1)Funcions d'agregaci�:
--COUNT(), COUNT(*) para PK, COUNT(DISTINCT)
--SUM()
--AVG()
--MIN()
--MAX()

()--> nomcolumna o expressi�

Funcions d'agregaci� amb PK

2) Funcions d'agregaci� i GROUP BY

Tot lo que est� en el SELECT  tamb� estar� en el group by

explicar abans de l'exercici 3.21
exemple exercici 3.27


2) Funcions d'agregaci� i GROUP BY i HAVING
explicar abans de l'exercici 3.28
exemple 3.29

* * * TEORIA * * */

------------------------------------------------------
--          Consultes resum
------------------------------------------------------

--3.1 Quina es la quota promig mostrada com a "Promig quota" i la venda promig mostrades com a "Promig vendes" 
--dels venedors?
-- De tots els venedors
SELECT	ROUND(AVG(r.cuota), 2)  || '�' AS "Promig quota",
		ROUND(AVG(r.ventas), 2) || '�' AS "Promig vendes"
FROM repventas r;

--3.2	Quin es el rendiment de quota promig dels venedors (percentatge de les vendes
--		respecte la quota)?

SELECT ROUND(100 * (r.ventas / r.cuota), 2) || '%'  AS "Rendiment vendes / quota"
FROM repventas r;

--3.3	Quines son les quotes totals com a "Total quota" i vendes Totals com a 
--		"total ventas" de tots els venedors?
SELECT	SUM(r.cuota)  || '�'	AS "Total quota",
		SUM(r.ventas) || '�'	AS "Total vendes"
FROM repventas r;

-- Per cada oficina (cuitat)
SELECT	o.ciudad,
		SUM(r.cuota)	|| '�'	AS "Total quota",
		SUM(r.ventas)	|| '�'	AS "Total vendes"
FROM repventas r, oficinas o 
WHERE r.oficina_rep = o.oficina 
GROUP BY o.ciudad 
ORDER BY o.ciudad;

-- Per cada regi� (nom regio)
SELECT	o.region,
		SUM(r.cuota)	|| '�'	AS "Total quota per regi�",
		SUM(r.ventas)	|| '�'	AS "Total vendes per regi�"
FROM repventas r, oficinas o 
WHERE r.oficina_rep = o.oficina 
GROUP BY o.region 
ORDER BY o.region;

--3.4	Calcula el preu mig dels productes del fabricant 
--		amb identificador de fabricant "ACI".

SELECT ROUND(AVG(p.precio), 2) || '�' AS "Preu mig del fabricant ACI"
FROM productos p 
WHERE p.id_fab ILIKE '%ACI%';

--3.5 Quines son les quotes assignades minima i maxima als representants de ventes?
SELECT	MAX(r.cuota) || '�' AS "Quota m�xima",
		MIN(r.cuota) || '�' AS "Quota m�nima"
FROM repventas r
	WHERE r.titulo ILIKE '%rep ventas%';

--3.6 Quina es la data de comanda mes antiga?
SELECT MIN(p.fecha_pedido) || '�' AS "Comanda m�s antiga"
FROM pedidos p;	

--3.7	Quin es el major percentatge de rendiment de vendes respecte les quotes de tots
--		els venedors?
SELECT MAX(ROUND(100 * (r.ventas / r.cuota), 2)) || '%' AS "Major % rendiment vendes / cuota"
FROM repventas r;

--3.8 Quants clients hi ha?
SELECT COUNT(*) AS "Total clients"
FROM clientes c;

--3.9 Quants venedors superen la seva quota?
SELECT COUNT(*)
FROM repventas r 
WHERE r.ventas > r.cuota;

--3.10 Quantes comandes amb un import superior a 25000 hi ha en els registres?
SELECT COUNT(p.num_pedido) AS "N�m. comandes > 25K"
FROM pedidos p
WHERE p.importe > 25000;

--3.11 Quants clients estan atessos per el venedor Bill Adams? 
SELECT COUNT(c.num_clie) AS "Clients de Bill Adams" 
FROM clientes c, repventas r 
WHERE c.rep_clie = r.num_empl 
	AND r.nombre = 'Bill Adams';

--3.12 Trobar l'import mitj�  de les comandes, l'import total de les comandes,
--l'import mitj� de les comandes com a percentatge del limit de credit del client
--i l'import mitj� de comandes com a percentatge de la quota del venedor.
SELECT	ROUND(AVG(p.importe), 2) || '�' AS "Mitja de les comandes",
		SUM(p.importe) 			 || '�' AS "Import total comandes",
		ROUND(AVG(100 * (p.importe / c.limite_credito)),2)	|| '%' AS "% mitja comandes l�mit credit client",
		ROUND(AVG(100 * (p.importe / r.cuota)),2)  			|| '%' AS "% mitja comandes quota venedor"
FROM pedidos p, clientes c, repventas r
WHERE p.clie = c.num_clie 
	AND r.num_empl = c.rep_clie;

--3.13 Compta les files que hi ha a repventas, les files del camp vendes i les del camp quota.

SELECT	COUNT(r.num_empl)	AS "Compta repventas",
		COUNT(r.ventas)		AS "Compta vendes",
		COUNT(r.cuota)		AS "Compta quota"
FROM repventas r;

--3.14 Mostra que la suma de restar (vendes menys quota) �s diferent de la suma de vendes menys la suma de quotes.
SELECT	SUM(r.ventas - r.cuota)	 	|| '�'	AS "Suma vendes - quota",
		SUM(r.ventas) - SUM(r.cuota)|| '�'AS "Suma vendes - Suma quota"
FROM repventas r;

--3.15 Quants titols diferents tenen els venedors?
SELECT COUNT(DISTINCT(r.titulo)) AS "T�tols diferents de venedors"
FROM repventas r;

--3.16 Quantes oficines de vendes tenen venedors que superen les seves quotes?
SELECT COUNT(DISTINCT(r.oficina_rep)) AS "Oficines amb venedors que superen la seva quota"
FROM repventas r
WHERE r.ventas > r.cuota;

--3.17 De la taula clients quants clients diferents i venedors diferents hi ha.
SELECT	COUNT(c.num_clie) 			AS "Clients diferents",
		COUNT(DISTINCT(c.rep_clie)) AS "Venedors diferents"
FROM clientes c;

--3.19 Calcular la mitjana dels imports de les comandes.
SELECT ROUND(AVG(p.importe), 2) || '�' AS "Mitjana dels imports de les comandes"
FROM pedidos p;

--3.20 Calcula la mitjana de l'import d'una comanda realitzada pel client amb nom d'empresa "Acme Mfg."
SELECT ROUND(AVG(p.importe), 2) || '�' AS "Mitjana impots empresa Acme Mfg."
FROM clientes c, pedidos p 
WHERE c.num_clie = p.clie
	AND c.empresa ILIKE '%acme mfg.%';
	--AND c.empresa = 'Acme Mfg.';
	
--3.21 Quin es l'import promig de les comandes de cada venedor?
SELECT	r.nombre AS "Nom venedor",
		p.rep AS "Codi venedor", 
		ROUND(AVG(p.importe), 2) AS "Import promig"
FROM pedidos p, repventas r 
WHERE p.rep = r.num_empl  
GROUP BY r.nombre, p.rep
ORDER BY 1 ASC, 3 DESC;

-- TOT LO QUE HI HA A SELECT HA D'ESTAR A GROUP BY TAMB� EXCEPTE LES FUNCIONS D'AGREGAT

--3.22 Quin es el rang (maxim i minim) de quotes dels venedors per cada oficina?
SELECT	o.ciudad,
		o.region,
		MAX(r.cuota) AS "Quota m�xima",
		MIN(r.cuota) AS "Quota m�nima"
FROM repventas r, oficinas o 
WHERE r.oficina_rep = o.oficina 
	AND r.cuota IS NOT NULL
GROUP BY o.ciudad, o.region, r.oficina_rep
ORDER BY 2, 1;

--3.23 Quants venedors estan asignats a cada oficina?
SELECT	o.ciudad,
		o.region,
		r.oficina_rep,
		COUNT(r.num_empl) AS "N�m. venedors" 
FROM repventas r, oficinas o 
WHERE r.oficina_rep = o.oficina 
	AND r.oficina_rep IS NOT NULL
GROUP BY o.ciudad, o.region,r.oficina_rep
ORDER BY 4 DESC;

--3.24 Per cada venedor calcular quants clients diferents ha at�s (ha fet comandes)?
SELECT	r.nombre,
		p.rep,
		COUNT(DISTINCT(p.clie)) "Comandes per cada client"
FROM pedidos p, repventas r
WHERE p.rep = r.num_empl 
GROUP BY r.nombre, p.rep
ORDER BY 3 DESC;

--3.25 Calcula el total dels imports de les comandes fetes per cada client a cada vendedor.
SELECT	SUM(p.importe) AS "Total imports comandes",
		c.empresa AS "Client",
		r.nombre AS "Venedor"
FROM pedidos p, clientes c, repventas r
WHERE p.rep = r.num_empl 
	AND p.clie = c.num_clie 
GROUP BY c.empresa, r.nombre
ORDER BY 1 DESC;

--3.26 El mateix que a la questio anterior, pero ordenat per client i dintre de client per venedor.
SELECT	SUM(p.importe) AS "Total imports comandes",
		c.empresa AS "Client",
		r.nombre AS "Venedor"
FROM pedidos p, clientes c, repventas r
WHERE p.rep = r.num_empl 
	AND p.clie = c.num_clie 
GROUP BY 2, 3
ORDER BY 2, 3;

-- * Total de quotes de cadasc� dels representats de
-- vendes i mostrem el total, el seu nom nom�s

-- (MULTITAULA)

--3.27 Calcula les comandes totals per a cada venedor.



-- (HAVING)
--3.28a Quin es l'import promig de les comandes per cada venedor 
--que les seves comandes sumen mes de 30000?
SELECT  r.nombre,
		ROUND(AVG(p.importe), 2) || '�' AS "Import promig"
FROM pedidos p, repventas r 
WHERE p.rep = r.num_empl 
GROUP BY r.nombre
HAVING SUM(p.importe) > 30000;

--3.28b Llistar el m�xim i el m�nim total de les quotes de cadascu dels 
--representats de vendes per� nom�s dels empleats que el
--cognom fintalitza en 's' i que el total de la quota 
--sigui major que 300000.



--3.28c Llistar de les oficines el total de ventes



--3.28d Llistar de les oficines el total de ventes
--per cadascuna de les oficines que tinguin mes d'un
--director



--3.28e Llistar de les oficines els directors
--per cadascuna de les oficines que treballin
--m�s d'una



--3.29a Per cada oficina amb dos o mes empleats, calcular la quota total
--i les vendes totals per a tots els venedors que treballen a 
--la oficina (volem que mostrar la ciutat de l'oficina a la consulta)



--3.29b LListar quantitat d'oficines per regi� Este


--3.30 Mostra el preu, les existencies i la quantitat total de les
--comandes de cada producte per als quals la quantitat total demanada 
--est� per sobre del 75% de les existencies.



-- Amb clau completa

--3.31 Es desitja un llistat d'identificadors de fabricants de productes.
--Nomes volem tenir en compte els productes de preu superior a 54. 
--Nomes volem que apareguin els fabricants amb un nombre total d'unitats
--superior a 300.



--3.32 Es desitja un llistat dels productes amb les seves descripcions,
--ordenat per la suma total d'imports facturats (pedidos) de cada 
--producte de l'any 1989.

--AND ped.fecha_pedido BETWEEN '01/01/1989' AND '31/12/1989'



--3.33 Per a cada director (de personal, no d'oficina) excepte per 
-- al gerent (el venedor que no te director), vull saber el total de
-- vendes dels seus subordinats. Mostreu codi i nom dels directors.



--3.35 Es vol llistar el clients (codi i empresa) tals que no hagin 
--comprat cap tipus de frontissa ("bisagra" en castell� , figura a la
--descripcio) i hagin comprat articles de mes d'un fabricant diferent.



--3.36 Llisteu les oficines per ordre descendent de nombre total de 
--clients diferents amb comandes (pedidos) realizades pels venedors 
--d'aquella oficina, i, a igualtat de clients, ordenat per 
--ordre ascendent del nom del director de l'oficina.
--Nomes s'ha de mostrar el codi i la ciutat de l'oficina.



-- TOP 5 PEDIDOS CON IMPORTE M�S CARO

