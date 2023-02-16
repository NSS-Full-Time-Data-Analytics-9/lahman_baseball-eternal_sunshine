-- 11. Is there any correlation between number of wins and team salary? [CORR]
-- Use data from 2000 and later to answer this question.
-- As you do this analysis, keep in mind that salaries across the whole league tend to increase together,
-- so you may want to look on a year-by-year basis.

-- In the years reviewed (2000, 2004, 2009, 2014 and 2016)
-- correlations between wins and salary ranged from .0867 to .180. 
-- While there is a positive correlation between wins and salary,
-- they are not highly correlated. 


-- 2016
-- .163
SELECT CORR(w, salary)
FROM salaries AS s
	LEFT JOIN teams AS t
	USING(teamid, yearid)
WHERE yearid = 2016;


-- 2014
-- .0867
SELECT CORR(w, salary)
FROM salaries AS s
	LEFT JOIN teams AS t
	USING(teamid, yearid)
WHERE yearid = 2014;

-- 2009
-- .127
SELECT CORR(w, salary)
FROM salaries AS s
	LEFT JOIN teams AS t
	USING(teamid, yearid)
WHERE yearid = 2009;

--2004
-- .180
SELECT CORR(w, salary)
FROM salaries AS s
	LEFT JOIN teams AS t
	USING(teamid, yearid)
WHERE yearid = 2004;

--2000
-- .116
SELECT CORR(w, salary)
FROM salaries AS s
	LEFT JOIN teams AS t
	USING(teamid, yearid)
WHERE yearid = 2000