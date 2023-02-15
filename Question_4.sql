SELECT 
	CASE 
		WHEN pos IN ('OF') THEN 'Outfield'
		WHEN pos IN ('SS' , '1B' , '2B' , '3B') THEN 'Infield' 
		WHEN pos IN ('P' , 'C') THEN 'Battery'
	END AS position
	,SUM(po) AS sum_putout
FROM fielding 
WHERE yearid = 2016
GROUP BY Position