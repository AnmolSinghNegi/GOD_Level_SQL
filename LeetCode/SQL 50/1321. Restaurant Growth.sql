WITH cte AS (
 SELECT DISTINCT visited_on, 
    SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY   PRECEDING AND CURRENT ROW) amount, 
    MIN(visited_on)over()1st_date 
    FROM Customer
)
SELECT visited_on,amount,round(amount/7,2) as average_amount
FROM cte
where visited_on>=1st_date+6;