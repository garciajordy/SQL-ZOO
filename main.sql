-- SELECT basics

1) SELECT population FROM world
  WHERE name = 'Germany'

2) SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

3) SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- SELECT names

1) SELECT name FROM world
  WHERE name LIKE 'Y%'

2) SELECT name FROM world
  WHERE name LIKE '%y'

3) SELECT name FROM world
  WHERE name LIKE '%x%'

4) SELECT name FROM world
  WHERE name LIKE '%land'

5) SELECT name FROM world
  WHERE name LIKE 'C%ia'

6) SELECT name FROM world
  WHERE name LIKE '%oo%'

7)SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

8) SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

9) SELECT name FROM world
 WHERE name LIKE '%o__o%'

10) SELECT name FROM world
 WHERE name LIKE '____'

-- SELECT from WORLD Tutorial

1) SELECT name, continent, population FROM world

2) SELECT name
  FROM world
 WHERE population > 200000000

3) SELECT name, gdp/population FROM world WHERE population > 200000000

4) SELECT name, population/1000000 FROM world WHERE continent = 'South America'

5) SELECT name, population FROM world WHERE name IN ('France','Germany','Italy')

6) SELECT name FROM world WHERE name LIKE '%United%'

7) SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000

8)   SELECT name, population, area
  FROM world
  WHERE ((population > 250000000) OR (area > 3000000)) 
       AND NOT ((population > 250000000) AND (area > 3000000))

9) SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) FROM world WHERE continent = 'South America'

10) 