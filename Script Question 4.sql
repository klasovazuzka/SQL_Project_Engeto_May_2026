-- Question 4: Is there a year in which the annual food price growth
-- was significantly higher than wage growth (more than 10%)? --
WITH yearly_averages AS (
    -- Step 1: Calculate average wage and price for each year
    -- Averaging across all industries and food categories --
    SELECT 
        year,
        AVG(avg_wage) AS avg_yearly_wage,
        AVG(avg_price) AS avg_yearly_price
    FROM t_zuzana_klasova_project_sql_primary_final
    WHERE avg_wage IS NOT NULL AND avg_price IS NOT NULL
    GROUP BY year
),
yearly_lags AS (
    -- Step 2: Attach previous year values using LAG()
    -- No PARTITION BY needed since we have one row per year
    SELECT 
        year,
        avg_yearly_wage,
        LAG(avg_yearly_wage) OVER (ORDER BY year) AS prev_year_wage,
        avg_yearly_price,
        LAG(avg_yearly_price) OVER (ORDER BY year) AS prev_year_price
    FROM yearly_averages
),
growth_calc AS (
    -- Step 3: Calculate percentage growth for wages and prices
    -- Using ::numeric for precise decimal output
    SELECT 
        year,
        ROUND(((avg_yearly_wage - prev_year_wage) / prev_year_wage * 100)::numeric, 2) AS wage_growth_pct,
        ROUND(((avg_yearly_price - prev_year_price) / prev_year_price * 100)::numeric, 2) AS price_growth_pct
    FROM yearly_lags
    -- Filter out the first year where there is no previous data to compare
    WHERE prev_year_wage IS NOT NULL AND prev_year_price IS NOT NULL
)
-- Step 4: Subtract wage growth from price growth
SELECT 
    year,
    wage_growth_pct,
    price_growth_pct,
    (price_growth_pct - wage_growth_pct) AS difference_in_pct,
    -- Add YES/NO column using CASE
    CASE 
        WHEN (price_growth_pct - wage_growth_pct) > 10 THEN 'Yes (difference > 10%)'
        ELSE 'No'
    END AS price_growth_higher_by_10_pct
FROM growth_calc
ORDER BY year;
