-- Dataset preview (tables) --
SELECT *
FROM countries c;

-- Filtering the table to EU countries only --
SELECT *
FROM countries c 
WHERE continent = 'Europe'
AND country IS NOT NULL;

SELECT *
FROM economies e;

--- Only selected columns from the table are relevant: country, population, gdp, gini, year ---
SELECT
    e.country, e.population, e.YEAR, e.gdp, e.gini
FROM economies e
WHERE YEAR BETWEEN 2006 AND 2018;
---------------------------------------------------------------------------------------------------------------------

----- Dropping any existing table with the same name and creating the secondary table t_zuzana_klasova_project_sql_secondary_final ------

DROP TABLE IF EXISTS t_zuzana_klasova_project_sql_secondary_final;

CREATE TABLE t_zuzana_klasova_project_sql_secondary_final AS
SELECT 
    e.country,
    e.year,
    ROUND(e.gdp::numeric, 2) AS gdp_rounded,
    e.gini,
    ROUND(e.taxes::NUMERIC, 2) AS taxes_rounded,
    c.continent
FROM economies e
JOIN countries c ON e.country = c.country
WHERE c.continent = 'Europe' 
  AND e.year BETWEEN 2006 AND 2018 
  AND e.gdp IS NOT NULL 
ORDER BY e.country, e.year;

-- Check result --
SELECT * FROM t_zuzana_klasova_project_sql_secondary_final;
