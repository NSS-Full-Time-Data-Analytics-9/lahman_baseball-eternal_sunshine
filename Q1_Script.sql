-- 1. What range of years for baseball games played does the provided database cover? 
-- The database covers baseball game stats from 1871 to 2016,
-- and it covers debut games as early as 1871 and final games as late as 2017;


SELECT MIN(yearid), MAX(yearid)
FROM teams;


SELECT 	MIN(debut) AS min_year,
		MAX(finalgame) AS max_year
FROM people;



