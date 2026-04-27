# World Life Expantancy Project (Exploratory Data Analysis)

SELECT * 
FROM world_life_expectancy
;

SELECT country, min(`Life expectancy`), 
max(`Life expectancy`),
Round(max(`Life expectancy`) - min(`Life expectancy`),1) as Life_increase_15_years
FROM world_life_expectancy
group by country
having min(`Life expectancy`) <> 0
and max(`Life expectancy`) <> 0
order by Life_increase_15_years desc
;

select year, round(avg(`Life expectancy`),1)
FROM world_life_expectancy
where `Life expectancy` <> 0
and `Life expectancy` <> 0
group by year
order by year
;

SELECT * 
FROM world_life_expectancy
;


SELECT country, round(AVG(`Life expectancy`),1) as Life_Exp, round(avg(gdp),1) as gdp
FROM world_life_expectancy
group by country
having life_exp > 0 
and gdp > 0
order by gdp desc
;

SELECT 
sum(case when gdp >= 1500 then 1 else 0 end) high_gdp_count,
avg(case when gdp >= 1500 then `Life expectancy` else null end) high_gdp_Life_expectancy,
sum(case when gdp <= 1500 then 1 else 0 end) low_gdp_count,
avg(case when gdp <= 1500 then `Life expectancy` else null end) low_gdp_Life_expectancy
FROM world_life_expectancy
;

SELECT * 
FROM world_life_expectancy
;

SELECT status, round(avg(`Life expectancy`),1)
FROM world_life_expectancy
group by status
;

SELECT status, count(distinct country), round(avg(`Life expectancy`),1)
FROM world_life_expectancy
group by status
;

SELECT country, round(AVG(`Life expectancy`),1) as Life_Exp, round(avg(bmi),1) as bmi
FROM world_life_expectancy
group by country
having life_exp > 0 
and bmi > 0
order by bmi asc
;


SELECT country,
year,
 `Life expectancy`,
 `Adult Mortality`,
 sum(`Adult Mortality`) over(PARTITION BY Country order by Year) as Rolling_total
FROM world_life_expectancy
where country like '%united%'
;























