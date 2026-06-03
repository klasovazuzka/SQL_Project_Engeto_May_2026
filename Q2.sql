-- Dataset preview (tables) --
SELECT * 
FROM t_zuzana_klasova_project_SQL_primary_final;
------------------------------------------------------------------------------------------------
-- Question 2: How many liters of milk and kilograms of bread can be bought 
-- in the first and last comparable period in the available price and wage data? --
SELECT 
    year, 
    food_category,
    ROUND(AVG(avg_wage) / AVG(avg_price)) AS purchasing_power
FROM t_zuzana_klasova_project_sql_primary_final
WHERE year IN (2006, 2018)
AND (food_category ILIKE 'Chléb%' OR food_category ILIKE 'Mléko%') --The ILIKE values ('Chléb%' and 'Mléko%') remain in Czech because the data stored in the food_category column is still in Czech.--
GROUP BY food_category, year
ORDER BY food_category, year;

---- Check food category names ---
SELECT DISTINCT food_category 
FROM t_zuzana_klasova_project_sql_primary_final
WHERE food_category ILIKE 'Chléb%' OR food_category ILIKE 'Mléko%';
