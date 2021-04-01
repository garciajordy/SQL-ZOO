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

10) SELECT name, ROUND(gdp/population,-3) FROM world WHERE gdp > 1000000000000

11) SELECT name, capital
  FROM world
 WHERE LEN(name) = LEN(capital)

 12) SELECT name, capital
FROM world WHERE LEFT(name,1) = LEFT(capital,1) AND NOT name = capital

13) SELECT name
  FROM world
 WHERE name     LIKE '%a%'
   AND name     LIKE '%e%'
   AND name     LIKE '%i%'
   AND name     LIKE '%o%'
   AND name     LIKE '%u%'
   AND name NOT LIKE '% %'

-- SELECT from Nobel Tutorial

1) SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

2) SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

3) SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'

4) SELECT winner FROM nobel WHERE subject = 'Peace' AND yr > 1999

5) SELECT * FROM nobel WHERE yr > 1979 AND yr < 1990 AND subject = 'Literature'

6) SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

7) SELECT winner FROM nobel WHERE winner LIKE 'John%'

8) SELECT * FROM nobel WHERE (subject = 'Physics' AND yr = '1980') OR (subject = 'Chemistry' AND yr = '1984')

9) SELECT * FROM nobel WHERE yr = '1980'AND NOT subject IN ('Chemistry', 'Medicine') 

10) SELECT * FROM nobel WHERE (yr < '1910' AND subject = 'Medicine') OR (subject = 'Literature' AND yr > '2003')

-- SELECT within SELECT Tutorial

1) SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2) SELECT name FROM world
  WHERE (gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')) AND continent = 'Europe'

3) SELECT name, continent FROM world
  WHERE continent = 'South America' OR continent = 'Oceania'

4) SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')

5) SELECT name, CONCAT(ROUND((100/(SELECT population FROM world WHERE name = 'Germany')*population),0),'%') FROM world
  WHERE continent = 'Europe'

6) SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                           FROM world
                          WHERE continent = 'Europe' AND gdp > 0)

7) SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

8) SELECT continent, MIN(name) AS name
FROM world 
GROUP BY continent

-- SUM and COUNT

1) SELECT SUM(population)
FROM world

2) SELECT continent
FROM world GROUP BY continent

3) SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

4) SELECT count(name) FROM world WHERE area > 1000000

5) SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

6) SELECT continent, count(name) FROM world GROUP BY continent

7) SELECT continent, count(name) FROM world WHERE population > 10000000 GROUP BY continent

8) SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000

-- The JOIN operation

1) SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

2) SELECT id,stadium,team1,team2
  FROM game WHERE id = '1012'

3) SELECT player, teamid,stadium, mdate
  FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

4) SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid) WHERE player LIKE 'Mario%'

5) SELECT player, teamid,coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10

6) SELECT mdate, teamname FROM game JOIN eteam ON (game.team1 = eteam.id) WHERE coach = 'Fernando Santos'

7) SELECT player FROM goal JOIN game ON (matchid=id) WHERE stadium = 'National Stadium, Warsaw'
