-- 9.) Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.

SELECT p.namefirst, p.namelast, am.yearid, am.lgid, m.teamid, t.name
FROM awardsmanagers AS am
		INNER JOIN managers AS m
		USING(playerid, yearid, lgid)
		INNER JOIN people AS p
		USING(playerid)
		INNER JOIN teams AS t
		USING(teamid, lgid, yearid)
WHERE am.playerid IN (SELECT playerid
					FROM awardsmanagers
					WHERE awardid LIKE 'TSN%' AND lgid = 'AL'
					INTERSECT
					SELECT playerid
					FROM awardsmanagers
					WHERE awardid LIKE 'TSN%' AND lgid = 'NL')
		AND am.awardid LIKE 'TSN%'
GROUP BY (p.namefirst, p.namelast, am.yearid, am.lgid, m.teamid, t.name)
ORDER BY namefirst, yearid, name
-- First name: Jim , Last name: Leyland , Teams: PIT and DET
-- First name: Davey , Last name: Johnson , Teams: WAS BAL








































