SELECT DISTINCT sz1.nev FROM szeret sz1, szeret sz2 WHERE
    sz1.nev = sz2.nev AND sz1.gyumolcs < sz2.gyumolcs;
    
    
SELECT DISTINCT sz1.nev FROM szeret sz1, szeret sz2, szeret sz3 WHERE
    sz1.nev = sz2.nev AND sz3.nev = sz2.nev
    AND sz1.gyumolcs < sz2.gyumolcs
    AND sz2.gyumolcs < sz3.gyumolcs;
    
SELECT d1.dnev FROM dolgozo d1, dolgozo d2 WHERE d1.fonoke=d2.dkod AND d2.dnev = 'KING';

SELECT * FROM dolgozo, osztaly WHERE dolgozo.oazon=osztaly.oazon 
AND osztaly.telephely = 'DALLAS';

SELECT * FROM dolgozo NATURAL JOIN osztaly WHERE telephely = 'DALLAS';

/* Adjuk meg azoknak a fõnököknek a nevét, akiknek a foglalkozása nem 'MANAGER'?*/
SELECT DISTINCT * FROM dolgozo d1, dolgozo d2 WHERE
    d1.fonoke = d2.dkod
    AND d2.foglalkozas != 'MANAGER';
    
/* Adjuk meg azokat a dolgozókat, akik többet keresnek a fõnöküknél?*/
SELECT DISTINCT * FROM dolgozo d1, dolgozo d2 WHERE
    d1.fonoke = d2.dkod
    AND d1.fizetes > d2.fizetes;
    SELECT * FROM dolgozo;
    
/*Kik azok a dolgozók, akik fõnökének a fõnöke KING?*/
SELECT DISTINCT * FROM dolgozo NATURAL JOIN osztaly WHERE telephely='CHICAGO' OR telephely='DALLAS';
    

SELECT * FROM dolgozo natural join osztaly;

Select oazon from osztaly
minus
select oazon from dolgozo;
    
    SELECT dnev from dolgozo
    Minus
SELECT d1.dnev from dolgozo d1, dolgozo d2
where d1.fizetes <d2.fizetes;