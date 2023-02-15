/*  
 *  wswin column contains 357 rows of NULL value.
 *  Some NULL values, such as 94' World Series, indicate 94' World Series being cancled due to union strike.
 *  But most of NULL values seems inaccurate data, so I'll assume NULL as 'N'  
 */

/*
 *  From 1970 – 2016, what is the largest number of wins for a team that did not win the world series?  
 */

SELECT
	teamid  AS team
	,yearid  AS year
	,w AS wins
FROM teams 
WHERE 
	yearid BETWEEN 1970 AND 2016
	AND wswin ILIKE 'N'
ORDER BY w DESC
LIMIT 1;


/*  
 * What is the smallest number of wins for a team that did win the world series?  
 */

SELECT
	teamid  AS team
	,yearid AS year
	,w AS wins
FROM teams 
WHERE 
	yearid BETWEEN 1970 AND 2016
	AND wswin ILIKE 'Y'
ORDER BY w ASC
LIMIT 1;


/* 
 *  Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case.  
 */

SELECT 
	yearid 
	,SUM(w)
FROM teams
WHERE 
	yearid BETWEEN 1970 AND 2016
GROUP BY yearid 
ORDER BY SUM(w) ASC;
-- 1981 had the least # of game 

SELECT 
	yearid 
	,STDDEV(w)
FROM teams
WHERE 
	yearid BETWEEN 1970 AND 2016
GROUP BY yearid 
ORDER BY STDDEV(w) ASC;
-- Standard deviation of wins in 81' World Series is second lowest. Meaning, 81' World Series was very competitive.


-- After some research, I came to learn that 81' World Series was cancled in the middle due to the union strike.
-- It explains low numbers of # of games and standard deviation.


/* 
 *  Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case that a team with the most wins
 *  also won the world series? What percentage of the time?  
 */

WITH most_wins AS (
	SELECT 
		yearid 
		,MAX(w) AS max_wins
	FROM teams 
	GROUP BY yearid)
SELECT 
	yearid 
	,teamid AS winner
	,w AS winner_wins
	,most_wins.max_wins
	,CASE
		WHEN w = most_wins.max_wins THEN 'Y'
		ELSE 'N'
	END AS matched
FROM teams 
	LEFT JOIN most_wins 
		USING (yearid)
WHERE wswin ILIKE 'Y'
ORDER BY yearid;

-- 57%


