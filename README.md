# Projekt: Analýza dostupnosti potravin a vývoje mezd v ČR
Na analytickém oddělení nezávislé společnosti zabývající se životní úrovní občanů jsme zpracovali robustní datové podklady pro tiskové oddělení. Cílem projektu je zodpovědět definované výzkumné otázky týkající se dostupnosti základních potravin široké veřejnosti v závislosti na průměrných příjmech za určité časové období. Výsledky budou prezentovány na oborové konferenci.

Součástí analýzy je i srovnání makroekonomických ukazatelů (HDP, GINI koeficient, populace) s dalšími evropskými státy ve stejném období.

# Datové podklady
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

## Výstupy projektu
Výstupem analýzy je sada SQL skriptů (Question 1-5.sql) a dvě finální databázové tabulky sloužící jako podklad pro zodpovězení výzkumných otázek:  

**t_zuzana_klasova_project_SQL_primary_final** – Sjednocená data mezd a cen potravin za ČR za totožné porovnatelné období (společné roky).

**t_zuzana_klasova_project_SQL_secondary_final** – Dodatečná makroekonomická data o dalších evropských státech.

# Výzkumné otázky a závěry analýzy

## **Výzkumné otázky a odpovědi**:

*1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?*

Celkově mzdy v čase rostou napříč všemi odvětvími. Nicméně v krátkodobém horizontu lze zaznamenat výjimky — například okolo roku 2013 došlo v některých odvětvích k meziročnímu poklesu. Nejvíce to pocítily sektory jako těžba, energetika a finanční služby, kde se hospodářský cyklus projevil dočasným snížením mezd.

Mzdy v dlouhodobém horizontu sice všude vzrostly, ale v průběhu let byla řada odvětví (zejména finanční sektor, energetika a těžký průmysl) zasažena ekonomickými výkyvy, které vedly k velkým meziročním propadům.

*2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?*

Srovnáme-li roky 2006 a 2018, kupní síla obyvatel se u obou potravin zvýšila. V roce 2006 průměrná mzda pokryla nákup přibližně 1460 litrů mléka nebo 1308 kilogramů chleba. O dvanáct let později, v roce 2018, to bylo již 1667 litrů mléka a 1363 kilogramů chleba — obyvatelé si tedy mohli dovolit více.

*3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?*

Z analyzovaných kategorií vykazuje nejnižší průměrný meziroční nárůst cen **Cukr krystalový**. Jeho cena rostla v průběhu sledovaného období nejpomaleji ze všech sledovaných potravin.

*4) Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?*

Z analýzy dat vyplývá, že k tak výraznému rozdílu mezi růstem cen potravin a mezd nikdy nedošlo. Hranice 10 % nebyla překročena v žádném sledovaném roce. Nejnapjatější situace nastala v roce 2013, kdy mzdy mírně klesly a ceny potravin současně rostly. Zcela opačný scénář přinesl rok 2009, kdy prudký pokles cen potravin umožnil mzdám výrazně předstihnout zdražování. Celkově tedy data ukazují, že kupní síla obyvatel byla ve sledovaném období relativně chráněna a k žádnému dramatickému propadu nedošlo.

*5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?*

Z dostupných dat nelze potvrdit přímou a předvídatelnou závislost mezi růstem HDP a vývojem mezd či cen potravin. I když HDP v některých letech výrazně vzrostl, neprojevilo se to automaticky vyšším růstem mezd nebo cen potravin — ani ve stejném, ani v následujícím roce. Ekonomické ukazatele jsou ovlivněny mnoha faktory a jejich vzájemný vztah je složitější, než aby šel popsat jednoduchým pravidlem.

Na základě dat lze říci:
Data nepotrzují přímou závislost mezi HDP a mzdami/cenami potravin. Několik příkladů:

- **2009:** HDP kleslo o -4.66 %, přesto mzdy rostly o +3.07 % a ceny potravin naopak klesly o -6.81 %
- **2012:** HDP kleslo o -0.79 %, ale ceny potravin výrazně rostly o +6.92 %
- **2013:** HDP bylo téměř nulové (-0.05 %), mzdy klesly o -1.56 %, ceny potravin přesto rostly o +5.55 %
- **2017:** HDP rostlo o +5.17 % a mzdy i ceny reagovaly růstem (+6.17 % a +9.98 %)

Z dat vyplývá, že výška HDP nemá jednoznačný a přímý vliv na vývoj mezd ani cen potravin. V některých letech jako například 2017 lze pozorovat souběžný růst všech tří ukazatelů, avšak v jiných letech jako 2009 nebo 2012 se ukazatele vyvíjely zcela odlišně nebo dokonce protichůdně. Data tedy nepodporují závěr, že by růst HDP automaticky způsoboval výraznější růst mezd či cen potravin ve stejném nebo následujícím roce.

# Závěr projektu
