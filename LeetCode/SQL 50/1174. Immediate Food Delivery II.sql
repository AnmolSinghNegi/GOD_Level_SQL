--using subquery
Select round(avg(order_date=customer_pref_delivery_date)*100,2) as immediate_percentage
from Delivery
where(customer_id, order_date) in (Select customer_id, min(order_date) 
from Delivery
group by customer_id);

--using CTE
With cte AS (
 SELECT
        customer_id,
        order_date,
        RANK() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date) AS r,
        customer_pref_delivery_date
    FROM
        Delivery
)
SELECT
    ROUND(
        100 * AVG(order_date = customer_pref_delivery_date),
        2
    ) AS immediate_percentage
FROM
    cte
WHERE
    r = 1;