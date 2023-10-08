Select p.product_id,round(Coalesce(sum(p.price*u.units)/sum(u.units),0),2) as average_price
from prices as p
left join unitssold as u
on p.product_id=u.product_id
and u.purchase_date between p.start_date and p.end_date
Group by p.product_id