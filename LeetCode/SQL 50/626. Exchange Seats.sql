Select Case
    When id%2=0 then id-1
    When id%2<>0 and id = (Select count(*) from seat) then id
    else id+1 End as id ,student
from Seat
order by id