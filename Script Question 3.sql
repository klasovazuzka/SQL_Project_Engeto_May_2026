-- Question 3: Which food category has the slowest price growth (lowest average annual percentage increase)? --

SELECT
    food_category AS category,
    ROUND(AVG(annual_growth_pct)::numeric, 2) AS avg_annual_growth_pct
FROM (
    SELECT
        food_category,
        year,
        AVG(avg_price) AS yearly_avg,
        LAG(AVG(avg_price)) OVER (PARTITION BY food_category ORDER BY year) AS prev_yearly_avg,
        (AVG(avg_price) - LAG(AVG(avg_price)) OVER (PARTITION BY food_category ORDER BY year))
        / LAG(AVG(avg_price)) OVER (PARTITION BY food_category ORDER BY year) * 100 AS annual_growth_pct
    FROM t_zuzana_klasova_project_sql_primary_final
    WHERE avg_price IS NOT NULL
    GROUP BY food_category, year
) sub
WHERE prev_yearly_avg IS NOT NULL
GROUP BY food_category
ORDER BY avg_annual_growth_pct;
