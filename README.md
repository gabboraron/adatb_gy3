# Descartes szorzat és lekérdezéések egybeágyazásának kivédése

> ezek a feladatok: http://vopraai.web.elte.hu/tananyag/adatb1819/3.ora/feladat.txt

-  Kik azok akik legalább 2 gyümölcsöt szeretnek?
```SQL
SELECT DISTINCT sz1.nev FROM szeret sz1, szeret sz2 WHERE
    sz1.nev = sz2.nev AND sz1.gyumolcs < sz2.gyumolcs;
```

-  Kik szeretnek legalább háromféle gyümölcsöt?

```SQL
SELECT DISTINCT sz1.nev FROM szeret sz1, szeret sz2, szeret sz3 WHERE
    sz1.nev = sz2.nev AND sz3.nev = sz2.nev
    AND sz1.gyumolcs < sz2.gyumolcs
    AND sz2.gyumolcs < sz3.gyumolcs;
```

- Kik szeretnek legfeljebb kétféle gyümölcsöt?

```SQL
SELECT nev FROM szeret
MINUS
SELECT DISTINCT sz1.nev FROM szeret sz1, szeret sz2, szeret sz3 WHERE
    sz1.nev = sz2.nev AND sz3.nev = sz2.nev
    AND sz1.gyumolcs < sz2.gyumolcs
    AND sz2.gyumolcs < sz3.gyumolcs;
``` 

- Kik azok akik pontosan ugyanazokat a gyümölcsöket szeretik mint micimackó?

```SQL

```

- Kik azok a dolgozók, akiknek a főnöke KING? (nem leolvasva)


```SQL
SELECT d1.dnev FROM dolgozo d1, dolgozo d2 WHERE d1.fonoke=d2.dkod AND d2.dnev = 'KING';
```

- Kik azok a dolgozók, akik osztályának telephelye DALLAS?

```SQL
SELECT * FROM dolgozo, osztaly WHERE dolgozo.oazon=osztaly.oazon 
AND osztaly.telephely = 'DALLAS';
```
> VAGY

```SQL

SELECT * FROM dolgozo NATURAL JOIN osztaly WHERE telephely = 'DALLAS';
```

- Adjuk meg azoknak a főnököknek a nevét, akiknek a foglalkozása nem 'MANAGER'?

```SQL

SELECT * FROM dolgozo d1, dolgozo d2 WHERE
    d1.fonoke = d2.dkod
    AND d2.foglalkozas != 'MANAGER';
```

- Adjuk meg azokat a dolgozókat, akik többet keresnek a főnöküknél?

```SQL

SELECT DISTINCT * FROM dolgozo d1, dolgozo d2 WHERE
    d1.fonoke = d2.dkod
    AND d1.fizetes > d2.fizetes;
    /*SELECT * FROM dolgozo;*/
```

- Kik azok a dolgozók, akik főnökének a főnöke KING?

 

```SQL

SELECT DISTINCT * FROM dolgozo d1, dolgozo d2, dolgozo d3 WHERE
    d1.fonoke = d2.dkod AND d2.fonoke = d3.dkod
    AND d3.dnev='KING';
```

- Kik azok a dolgozók, akik osztályának telephelye DALLAS vagy CHICAGO?

```SQL

SELECT DISTINCT * FROM dolgozo NATURAL JOIN osztaly WHERE telephely='CHICAGO' OR telephely='DALLAS';
```

- Adjuk meg azoknak a nevét, akiknek a fizetése > 2000 vagy a CHICAGO-i osztályon dolgoznak.

```SQL

 SELECT * FROM dolgozo natural join osztaly;
```

- Melyik osztálynak nincs dolgozója?

```SQL
Select oazon from osztaly
minus
select oazon from dolgozo;
```

- Adjuk meg a maximális fizetésű dolgozó(k) nevét.

```SQL
SELECT dnev from dolgozo
MINUS
SELECT d1.dnev from dolgozo d1, dolgozo d2
WHERE d1.fizetes <d2.fizetes;
```



