-- 9.) Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.

-- First finding the managers that have won the award for both leagues
SELECT *
FROM managers;

WITH tsn_nl_al_winners AS ((SELECT playerid, awardid
						   FROM awardsmanagers
						   WHERE awardid = 'TSN Manager of the Year'
						   	     AND lgid = 'NL')
	 
						  INTERSECT

						  (SELECT playerid, awardid
						   FROM awardsmanagers
						   WHERE awardid = 'TSN Manager of the Year'
						   	     AND lgid = 'AL'))
								 
SELECT p.playerid, p.namefirst, p.namelast, p.namegiven
FROM people AS p
INNER JOIN tsn_nl_al_winners AS t
USING(playerid);

-- Checking the names output by the above code
SELECT *
FROM awardsmanagers
WHERE playerid = 'johnsda02'
	  OR playerid = 'leylaji99';
	  
SELECT *
FROM managers
WHERE playerid = 'johnsda02'
	  OR playerid = 'leylaji99';
	  
-- **ANSWER**

SELECT playerid, namefirst, namelast, nl_yearid, nl_teamid, al_yearid, al_teamid
FROM
	(SELECT a.playerid, a.lgid, a.awardid, a.yearid AS nl_yearid, m.teamid AS nl_teamid
	 FROM awardsmanagers AS a
	 INNER JOIN managers AS m
	 USING(playerid, yearid)
	 WHERE awardid = 'TSN Manager of the Year'
		   AND a.lgid = 'NL' ) AS nl_winners
INNER JOIN 
		   (SELECT a.playerid, a.lgid, a.awardid, a.yearid AS al_yearid, m.teamid AS al_teamid
		    FROM awardsmanagers AS a
	 		INNER JOIN managers AS m
			USING(playerid, yearid)
	 		WHERE awardid = 'TSN Manager of the Year'
		   		  AND  a.lgid = 'AL') AS al_winners
USING(playerid)
INNER JOIN people AS p
USING(playerid);
-- First name: Jim , Last name: Leyland , Teams: PIT and DET
-- First name: Davey , Last name: Johnson , Teams: WAS BAL

SELECT *
FROM awardsmanagers AS m
INNER JOIN people AS p
USING(playerid)
WHERE p.namelast = 'Leyland'
	AND p.namefirst = 'Jim';

SELECT *
FROM awardsmanagers AS m
INNER JOIN people AS p
USING(playerid)
WHERE p.namelast = 'Johnson'
	AND p.namefirst = 'Davey';