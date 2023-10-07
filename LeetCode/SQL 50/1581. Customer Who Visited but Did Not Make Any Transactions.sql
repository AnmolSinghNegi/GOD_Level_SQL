Select customer_id,count(v.visit_id)as count_no_trans
from Visits as v
Left Join Transactions as t
on v.visit_id=t.visit_id
where t.transaction_id is null
Group by customer_id;