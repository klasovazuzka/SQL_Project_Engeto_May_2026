-- Secondary table preview --
SELECT *
FROM t_zuzana_klasova_project_sql_secondary_final;
----------------------------------------------------------------------------------
-- Question 5: Does GDP growth influence changes in wages and food prices?
-- If GDP grows significantly in one year, does it reflect in higher wage 
-- or food price growth in the same or following year?--
WITH gdp_growth AS (
    -- Annual GDP growth for Czech Republic from the secondary table
    SELECT 
        year,
        gdp,
        ROUND(((gdp - LAG(gdp) OVER (ORDER BY year)) / LAG(gdp) OVER (ORDER BY year) * 100)::numeric, 2) AS gdp_growth_percent
    FROM t_zuzana_klasova_project_sql_secondary_final
    WHERE country_countries = 'Czech Republic'
),
wage_growth AS (
    -- Annual average wage growth from the primary table
    SELECT 
        year,
        ROUND(AVG(avg_wage)::numeric, 2) AS avg_yearly_wage,
        ROUND(((AVG(avg_wage) - LAG(AVG(avg_wage)) OVER (ORDER BY year)) / LAG(AVG(avg_wage)) OVER (ORDER BY year) * 100)::numeric, 2) AS wage_growth_percent
    FROM t_zuzana_klasova_project_sql_primary_final
    GROUP BY year
),
price_growth AS (
    -- Annual average food price growth from the primary table
    SELECT 
        year,
        ROUND(AVG(avg_price)::numeric, 2) AS avg_yearly_price,
        ROUND(((AVG(avg_price) - LAG(AVG(avg_price)) OVER (ORDER BY year)) / LAG(AVG(avg_price)) OVER (ORDER BY year) * 100)::numeric, 2) AS price_growth_percent
    FROM t_zuzana_klasova_project_sql_primary_final
    GROUP BY year
)
-- JOIN all three metrics by year
SELECT 
    g.year,
    g.gdp_growth_percent,
    w.wage_growth_percent,
    p.price_growth_percent
FROM gdp_growth g
JOIN wage_growth w ON g.year = w.year
JOIN price_growth p ON g.year = p.year
WHERE g.gdp_growth_percent IS NOT NULL
ORDER BY g.year;
