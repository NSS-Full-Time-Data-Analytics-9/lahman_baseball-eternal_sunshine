-- 3.) Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?


-- Finding the schoolid that corresponds to schoolname
SELECT DISTINCT(schoolid), schoolname
FROM schools
ORDER BY schoolname DESC;
--schoolid: vandy = schoolname: Vanderbilt University


-- **ANSWER**
SELECT  
DISTINCT(p.playerid)
	  ,p.namefirst
	  ,p.namelast
	  ,SUM(salary)::int::money AS total_salary
	  
FROM people AS p
INNER JOIN collegeplaying AS c
USING(playerid)
INNER JOIN salaries AS s
ON p.playerid = s.playerid

WHERE schoolid = 'vandy'

GROUP BY p.namefirst, p.namelast, p.playerid, c.yearid

ORDER BY total_salary DESC;
-- Player id: priceda01 , First name: David , Last name: Price , Total salary: $81,851,296.00


--Double checking
SELECT SUM(salary)::int::money
FROM salaries
WHERE playerid LIKE 'priceda01'
--$81,851,296.00
