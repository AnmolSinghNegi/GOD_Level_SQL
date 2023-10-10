Select customer_id from Customer
group by customer_id 
having Count( distinct product_key)=(Select count(product_key) from Product)