Select product_name,year,price
from Sales as s
INNER JOIN Product as p
on s.product_id=p.product_id;