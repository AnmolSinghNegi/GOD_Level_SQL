SELECT activity_date as day, COUNT( distinct user_id) as active_users
FROM Activity
WHERE activity_date <= '2019-07-27' and  activity_date>'2019-06-27'
GROUP BY activity_date;

--using DateDIff
SELECT activity_date as day, COUNT( distinct user_id) as active_users
FROM Activity
WHERE (DateDiff(activity_date,'2019-07-27')<=30)
GROUP BY activity_date;
