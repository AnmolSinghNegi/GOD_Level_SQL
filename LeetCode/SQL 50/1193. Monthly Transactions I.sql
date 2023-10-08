SELECT DATE_FORMAT(trans_date, '%Y-%m') as month,country,
Count(*) as trans_count,Sum(CASE When state= "approved" then 1 else 0 end) as approved_count,Sum(amount)as trans_total_amount,
Sum(CASE When state= "approved" then amount else 0 end) as  approved_total_amount
FROM Transactions
Group by month,country