 --using DATE_SUB
 Select Round(Count(Distinct player_id)/(Select Count(Distinct player_id) from Activity),2) AS fraction
from Activity
where (player_id,DATE_SUB(event_date,interval 1 day))
in( Select player_id,MIN(event_date)FROM Activity GROUP BY player_id)

--using DateDifff
SELECT ROUND(SUM(login)/COUNT(DISTINCT player_id), 2) AS fraction
FROM (
  SELECT
    player_id,
    DATEDIFF(event_date, MIN(event_date) OVER(PARTITION BY player_id)) = 1 AS login
  FROM Activity
) AS t