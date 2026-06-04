-- Dataset preview (tables) --
SELECT * 
FROM t_zuzana_klasova_project_SQL_primary_final;
-------------------------------------------------------------

-- Question 1: Do wages grow across all industries over the years, or do they decline in some? --
WITH wages_over_time AS (
    -- First we group the data to get one average per industry and year --
    SELECT 
        year,
        industry_branch,
        AVG(avg_wage) AS wage_in_year
    FROM t_zuzana_klasova_project_sql_primary_final
    GROUP BY year, industry_branch
)
SELECT 
    year,
    industry_branch,
    wage_in_year,
    -- LAG looks at the previous year, but only within the given industry (PARTITION BY)
    LAG(wage_in_year) OVER (PARTITION BY industry_branch ORDER BY year) AS wage_previous_year,
    -- Calculation of absolute difference --
    wage_in_year - LAG(wage_in_year) OVER (PARTITION BY industry_branch ORDER BY year) AS difference_in_czk
FROM wages_over_time
ORDER BY difference_in_czk;
