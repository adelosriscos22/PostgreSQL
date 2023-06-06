--	1.	Llista de preguntes que continguin les paraules "PHP" o "programació".

SELECT * 
FROM preguntes 
WHERE enunciat  
LIKE '%PHP%' OR enunciat LIKE '%programació%';


--	2.	LLista de preguntes que es van publicar a partir de l'any 2018.

SELECT * 
FROM preguntes 
WHERE EXTRACT(YEAR FROM publicacio) > 2018;


--	3.	Llista de mòduls amb més de 100 hores.

SELECT * 
FROM moduls WHERE hores > 100;

--	4.	Llista de preguntes de dificultat 2 o més.

SELECT * 
FROM preguntes 
WHERE dificultat >= 2;

--	5.	Llista de preguntes de dificultat 1 o 3 i que continguin les paraules "objecte" o "HTML"

SELECT * FROM preguntes 
WHERE (dificultat = 1 OR dificultat = 3) 
AND (enunciat LIKE '%objecte%' OR enunciat LIKE '%HTML%') ;


--	6.	Llista de preguntes que es van publicar per la tarda (entre les 12 i les 20h).

SELECT * FROM preguntes 
WHERE EXTRACT (HOUR  FROM  publicacio) 
BETWEEN 12 AND 20; 


--	7.	Llista de preguntes que es van publicar entre el 2012 i el 2015
--		ordenades per data de publicació descendentment.

SELECT * FROM preguntes 
WHERE YEAR (publicacio) 
BETWEEN  2012  AND  2015  ORDER BY publicacio DESC ;
--	8.	Llista de mòduls de l'acció formativa amb id 2.

SELECT m.* FROM moduls m 
JOIN moduls_accions ma 
ON m.id = ma.idmodul WHERE ma.idaccio = 2;


--	9.	Llista COMPLETA d'accions formatives (codi i nom), 
--		junt amb el (codi i nom) dels mòduls que inclou.
--		Ordenat per nom de l'acció formativa ascendent i codi del mòdul descendent.
SELECT a.codi , a.nom , m.codi , m.nom 
FROM  accions a 
JOIN  moduls_accions ma  ON  a.id  =  ma.idaccio 
JOIN  moduls m ON ma.idmodul =  m.id 
ORDER BY  a.nom  ASC, m.codi  DESC ;
 




--	10.	Llista de preguntes (amb respostes) del mòdul formatiu amb codi MF0951_2.

SELECT p.* , r.*  FROM  preguntes p 
JOIN preguntes_moduls pm  ON  p.id  = pm.idpregunta
JOIN moduls m  ON  pm.idmodul =  m.id 
JOIN respostes r ON  p.id  = r.idpregunta  WHERE  m.codi  = 'MF0951_2' ;


--	11.	Nombre total de respostes equivocades.


SELECT COUNT(*) 
FROM respostes 
WHERE correcta = 0;

--	12.	Durada en hores del mòdul més llarg de l'acció formativa amb id 1. 
--		No cal saber de quin mòdul es tracta.


SELECT MAX(m.hores) 
FROM  moduls m 
JOIN  moduls_accions ma ON  m.id  =  ma.idmodul
WHERE ma.idaccio  =  1;



--	13.	Suma de les hores dels mòduls de l'acció formativa amb codi IFCD0110


SELECT SUM(m.hores) 
FROM moduls m 
JOIN moduls_accions ma  ON   m.id   =  ma.idmodul 
JOIN accions a  ON  ma.idaccio  =  a.id 
WHERE  a.codi  =  'IFCD0110';





--	14.	Promig de la durada dels mòduls de l'acció formativa amb codi IFCD0210

SELECT AVG(m.hores) 
FROM moduls m 
JOIN moduls_accions ma  ON m.id  =  ma.idmodul 
JOIN  accions a  ON  ma.idaccio  =  a.id WHERE  a.codi = 'IFCD0210' ;



--	15.	Nombre de preguntes per mòdul. Han d'aparèixer TOTS els mòduls.



SELECT m.codi , m.nom , COUNT(p.id) 
FROM moduls m 
LEFT JOIN preguntes_moduls pm   ON  m.id  =  pm.idmodul
LEFT JOIN preguntes p  ON  pm.idpregunta  =  p.id 
GROUP BY  m.codi ,  m.nom ;



--	16.	Nombre de mòduls per acció formativa, 
--		només per a les accions formatives amb més de dos mòduls.


SELECT a.codi , a.nom , COUNT(m.id) 
FROM  accions a 
JOIN  moduls_accions ma   ON  a.id  =  ma.idaccio 
JOIN   moduls m   ON  ma.idmodul  =  m.id 
GROUP BY a.codi , a.nom  HAVING COUNT(m.id)  > 2  ;



--	17.	Suma de les hores per cada acció formativa. 
--		Només volem accions amb menys de 550 hores.

SELECT  a.codi  ,  a.nom, SUM(m.hores) 
FROM accions a 
JOIN moduls_accions ma  ON  a.id  =  ma.idaccio 
JOIN  moduls m   ON   ma.idmodul  =  m.id 
GROUP BY  a.codi  ,  a.nom 
HAVING SUM(m.hores)  <  550 ;

--	18.	Suma de les hores per a cada acció formativa de nivell 3.

SELECT  a.codi , a.nom , SUM(m.hores) 
FROM  accions a 
JOIN moduls_accions ma ON  a.id  =  ma.idaccio 
JOIN  moduls m  ON  ma.idmodul  =  m.id 
WHERE  a.nivell =  3 
GROUP BY  a.codi ,  a.nom ;


--	19.	Nombre de preguntes que s'han publicat cada any. 
--		Ordenat per any descendent.

SELECT EXTRACT(YEAR FROM  publicacio) ,  COUNT(*) 
FROM  preguntes 
GROUP BY EXTRACT(YEAR  FROM  publicacio) 
ORDER BY EXTRACT(YEAR  FROM  publicacio) DESC ;
 


--	20.	Primera i darrera pregunta que s'ha publicat a la BD, EN UNA SOLA CONSULTA.
--		PISTA 
--			SELECT MIN(publicacio) AS "Primera pregunta" FROM preguntes
--			SELECT MAX(publicacio) AS "Primera pregunta" FROM preguntes

SELECT MIN(publicacio) 
AS  "primera pregunta" ,  MAX(publicacio) 
AS  "ultima pregunta" 
FROM  preguntes  ;
