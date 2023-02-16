-- 2. Find the name and height of the shortest player in the database.
-- How many games did he play in? [appearances.G_all is total games played]
-- What is the name of the team for which he played? [teams_table]
-- Eddie Gaedel is the shortest player in the databased. He is 43" tall and played one game for the St.Louis Browns

SELECT namefirst, namelast, height AS height_in, G_all AS games_played, teams.name AS team_name
FROM people
	INNER JOIN appearances
	USING (playerid)
	INNER JOIN teams
	USING (teamid)
WHERE height = (SELECT MIN(height) FROM people)
GROUP BY namefirst, namelast, height, G_all, teams.name;

