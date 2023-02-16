/*
 * 1. What range of years for baseball games played does the provided database cover? 
 */

SELECT 
	MIN(yearid)
	,MAX(yearid)
	,MAX(yearid) - MIN(yearid)
FROM appearances 


/*
 * 2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the 
 * team for which he played?
 */

SELECT
	playerid
	,namefirst
	,namelast
	,height
	,teamid
	,appearances.g_all
FROM people
	INNER JOIN appearances
		USING(playerid)
	INNER JOIN teams
		USING(teamid)
ORDER BY height ASC
LIMIT 1


/*
 * 3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as
 * well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which 
 * Vanderbilt player earned the most money in the majors?
 */

SELECT
	people.namefirst
	,people.namelast
	,SUM(salaries.salary) AS sum_salary
FROM schools
	INNER JOIN collegeplaying
		USING(schoolid)
	INNER JOIN people
		USING(playerid)
	INNER JOIN salaries
		USING(playerid)
WHERE schoolname ILIKE '%Vanderbilt%'
GROUP BY people.namefirst, people.namelast
ORDER BY sum_salary DESC


/*   
 * 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. 
 * Do the same for home runs per game. Do you see any trends?
 */

SELECT
	"name"
	,so
	,soa
FROM teams



/*
 * 6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen 
 * base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider 
 * only players who attempted _at least_ 20 stolen bases.
 */
	


/*
 * 8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance 
 * per game in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks 
 * where there were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 
 * 5 average attendance.
 */

/*
 * 9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)?
 *  Give their full name and the teams that they were managing when they won the award.
 */

 */