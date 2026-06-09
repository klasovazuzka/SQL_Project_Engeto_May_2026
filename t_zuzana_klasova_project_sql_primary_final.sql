-- Dataset preview (tables) --
SELECT *
FROM czechia_price cpr;

SELECT *
FROM czechia_price_category cpc;

SELECT *
FROM czechia_payroll cp;

SELECT *
FROM czechia_payroll_industry_branch cpib;
--------------------------------------------------------------------------------------
----- Dropping any existing table with the same name and creating the primary table t_zuzana_klasova_project_sql_primary_final ------
DROP TABLE IF EXISTS t_zuzana_klasova_project_sql_primary_final;

CREATE TABLE t_zuzana_klasova_project_sql_primary_final AS
WITH food_table AS (
    SELECT
        cpc.name AS food_name, 
        ROUND(AVG(cp.value)::NUMERIC, 2) AS avg_food_price,  
        EXTRACT(YEAR FROM cp.date_from) AS common_year,
        cpc.price_value AS value,
        cpc.price_unit AS unit
    FROM czechia_price cp
    JOIN czechia_price_category cpc ON cp.category_code = cpc.code
    WHERE cp.region_code IS NULL -- Average for the whole Czech Republic (stored as NULL in data)
    GROUP BY cpc.name, cpc.price_value, cpc.price_unit, common_year
),
wage_table AS (
    SELECT 
        cpib.name AS industry_name,  
        ROUND(AVG(cp.value)::NUMERIC, 0) AS avg_wage,
        cp.payroll_year AS common_year
    FROM czechia_payroll cp
    LEFT JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code  
    WHERE cp.value_type_code = 5958 -- Average gross wage per employee
    AND cp.calculation_code = 200   -- Full-time equivalent
    GROUP BY cpib.name, cp.payroll_year
)
SELECT 
    ft.common_year,
    ft.food_name,
    ft.avg_food_price,
    ft.value,
    ft.unit,
    wt.industry_name,
    wt.avg_wage,
    e.gdp AS gdp_in_year
FROM food_table ft
JOIN wage_table wt ON ft.common_year = wt.common_year
LEFT JOIN economies e ON ft.common_year = e.year AND e.country = 'Czech Republic'
ORDER BY ft.common_year, wt.industry_name, ft.food_name;

-- Check result --
SELECT * FROM t_zuzana_klasova_project_sql_primary_final;




