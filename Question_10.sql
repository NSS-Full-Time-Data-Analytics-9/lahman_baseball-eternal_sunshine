/*
 * Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league 
 * for at least 10 years, and who hit at least one home run in 2016. Report the players' first and last names and the number of 
 * home runs they hit in 2016.
*/


-- CTE for List of player debut later than 2006
WITH player_list AS (
	SELECT 
		playerid 
		,namefirst 
		,namelast 
		,debut 
	FROM people 
	WHERE 
		debut::DATE < '2006-01-01')

SELECT 
	playerid 
	,player_list.namefirst AS first_name
	,namelast AS last_name
	,batting.hr AS home_run
FROM batting
	INNER JOIN player_list
		USING(playerid)
WHERE 
	(playerid, hr) IN (
		SELECT
			playerid 
			,MAX(hr)
		FROM batting
		GROUP BY playerid
		HAVING MAX(hr)> 0 )
	AND yearid = 2016