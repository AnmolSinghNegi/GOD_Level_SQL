WITH cte AS (
    SELECT 
        *,
        (CASE 
            WHEN income < 20000 THEN 'Low Salary' 
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary' 
            WHEN income > 50000 THEN 'High Salary' 
        END) AS category 
    FROM Accounts
    ORDER BY account_id 
),

categories AS (
    SELECT DISTINCT 'Low Salary' AS category
    UNION ALL
    SELECT DISTINCT 'Average Salary'
    UNION ALL
    SELECT DISTINCT 'High Salary'
)
SELECT 
    c.category,
    COUNT(cte.account_id) AS accounts_count
FROM categories c
LEFT JOIN cte ON c.category = cte.category
GROUP BY c.category
ORDER BY accounts_count desc;