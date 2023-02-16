-- 6.) Find the player who had the most success stealing bases in 2016, where success is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted at least 20 stolen bases.


--Some players played for different teams during different stints. This causes you to need to sum sb (stolenbases) and cs (caught stealing) seperately to avoid duplications.
-- The code below helped me notice this

WITH test_table AS (SELECT playerid
	  					  ,yearid
	  					--,sb AS successful_attempt_amnt
	  					--,cs AS failed_attemp_amnt
						  ,SUM(sb) AS successful_attempt_amnt
						  ,SUM(cs) AS failed_attempt_amnt
	  					  ,SUM(sb + cs) AS total_steal_attempts
					FROM batting
					WHERE yearid = 2016
					GROUP BY playerid
					        ,yearid 
					      --,sb
					      --,cs
					ORDER BY playerid)

SELECT COUNT(DISTINCT(playerid))
FROM test_table


-- **ANSWER**
WITH steal_percents AS (SELECT p.playerid
	  						  ,p.namefirst
	  						  ,p.namelast
	  						  ,SUM(sb) AS succesfull_steal_amnt
	 	 					  ,SUM(sb + cs) AS total_steal_attempts
	  						  ,CASE WHEN SUM(sb+cs) = 0 THEN 0
	  								ELSE ROUND((SUM(sb)::numeric / SUM(sb + cs)) * 100 , 2) 
									END AS successful_steal_percent
	  
							   FROM batting AS b
							   INNER JOIN people AS p
							   USING(playerid)

							   WHERE yearid = 2016
							   GROUP BY p.playerid
							   ORDER BY successful_steal_percent DESC)
SELECT *
FROM steal_percents
WHERE total_steal_attempts >= 20;
-- Player id: owingch01 , First name: Chris , Last name: Owings , Succesful steals percentage: 91.30%
