-- Question 3: Which food category has the slowest price growth
-- (lowest average annual percentage increase)? --
WITH yearly_changes AS (
    SELECT 
        food_category,
        avg_price,
        -- Get price from previous year --
        LAG(avg_price) OVER (PARTITION BY food_category ORDER BY year) AS prev_year_price
    FROM t_zuzana_klasova_project_sql_primary_final
)
SELECT     
    food_category,
    ROUND(AVG((avg_price - prev_year_price) / prev_year_price * 100)::numeric, 2) AS avg_growth_percent,
    CASE 
        WHEN AVG((avg_price - prev_year_price) / prev_year_price * 100) > 0.5 THEN 'high'
        WHEN AVG((avg_price - prev_year_price) / prev_year_price * 100) < 0.1 THEN 'low'
        ELSE 'moderate'
    END AS price_trend
FROM yearly_changes
WHERE prev_year_price IS NOT NULL
GROUP BY food_category
ORDER BY avg_growth_percent ASC;
