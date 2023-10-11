WITH cte AS (
    (
        (SELECT u.name as results
        FROM Users u
        LEFT JOIN MovieRating m ON u.user_id = m.user_id
        GROUP BY u.user_id
        ORDER BY COUNT(m.rating) DESC, u.name ASC
        LIMIT 1)
    ) 
    UNION ALL
    (
        SELECT m.title as results
        FROM Movies m
        LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id
        WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
        GROUP BY m.movie_id
        ORDER BY AVG(mr.rating) DESC, m.title ASC
        LIMIT 1
    )
)
SELECT * FROM cte;