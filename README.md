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

## **Odpovědi**:

Pokud porovnáme jen počáteční rok 2007 a konečný rok 2018, průměrné mzdy vzrostly ve všech sledovaných odvětvích.
Pokud se však zaměříme na meziroční vývoj v průběhu let, mzdy nepřetržitě nerostly a v některých odvětvích v určitých letech i klesaly.(např.: Peněžnictví a pojišťovnictví,Výroba a rozvod elektřiny, plynu, tepla a klimatizovaného vzduchu,Těžba a dobývání)

Nejvýraznější propady v datech:

Největší meziroční propad postihl odvětví Peněžnictví a pojišťovnictví v roce 2008, kdy průměrná mzda klesla o citelných 12 271 Kč (z 54 059 Kč na 41 788 Kč). Toto odvětví zaznamenalo další poklesy také v letech 2010 (o 7 994 Kč) a 2013 (o 8 995 Kč). Výroba a rozvod elektřiny, plynu, tepla a klimatizovaného vzduchu zaznamenala druhý největší propad, a to v roce 2012, kdy průměrná mzda klesla o 11 397 Kč. Odvětví Těžba a dobývání vykazovalo poklesy opakovaně, přičemž nejvýrazněji v roce 2009 (o 9 579 Kč) a v roce 2008 (o 9 391 Kč).

Mzdy v dlouhodobém horizontu sice všude vzrostly, ale v průběhu let byla řada odvětví (zejména finanční sektor, energetika a těžký průmysl) zasažena ekonomickými výkyvy, které vedly k velkým meziročním propadům.

Během sledovaného období (r. 2006–2018) se celková kupní síla a dostupnost obou základních potravin zlepšila. Ačkoliv absolutní ceny chleba i mléka vzrostly, průměrná mzda stoupala rychlejším tempem. Díky tomu si průměrně vydělávající občan mohl v roce 2018 ze své výplaty koupit o 52 kg chleba (celkem 1 365 kg) a o 204 litrů mléka (celkem 1 670 l) více než na začátku srovnatelného období v roce 2006.

Na základě provedené analýzy dat je kategorií potravin, která zdražuje nejpomaleji, vepřová pečeně s kostí, u níž je průměrný meziroční nárůst ceny jen 0,1 %.

Na základě analyzovaných dat neexistuje ve sledovaném období (r.2007–2018) žádný rok, ve kterém by meziroční nárůst cen potravin převýšil růst mezd o více než 10 %. Největší rozdíl byl zaznamenán v roce 2013, kdy ceny rostly o 7,11 % rychleji než mzdy, ale ani zde nebyla desetiprocentní hranice překročena.

Výrazný pokles HDP v roce 2009 (o -4,66 %) se okamžitě projevil propadem cen potravin (o -6,81 %) a zpomalením růstu mezd (spadly z více než 7% růstu v předchozích letech na 3,07 %). Výrazný růst HDP v roce 2017 (5,17 %) byl provázen silným nárůstem cen potravin (9,98 %) a růstem mezd (6,17 %), který pak ještě akceleroval v roce 2018 na 7,7 %. Ukazuje se, že HDP není jediným hybatelem. V roce 2015 HDP rostlo velmi rychle (5,39 %), ale ceny potravin naopak klesaly (-0,56 %) a růst mezd byl spíše mírný (2,6 %).

Na základě analyzovaných dat lze konstatovat, že vývoj HDP má prokazatelný vliv na změny mezd a cen potravin, nicméně tento vztah není striktně lineární a působí zde i další faktory.

Při výrazných ekonomických šocích se vliv projevuje téměř okamžitě. Příkladem je rok 2009, kdy razantní propad HDP (-4,66 %) korespondoval s výrazným zlevněním potravin (-6,81 %) a zpomalením růstu mezd. Stejně tak v období silného růstu v roce 2017 (růst HDP o 5,17 %) vidíme souběžný prudký nárůst cen potravin (téměř 10 %) i rychlejší růst mezd (6,17 %).

Na druhou stranu data obsahují i výjimky, jako například rok 2015, kdy HDP rostlo významným tempem (5,39 %), avšak ceny potravin ve stejném roce mírně klesly a mzdy rostly jen pozvolna. Růst HDP tedy zpravidla vytváří prostor pro růst mezd a cen, ale nemusí se to nutně a v plné síle projevit ve stejném nebo bezprostředně následujícím roce.
