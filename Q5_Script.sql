-- 5. Find the average number of strikeouts per game by decade since 1920.
-- [teams.so ; teams.yearID]
-- Round the numbers you report to 2 decimal places.
-- Do the same for home runs per game.
-- Do you see any trends?

-- The avg no. of strikeouts and avg no. of homeruns per game both steadily increased over time.


SELECT 	CASE	WHEN yearID BETWEEN 1870 AND 1879 THEN 1870
				WHEN yearID BETWEEN 1880 AND 1889 THEN 1880
				WHEN yearID BETWEEN 1890 AND 1899 THEN 1890
				WHEN yearID BETWEEN 1900 AND 1909 THEN 1900
				WHEN yearID BETWEEN 1910 AND 1919 THEN 1910
				WHEN yearID BETWEEN 1920 AND 1929 THEN 1920
				WHEN yearID BETWEEN 1930 AND 1939 THEN 1930
				WHEN yearID BETWEEN 1940 AND 1949 THEN 1940
				WHEN yearID BETWEEN 1950 AND 1959 THEN 1950
				WHEN yearID BETWEEN 1960 AND 1969 THEN 1960
				WHEN yearID BETWEEN 1970 AND 1979 THEN 1970
				WHEN yearID BETWEEN 1980 AND 1989 THEN 1980
				WHEN yearID BETWEEN 1990 AND 1999 THEN 1990
				WHEN yearID BETWEEN 2000 AND 2010 THEN 2000
				WHEN yearID BETWEEN 2010 AND 2019 THEN 2010
				ELSE 999 END AS decade, 
		ROUND((SUM(so)::numeric / (SUM(g)::numeric/2)),2) AS avg_so_game,
		ROUND((SUM(hr)::numeric / (SUM(g)::numeric/2)),2) AS avg_hr_game
FROM teams
GROUP BY decade
ORDER BY decade;
