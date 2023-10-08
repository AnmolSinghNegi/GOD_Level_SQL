Select query_name,round(Avg(rating/position),2) as quality,
round(Sum(CASE When rating <3 then 1 Else 0 END)*100/Count(rating),2)as poor_query_percentage
from Queries
Group by query_name