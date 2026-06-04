# Projekt: Analýza dostupnosti potravin a vývoje mezd v ČR
Na analytickém oddělení nezávislé společnosti zabývající se životní úrovní občanů jsme zpracovali robustní datové podklady pro tiskové oddělení. Cílem projektu je zodpovědět definované výzkumné otázky týkající se dostupnosti základních potravin široké veřejnosti v závislosti na průměrných příjmech za určité časové období. Výsledky budou prezentovány na oborové konferenci.

Součástí analýzy je i srovnání makroekonomických ukazatelů (HDP, GINI koeficient, populace) s dalšími evropskými státy ve stejném období.

# 🗂 Datové podklady
Pro vypracování analýzy byly využity sady z Portálu otevřených dat ČR a další globální databáze.

## Primární tabulky

*czechia_payroll_industry_branch* – Číselník odvětví v tabulce mezd.

*czechia_payroll_unit* – Číselník jednotek hodnot v tabulce mezd.

*czechia_payroll_value_type* – Číselník typů hodnot v tabulce mezd.

*czechia_price* – Informace o cenách vybraných potravin za několikaleté období.

*czechia_price_category* – Číselník kategorií potravin, které se vyskytují v přehledu.  

## Číselníky sdílených informací o ČR
*czechia_region* – Číselník krajů ČR dle normy CZ-NUTS 2.  

*czechia_district* – Číselník okresů ČR dle normy LAU.  

## Dodatečné tabulky
*countries* – Geografické a kulturní informace o zemích (hlavní město, měna, národní jídlo, průměrná výška populace).  

*economies* – Makroekonomické ukazatele (HDP, GINI, daňová zátěž) pro daný stát a rok.  

## 🎯 Výstupy projektu
Výstupem analýzy je sada SQL skriptů (Question 1-5.sql) a dvě finální databázové tabulky sloužící jako podklad pro zodpovězení výzkumných otázek:  

**t_zuzana_klasova_project_SQL_primary_final** – Sjednocená data mezd a cen potravin za ČR za totožné porovnatelné období (společné roky).

**t_zuzana_klasova_project_SQL_secondary_final** – Dodatečná makroekonomická data o dalších evropských státech.

# 📊 Výzkumné otázky a závěry analýzy

## **Výzkumné otázky a odpovědi**:

*1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?*

Celkově mzdy v čase rostou napříč všemi odvětvími. Nicméně v krátkodobém horizontu lze zaznamenat výjimky — například okolo roku 2013 došlo v některých odvětvích k meziročnímu poklesu. Nejvíce to pocítily sektory jako těžba, energetika a finanční služby, kde se hospodářský cyklus projevil dočasným snížením mezd.

Mzdy v dlouhodobém horizontu sice všude vzrostly, ale v průběhu let byla řada odvětví (zejména finanční sektor, energetika a těžký průmysl) zasažena ekonomickými výkyvy, které vedly k velkým meziročním propadům.

*2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?*

Srovnáme-li roky 2006 a 2018, kupní síla obyvatel se u obou potravin zvýšila. V roce 2006 průměrná mzda pokryla nákup přibližně 1460 litrů mléka nebo 1308 kilogramů chleba. O dvanáct let později, v roce 2018, to bylo již 1667 litrů mléka a 1363 kilogramů chleba — obyvatelé si tedy mohli dovolit více.

*3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?*

Z analyzovaných kategorií vykazuje nejnižší průměrný meziroční nárůst cen Cukr krystalový. Jeho cena rostla v průběhu sledovaného období nejpomaleji ze všech sledovaných potravin.

*4)Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?*

Na základě analyzovaných dat neexistuje ve sledovaném období (r.2007–2018) žádný rok, ve kterém by meziroční nárůst cen potravin převýšil růst mezd o více než 10 %. Největší rozdíl byl zaznamenán v roce 2013, kdy ceny rostly o 7,11 % rychleji než mzdy, ale ani zde nebyla desetiprocentní hranice překročena.

Výrazný pokles HDP v roce 2009 (o -4,66 %) se okamžitě projevil propadem cen potravin (o -6,81 %) a zpomalením růstu mezd (spadly z více než 7% růstu v předchozích letech na 3,07 %). Výrazný růst HDP v roce 2017 (5,17 %) byl provázen silným nárůstem cen potravin (9,98 %) a růstem mezd (6,17 %), který pak ještě akceleroval v roce 2018 na 7,7 %. Ukazuje se, že HDP není jediným hybatelem. V roce 2015 HDP rostlo velmi rychle (5,39 %), ale ceny potravin naopak klesaly (-0,56 %) a růst mezd byl spíše mírný (2,6 %).


Na druhou stranu data obsahují i výjimky, jako například rok 2015, kdy HDP rostlo významným tempem (5,39 %), avšak ceny potravin ve stejném roce mírně klesly a mzdy rostly jen pozvolna. Růst HDP tedy zpravidla vytváří prostor pro růst mezd a cen, ale nemusí se to nutně a v plné síle projevit ve stejném nebo bezprostředně následujícím roce.


*5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?*

Z dostupných dat nelze potvrdit přímou a předvídatelnou závislost mezi růstem HDP a vývojem mezd či cen potravin. I když HDP v některých letech výrazně vzrostl, neprojevilo se to automaticky vyšším růstem mezd nebo cen potravin — ani ve stejném, ani v následujícím roce. Ekonomické ukazatele jsou ovlivněny mnoha faktory a jejich vzájemný vztah je složitější, než aby šel popsat jednoduchým pravidlem.

Na základě dat lze říci:
Data nepotrzují přímou závislost mezi HDP a mzdami/cenami potravin. Několik příkladů:

1.*2009*: HDP kleslo o -4.66 %, přesto mzdy rostly o +3.07 % a ceny potravin naopak klesly o -6.81 %
2.*2012*: HDP kleslo o -0.79 %, ale ceny potravin výrazně rostly o +6.92 %
3.*2013*: HDP bylo téměř nulové (-0.05 %), mzdy klesly o -1.56 %, ceny potravin přesto rostly o +5.55 %
4.*2017*: HDP rostlo o +5.17 % a mzdy i ceny reagovaly růstem (+6.17 % a +9.98 %)

Z dat vyplývá, že výška HDP nemá jednoznačný a přímý vliv na vývoj mezd ani cen potravin. V některých letech jako například 2017 lze pozorovat souběžný růst všech tří ukazatelů, avšak v jiných letech jako 2009 nebo 2012 se ukazatele vyvíjely zcela odlišně nebo dokonce protichůdně. Data tedy nepodporují závěr, že by růst HDP automaticky způsoboval výraznější růst mezd či cen potravin ve stejném nebo následujícím roce.
