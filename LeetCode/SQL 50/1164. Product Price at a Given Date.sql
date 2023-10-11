SELECT DISTINCT product_id,new_price as price
FROM products
where (product_id,change_date)in(Select product_id,max(change_date) from products where change_date<='2019-08-16' group by product_id)
UNION
SELECT DISTINCT
    product_id,
    10 as price 
FROM
    Products
WHERE
    (product_id) not IN (
        SELECT
            product_id
        FROM
            products
        WHERE
            change_date<='2019-08-16' 
    )
ORDER BY
    product_id;