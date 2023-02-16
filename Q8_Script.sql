-- 8. Using the attendance figures from the homegames table,
-- find the teams and parks which had the top 5 average attendance per game in 2016
-- (where average attendance is defined as total attendance divided by number of games).
-- Only consider parks where there were at least 10 games played.
-- Report the park name, team name, and average attendance.
-- Repeat for the lowest 5 average attendance.

-- Note: Some parks are home to multiple teams.
-- Therefore I included one table with parks/teams, and one table with just parks.

-- Top 5 Parks/Teams
SELECT teams.name, parks.park_name, (hg.attendance / hg.games) AS avg_game_attend
FROM homegames AS hg
	INNER JOIN parks
	USING (park)
	INNER JOIN teams
	ON hg.team = teams.teamid
WHERE year = 2016 AND games >=10
GROUP BY teams.name, parks.park_name, hg.attendance, hg.games
ORDER BY avg_game_attend DESC
LIMIT 5;


-- Top 5 Parks
SELECT parks.park_name, (hg.attendance / hg.games) AS avg_game_attend
FROM homegames AS hg
	INNER JOIN parks
	USING (park)
	INNER JOIN teams
	ON hg.team = teams.teamid
WHERE year = 2016 AND games >=10
GROUP BY parks.park_name, hg.attendance, hg.games
ORDER BY avg_game_attend DESC
LIMIT 5;


-- Bottom 5 Parks/Teams
SELECT teams.name, parks.park_name, (hg.attendance / hg.games) AS avg_game_attend
FROM homegames AS hg
	INNER JOIN parks
	USING (park)
	INNER JOIN teams
	ON hg.team = teams.teamid
WHERE year = 2016 AND games >=10
GROUP BY teams.name, parks.park_name, hg.attendance, hg.games
ORDER BY avg_game_attend
LIMIT 5;


-- Bottom 5 Parks
SELECT parks.park_name, (hg.attendance / hg.games) AS avg_game_attend
FROM homegames AS hg
	INNER JOIN parks
	USING (park)
	INNER JOIN teams
	ON hg.team = teams.teamid
WHERE year = 2016 AND games >=10
GROUP BY parks.park_name, hg.attendance, hg.games
ORDER BY avg_game_attend
LIMIT 5;


