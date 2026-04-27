# World Life Expantancy Project (Data Cleaning)

SELECT * 
FROM world_life_expectancy
;

SELECT Country, year, concat(country, year) ,count(concat(country, year))
FROM world_life_expectancy
group by Country, year, concat(country, year)
having count(concat(country, year)) > 1
;

select row_id, 
concat(country, year),
row_number() over(partition by concat(country, year) order by concat(country, year)) as Row_Num
FROM world_life_expectancy
;

select *
from (
	select row_id, 
	concat(country, year),
	row_number() over(partition by concat(country, year) order by concat(country, year)) as Row_Num
	FROM world_life_expectancy
    ) as Row_table
where Row_Num > 1
;

delete from world_life_expectancy
where 
	row_id in (
    select row_id
from (
	select row_id, 
	concat(country, year),
	row_number() over(partition by concat(country, year) order by concat(country, year)) as Row_Num
	FROM world_life_expectancy
    ) as Row_table
where Row_Num > 1
)
;


SELECT * 
FROM world_life_expectancy
where status = ''
;

SELECT distinct(status) 
FROM world_life_expectancy
where status <> ''
;

SELECT distinct(country) 
FROM world_life_expectancy
where status = 'Developing'
;

# NOT WORKING how i was thinking it would work
update world_life_expectancy
set status = 'Developing'
where country in (SELECT distinct(country) 
				FROM world_life_expectancy
				where status = 'Developing');
                
                
update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country=t2.country
set t1.status = 'Developing'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developing'
;


SELECT * 
FROM world_life_expectancy
where country = 'United States of America'
;

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country=t2.country
set t1.status = 'Developed'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developed'
;


SELECT * 
FROM world_life_expectancy
#where `Life expectancy` = ''
;

SELECT country, year,  `Life expectancy`
FROM world_life_expectancy
;

SELECT t1.country, t1.year,  t1.`Life expectancy`,
t2.country, t2.year,  t2.`Life expectancy`,
t3.country, t3.year,  t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
    and t1.year = t2.year - 1
join world_life_expectancy t3
	on t1.country = t3.country
    and t1.year = t3.year + 1
where t1.`Life expectancy` = ''
;

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
    and t1.year = t2.year - 1
join world_life_expectancy t3
	on t1.country = t3.country
    and t1.year = t3.year + 1
set t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
where t1.`Life expectancy` = ''
;


SELECT * 
FROM world_life_expectancy
#where `Life expectancy` = ''
;











