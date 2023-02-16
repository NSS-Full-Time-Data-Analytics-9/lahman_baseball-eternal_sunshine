/* 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. 
 * Investigate this claim and present evidence to either support or dispute this claim. First, determine just how rare left-handed 
 * pitchers are compared with right-handed pitchers. Are left-handed pitchers more likely to win the Cy Young Award? 
 * Are they more likely to make it into the hall of fame?
 */


/* Part 1.
 * % of left-handed pitcher
 */

SELECT
	throws
	,COUNT(DISTINCT(playerid)) AS count
FROM pitching
	LEFT JOIN people
		USING(playerid)
GROUP BY throws

-- % of left-handed player from people table
-- NULL value is not included
-- [ S: 1 /  R: 6605 / L: 2477 ]
-- 27.27%


/* Part 2.
 * Cy Young Award
 */

WITH pitcher_list AS (
	SELECT
		DISTINCT(playerid) AS playerid
		,throws
	FROM pitching
		LEFT JOIN people
			USING(playerid)
	)
SELECT
	throws
	,COUNT(playerid) AS count_winner
FROM awardsplayers
	INNER JOIN pitcher_list
		USING(playerid)
WHERE awardid ILIKE 'Cy Young Award'
GROUP BY throws

-- # of Cy Young Award received by left-handed pitcher 
-- [ L: 37 / R: 75 ]
-- 33.03%


WITH pitcher_list AS (
	SELECT
		DISTINCT(playerid) AS playerid
		,throws
	FROM pitching
		LEFT JOIN people
			USING(playerid)
	)
SELECT
	throws
	,COUNT(DISTINCT(playerid)) AS count_winner
FROM awardsplayers
	INNER JOIN pitcher_list
		USING(playerid)
WHERE awardid ILIKE 'Cy Young Award'
GROUP BY throws

-- # of left-handed pitcher won Cy Young Award
-- [ L: 24 / R: 53]
-- 31.16%


/* Part 3.
 * Hall of Fame
 */

WITH pitcher_list AS (
	SELECT
		DISTINCT(playerid) AS playerid
		,throws
	FROM pitching
		LEFT JOIN people
			USING(playerid)
	)
SELECT
	throws
	,COUNT(playerid)
FROM halloffame
	INNER JOIN pitcher_list
		USING (playerid)
WHERE throws IS NOT NULL
GROUP BY throws

-- % of Hall of Fame award received by left-handed pitcher 
-- NULL value is not included
-- [ L: 439 / R: 1153 ] Total: 1592
-- 27.57%

WITH pitcher_list AS (
	SELECT
		DISTINCT(playerid) AS playerid
		,throws
	FROM pitching
		LEFT JOIN people
			USING(playerid)
	)
SELECT
	throws
	,COUNT(DISTINCT(playerid))
FROM halloffame
	INNER JOIN pitcher_list
		USING (playerid)
GROUP BY throws

-- # of left-handed pitcher won Hall of Fame
-- NULL value is not included
-- [ L: 141 / R: 347 ] Total: 488
-- 28.89%

/*
 * As shown in parts 2 and 3, left-handed players are more likely to receive awards, suggesting that left-handed pitchers 
 * may be more effective. Moreover, considering that only around 10% of the US population is left-handed, the fact that
 * 20% of pitchers are left-handed indicates that being left-handed offers an advantage
 */