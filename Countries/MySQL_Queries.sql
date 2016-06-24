USE world;  -- Use the 'world' database

/*1. What query would you run to get all the countries that speak Slovene?
Your query should return the name of the country, language and language percentage.
You query should arrange the result by language percentage in descending order. (1) */
SELECT countries.name, languages.language, languages.percentage -- select name, language, and percentage
FROM countries -- from countries
LEFT JOIN languages -- while left joining the languages table
ON countries.id = languages.country_id -- on country id's
WHERE languages.language = "Slovene" -- grabbing only those using slovene language
ORDER BY languages.percentage DESC; -- ordering by desc use of percentage

/*2. What query would you run to display the total number of cities for each country?
Your query should return the name of the country and the total number of cities.
You query should arrange the result by the number of cities in descending order. (3) */
Select countries.name, COUNT(cities.name) as cities -- select name and the count of the cities.name column
FROM cities -- from the cities table
LEFT JOIN countries -- left joining countries table
ON cities.country_code = countries.code -- on the country code
GROUP BY countries.name -- grouping by country name
ORDER BY cities DESC; -- ordering by total cities in desc order

/*3. What query would you run to get all the cities in Mexico with a population
of greater than 500,000? Your query should arrange the result by population in descending order. (1) */
SELECT cities.name, cities.population  -- select name, and population
FROM cities  -- from table = cities
LEFT JOIN countries  -- left join table = countries
ON cities.country_code = countries.code  --  on country codes
WHERE countries.name = "MEXICO" AND cities.population > 500000 --  look for cities in Mex with pop over 500000
ORDER BY cities.population DESC; -- group by descending order of population

/*4. What query would you run to get all languages in each country with a
percentage greater than 89%? Your query should arrange the result by percentage in descending order. (1) */
SELECT countries.name, languages.language, languages.percentage # select name, language, percentage
FROM languages # from table languages
LEFT JOIN countries # left join countries
ON languages.country_code = countries.code # on country code
WHERE languages.percentage > 89 # where percent of language spoken is > than 89%
ORDER BY languages.percentage DESC; # order in desc order on percent 

/*5. What query would you run to get all the countries with Surface Area
below 501 and Population greater than 100,000? (2) */
SELECT name, population, surface_area # select population and surface area
FROM countries # from table countries
WHERE surface_area < 501 AND population > 100000 #sort by surface area > 501 and pop > 500000
ORDER BY surface_area DESC; # arrange in desc order by surface area

/*6. What query would you run to get countries with only Constitutional Monarchy
with a capital greater than 200 and a life expectancy greater than 75 years? (1) */
SELECT name, life_expectancy # select name and life expectancy
FROM countries # from table countries
WHERE government_form = "CONSTITUTIONAL MONARCHY" # by 3 arguments of constitutional monarch, capital > 200, and life expentance of 75
AND capital > 200 AND life_expectancy > 75
ORDER BY life_expectancy DESC; # order by desc life expectancy

/*7. What query would you run to get all the cities of Argentina inside the
Buenos Aires district and have the population greater than 500, 000?
The query should return the Country Name, City Name, District and Population. (2) */
SELECT countries.name, cities.name, cities.district, cities.population # select country name, city name, district, pop
FROM cities # from table cities
LEFT JOIN countries #left join table countries
ON cities.country_code = countries.code # on country code
WHERE countries.name = "ARGENTINA" #sort by ARGENTINA, BUENOS AIRES, AND pop > 500000
AND cities.district = "BUENOS AIRES"
AND cities.population > 500000
ORDER BY cities.population DESC; # list in desc order of population


/*8. What query would you run to summarize the number of countries
in each region? The query should display the name of the region and the
number of countries. Also, the query should arrange the result by the
number of countries in descending order. (2) */
SELECT region, COUNT(*) as countries # select region, COUNT all in region and set a countries
FROM countries # from table countries
GROUP BY region # group by region
ORDER BY countries DESC; #order in desc order by countries in region