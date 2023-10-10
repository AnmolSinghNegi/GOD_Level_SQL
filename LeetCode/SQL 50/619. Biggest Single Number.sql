Select Max(num)as num from(Select num from MyNumbers
group by num
having count(num)=1)as subq ;