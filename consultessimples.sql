

-----------------------------------------------------------------
--          Consultes simples
-----------------------------------------------------------------

-- 1.1- Llista Els identificadors de les oficines amb la seva ciutat, els objectius i les vendes reals.

/* * * CONSULTA * * */

SELECT	oficina 
		ciudad,
		objetivo,
		ventas
FROM oficinas;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Id Oficina |   ciudad    | objetivo  |  ventas   
------------+-------------+-----------+-----------
         22 | Denver      | 300000.00 | 186042.00
         11 | New York    | 575000.00 | 692637.00
         12 | Chicago     | 800000.00 | 735042.00
         13 | Atlanta     | 350000.00 | 367911.00
         21 | Los Angeles | 725000.00 | 835915.00
(5 rows)

* * * RESULTAT * * */

-- 1.2- Els identificadors de les oficines de la region Este amb la seva ciutat, els objectius i les vendes reals.

/* * * CONSULTA * * */

SELECT	oficina AS "Id oficina",
		ciudad,
		objetivo,
		ventas
FROM oficinas
WHERE region = 'Este' ;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Id oficina |  ciudad  | objetivo  |  ventas   
------------+----------+-----------+-----------
         11 | New York | 575000.00 | 692637.00
         12 | Chicago  | 800000.00 | 735042.00
         13 | Atlanta  | 350000.00 | 367911.00
(3 rows)

* * * RESULTAT * * */

-- 1.3- Les ciutats en ordre alfabetic de les oficines de la region este amb els objectius i les vendes reals.

/* * * CONSULTA * * */

SELECT	ciudad,
		objetivo,
		ventas
FROM oficinas
WHERE region = 'Este'
ORDER BY ciudad ASC;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

  ciudad  | objetivo  |  ventas   
----------+-----------+-----------
 Atlanta  | 350000.00 | 367911.00
 Chicago  | 800000.00 | 735042.00
 New York | 575000.00 | 692637.00
(3 rows)

* * * RESULTAT * * */

-- 1.4- Les ciutats, els objectius i les vendes d'aquelles oficines que les seves vendes superin els seus objectius.

/* * * CONSULTA * * */

select * from oficinas;

SELECT	ciudad,
		objetivo,
		ventas
FROM oficinas
WHERE ventas > objetivo;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

   ciudad    | objetivo  |  ventas   
-------------+-----------+-----------
 New York    | 575000.00 | 692637.00
 Atlanta     | 350000.00 | 367911.00
 Los Angeles | 725000.00 | 835915.00
(3 rows)

* * * RESULTAT * * */

-- 1.5- Nom, quota i vendes de l'empleat representant de vendes numero 107.

/* * * CONSULTA * * */
select * from repventas;

SELECT	nombre,
		cuota,
		ventas
FROM repventas
WHERE num_empl = 107;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

    nombre     |   cuota   |  ventas   
---------------+-----------+-----------
 Nancy Angelli | 300000.00 | 186042.00
(1 row)

* * * RESULTAT * * */

-- 1.6- Nom i data de contracte dels representants de vendes amb vendes superiors a 300000.

/* * * CONSULTA * * */

SELECT	nombre,
		contrato AS "Fecha contrato"
FROM repventas
WHERE ventas > 300000;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

   nombre    | Fecha contrato 
-------------+----------------
 Bill Adams  | 1988-02-12
 Mary Jones  | 1989-10-12
 Sue Smith   | 1986-12-10
 Dan Roberts | 1986-10-20
 Larry Fitch | 1989-10-12
(5 rows)

* * * RESULTAT * * */

-- 1.7- Nom dels representants de vendes dirigits per l'empleat numero 104 Bob Smith.

/* * * CONSULTA * * */

SELECT nombre
FROM repventas
WHERE director = 104;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

   nombre    
-------------
 Bill Adams
 Dan Roberts
 Paul Cruz
(3 rows)

* * * RESULTAT * * */

-- 1.8- Nom dels venedors i data de contracte d'aquells que han estat contractats abans del 1988.

/* * * CONSULTA * * */

SELECT	nombre,
		contrato AS "Fecha contrato < 1988"
FROM repventas
WHERE DATE_PART('year',contrato) < 1988;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

   nombre    | Fecha contrato < 1988 
-------------+-----------------------
 Sue Smith   | 1986-12-10
 Bob Smith   | 1987-05-19
 Dan Roberts | 1986-10-20
 Paul Cruz   | 1987-03-01
(4 rows)

* * * RESULTAT * * */

-- 1.9- Identificador de les oficines i ciutat d'aquelles oficines que el seu objectiu es diferent a 800000.

/* * * CONSULTA * * */

SELECT	oficina AS "Id oficina",
		ciudad
FROM oficinas
WHERE objetivo <> 800000;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Id oficina |   ciudad    
------------+-------------
         22 | Denver
         11 | New York
         13 | Atlanta
         21 | Los Angeles
(4 rows)

* * * RESULTAT * * */

-- 1.10- Nom de l'empresa i limit de credit del client numero 2107.

/* * * CONSULTA * * */

SELECT	empresa,
		limite_credito
FROM clientes
WHERE num_clie = 2107;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

      empresa      | limite_credito 
-------------------+----------------
 Ace International |       35000.00
(1 row)

* * * RESULTAT * * */

-- 1.11- Llista id_fab com a "Identificador del fabricant", id_producto com a "Identificador del producte" i descripcion com a "Descripcio" dels productes.

/* * * CONSULTA * * */

SELECT	id_fab AS "Identificador del fabricant", 
		id_producto AS "Identificador del producte", 
		descripcion AS "Descripció del producte"
FROM productos;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Identificador del fabricant | Identificador del producte |    Descripció     
-----------------------------+----------------------------+-------------------
 rei                         | 2a45c                      | V Stago Trinquete
 aci                         | 4100y                      | Extractor
 qsa                         | xk47                       | Reductor
 bic                         | 41672                      | Plate
 imm                         | 779c                       | Riostra 2-Tm
 aci                         | 41003                      | Articulo Tipo 3
 aci                         | 41004                      | Articulo Tipo 4
 bic                         | 41003                      | Manivela
 imm                         | 887p                       | Perno Riostra
 qsa                         | xk48                       | Reductor
 rei                         | 2a44l                      | Bisagra Izqda.
 fea                         | 112                        | Cubierta
 imm                         | 887h                       | Soporte Riostra
 bic                         | 41089                      | Retn
 aci                         | 41001                      | Articulo Tipo 1
 imm                         | 775c                       | Riostra 1-Tm
 aci                         | 4100z                      | Montador
 qsa                         | xk48a                      | Reductor
 aci                         | 41002                      | Articulo Tipo 2
 rei                         | 2a44r                      | Bisagra Dcha.
 imm                         | 773c                       | Riostra 1/2-Tm
 aci                         | 4100x                      | Ajustador
 fea                         | 114                        | Bancada Motor
 imm                         | 887x                       | Retenedor Riostra
 rei                         | 2a44g                      | Pasador Bisagra
(25 rows)

* * * RESULTAT * * */

-- 1.12- Identificador del fabricant, identificador del producte i descripcio del producte d'aquells productes que el seu identificador de fabricant acabi amb la lletra i.

/* * * CONSULTA * * */

SELECT	id_fab AS "Identificador del fabricant",
		id_producto AS "Identificador del producte",
		descripcion AS "Descripció del producte"
FROM productos
WHERE id_fab LIKE '%i';	
	
--* * * CONSULTA * * */

/* * * RESULTAT * * * 

Identificador del fabricant | Identificador del producte | Descripció del producte 
-----------------------------+----------------------------+-------------------------
 rei                         | 2a45c                      | V Stago Trinquete
 aci                         | 4100y                      | Extractor
 aci                         | 41003                      | Articulo Tipo 3
 aci                         | 41004                      | Articulo Tipo 4
 rei                         | 2a44l                      | Bisagra Izqda.
 aci                         | 41001                      | Articulo Tipo 1
 aci                         | 4100z                      | Montador
 aci                         | 41002                      | Articulo Tipo 2
 rei                         | 2a44r                      | Bisagra Dcha.
 aci                         | 4100x                      | Ajustador
 rei                         | 2a44g                      | Pasador Bisagra
(11 rows)

* * * RESULTAT * * */

-- 1.13- Nom i identificador dels venedors que estan per sota la quota i tenen vendes inferiors a 300000.

/* * * CONSULTA * * */

SELECT	nombre AS "Nombre del venedor",
		num_empl AS "Identificador del venedor"
FROM repventas
WHERE ventas < cuota AND ventas < 300000;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Nombre del venedor | Identificador del venedor 
--------------------+---------------------------
 Bob Smith          |                       104
 Nancy Angelli      |                       107
(2 rows)

* * * RESULTAT * * */

-- 1.14- Identificador i nom dels venedors que treballen a les oficines 11 o 13.

/* * * CONSULTA * * */

SELECT	num_empl AS "Identificador del venedor",
		nombre AS "Nom del venedor"
FROM repventas
WHERE oficina_rep IN (11, 13);
--WHERE oficina_rep = 11 OR oficina_rep = 13; -- Equivalen a l'anterior IN

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Identificador del venedor | Nom del venedor 
---------------------------+-----------------
                       105 | Bill Adams
                       109 | Mary Jones
                       106 | Sam Clark
(3 rows)

* * * RESULTAT * * */

-- 1.15- Identificador, descripcio i preu dels productes ordenats del més car al més barat.

/* * * CONSULTA * * */

SELECT	id_producto AS "Identificador del producte",
		descripcion AS "Descripció del producte",
		precio AS "Preu del producte"
FROM productos
ORDER BY precio DESC;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Identificador del producte | Descripció del producte | Preu del producte 
----------------------------+-------------------------+-------------------
 2a44r                      | Bisagra Dcha.           |           4500.00
 2a44l                      | Bisagra Izqda.          |           4500.00
 4100y                      | Extractor               |           2750.00
 4100z                      | Montador                |           2500.00
 779c                       | Riostra 2-Tm            |           1875.00
 775c                       | Riostra 1-Tm            |           1425.00
 773c                       | Riostra 1/2-Tm          |            975.00
 41003                      | Manivela                |            652.00
 887x                       | Retenedor Riostra       |            475.00
 xk47                       | Reductor                |            355.00
 2a44g                      | Pasador Bisagra         |            350.00
 887p                       | Perno Riostra           |            250.00
 114                        | Bancada Motor           |            243.00
 41089                      | Retn                    |            225.00
 41672                      | Plate                   |            180.00
 112                        | Cubierta                |            148.00
 xk48                       | Reductor                |            134.00
 xk48a                      | Reductor                |            117.00
 41004                      | Articulo Tipo 4         |            117.00
 41003                      | Articulo Tipo 3         |            107.00
 2a45c                      | V Stago Trinquete       |             79.00
 41002                      | Articulo Tipo 2         |             76.00
 41001                      | Articulo Tipo 1         |             55.00
 887h                       | Soporte Riostra         |             54.00
 4100x                      | Ajustador               |             25.00
(25 rows)

* * * RESULTAT * * */

-- 1.16- Identificador i descripcio de producte amb el valor d'inventari (existencies * preu).

/* * * CONSULTA * * */

SELECT	id_producto AS "Identificador del producte",
		descripcion AS "Descripció del producte",
		(existencias * precio) AS "Valor d'inventari"
FROM productos;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Identificador del producte | Descripció del producte | Valor d'inventari 
----------------------------+-------------------------+-------------------
 2a45c                      | V Stago Trinquete       |          16590.00
 4100y                      | Extractor               |          68750.00
 xk47                       | Reductor                |          13490.00
 41672                      | Plate                   |              0.00
 779c                       | Riostra 2-Tm            |          16875.00
 41003                      | Articulo Tipo 3         |          22149.00
 41004                      | Articulo Tipo 4         |          16263.00
 41003                      | Manivela                |           1956.00
 887p                       | Perno Riostra           |           6000.00
 xk48                       | Reductor                |          27202.00
 2a44l                      | Bisagra Izqda.          |          54000.00
 112                        | Cubierta                |          17020.00
 887h                       | Soporte Riostra         |          12042.00
 41089                      | Retn                    |          17550.00
 41001                      | Articulo Tipo 1         |          15235.00
 775c                       | Riostra 1-Tm            |           7125.00
 4100z                      | Montador                |          70000.00
 xk48a                      | Reductor                |           4329.00
 41002                      | Articulo Tipo 2         |          12692.00
 2a44r                      | Bisagra Dcha.           |          54000.00
 773c                       | Riostra 1/2-Tm          |          27300.00
 4100x                      | Ajustador               |            925.00
 114                        | Bancada Motor           |           3645.00
 887x                       | Retenedor Riostra       |          15200.00
 2a44g                      | Pasador Bisagra         |           4900.00
(25 rows)

* * * RESULTAT * * */

-- 1.17- Vendes de cada oficina en una sola columna i format amb format "<ciutat> te unes vendes de <vendes>", exemple "Denver te unes vendes de 186042.00".

/* * * CONSULTA * * */

--SELECT CONCAT(ciudad, ' té unes vendes de ', ventas) AS "Vendes de cada oficina"
SELECT ciudad || ' té unes vendes de ' || ventas AS "Vendes de cada oficina"
FROM oficinas;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

         Vendes de cada oficina          
-----------------------------------------
 Denver té unes vendes de 186042.00
 New York té unes vendes de 692637.00
 Chicago té unes vendes de 735042.00
 Atlanta té unes vendes de 367911.00
 Los Angeles té unes vendes de 835915.00
(5 rows)

* * * RESULTAT * * */

-- 1.18- Codis d'empleats que son directors d'oficines.

/* * * CONSULTA * * */

SELECT num_empl AS "Codi"
FROM repventas
WHERE titulo LIKE '%Dir%';

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Codi 
------
  104
  108
(2 rows)

* * * RESULTAT * * */

-- 1.19- Identificador i ciutat de les oficines que tinguin ventes per sota el 80% del seu objectiu.

/* * * CONSULTA * * */

SELECT	oficina AS "Identificador oficina",
		ciudad AS "Ciutat oficina"
FROM oficinas
WHERE ventas < (objetivo * 0.8);

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Identificador oficina | Ciutat oficina 
-----------------------+----------------
                    22 | Denver
(1 row)

* * * RESULTAT * * */

-- 1.20- Identificador, ciutat i director de les oficines que no siguin dirigides per l'empleat 108.

/* * * CONSULTA * * */

SELECT	oficina AS "Identificador oficina",
		ciudad AS "Ciutat oficina",
		dir AS "Director oficina"
FROM oficinas
WHERE dir NOT IN(108);
--WHERE dir <> 108;

--* * * CONSULTA * * */

/* * * RESULTAT * * * 

 Identificador oficina | Ciutat oficina | Director oficina 
-----------------------+----------------+------------------
                    11 | New York       |              106
                    12 | Chicago        |              104
                    13 | Atlanta        |              105
(3 rows)
