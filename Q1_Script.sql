-- 1. What range of years for baseball games played does the provided database cover? 
-- The database covers baseball games from 1871 to 2016

SELECT MIN(yearid), MAX(yearid)
FROM teams;