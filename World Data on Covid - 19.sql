
select*
from [portfolio project].dbo.[covid deaths]
where continent is not null


select*
from [portfolio project].[dbo].[covid vaccination]
where continent is not null



select*
from [portfolio project].dbo.[covid deaths]
where continent is not null
order by 2,3

select*
from [portfolio project].[dbo].[covid vaccination]
where continent is not null
order by 2,3

--Comparing the totalcases to totaldeath
select location,date, total_cases_per_million, new_cases,total_deaths, population
from [portfolio project].dbo.[covid deaths]
order by 1,2


--select order_approved_at, convert (date, order_approved_at) orderapprovedat
--from dbo.olist_orders_dataset$

--ALTER TABLE olist_orders_dataset$
--ADD orderapprovedat DATE;

--UPDATE olist_orders_dataset$
--SET orderapprovedat = convert (date, order_approved_at);

SELECT CAST(total_cases_per_million AS DECIMAL(10, 2)) AS total_cases
FROM [portfolio project].dbo.[covid deaths];

 ALTER TABLE [portfolio project].dbo.[covid deaths]
ADD total_cases DECIMAL;

UPDATE [portfolio project].dbo.[covid deaths]
SET total_cases= CAST(total_cases_per_million AS DECIMAL(10, 2));

--Shows the percentagechances of dying when infected

select location, date, total_cases,total_deaths, (total_cases/total_deaths)*100 as percentagedeath
from [portfolio project].dbo.[covid deaths]
where continent is not null
order by 1,2 

s=elect location,total_cases, CAST(total_deaths AS int) AS TOTALDEATH, (total_cases/CAST(total_deaths AS int))*100 as percentagedeath2
from [portfolio project].dbo.[covid deaths]
where continent is not null
GROUP BY LOCATION,CAST(total_deaths AS int),total_cases
order by 1,2 


--Total cases recorded vs population 
--Shows the percentage of population that has covid


select location, date, total_cases_per_million, population, (total_cases_per_million/population)*100 as percentagepopulationfected
from [portfolio project].dbo.[covid deaths]
where continent is not null
order by 3,4 

--Total death count from different continents

select continent, CAST(total_deaths as int) as TOtaldeathcount
from [portfolio project].dbo.[covid deaths]
where continent is not null
Group by continent, CAST(total_deaths as int)
Order by TOtaldeathcount desc

SELECT continent, SUM(CAST(total_deaths AS int)) AS total_death_count
FROM [portfolio project].dbo.[covid deaths]
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY continent;

--percentage of the population infected

select location, date, total_cases_per_million, population, (total_cases_per_million/population)*100 as percentagepopulationfected
from [portfolio project].dbo.[covid deaths]
--where location like '%africa%'
where continent is not null
order by 4,5 asc

--Shows the country with the highest infected rate compared to the population

select location, population, MAX(total_cases_per_million) as Highestinfectioncounts, MAX((total_cases_per_million/population))*100 as Maxpercentagepopulationinfected
from [portfolio project].dbo.[covid deaths]
--where location like '%africa%'
where continent is not null
Group by location,population
Order by Maxpercentagepopulationinfected desc;


--shows the country with highestdeathcountperpopulation

select location, population, MAX(total_deaths) as Highestinfectioncounts, MAX((total_deaths/population))*100 as Highestdeathcount
from [portfolio project].dbo.[covid deaths]
--where location like '%africa%'
where continent is not null
Group by location,population 
Order by Highestdeathcount desc;


select location, population, MAX(total_cases_per_million) as Highestinfectioncounts, MAX((total_cases_per_million/population))*100 as Maxpercentagepopulationinfected
from [portfolio project].dbo.[covid deaths]
--where location like '%africa%'
where continent is not null
Group by location,population
Order by Maxpercentagepopulationinfected desc;




select location, MAX(CAST(total_deaths as int)) as TOtaldeathcount
from [portfolio project].dbo.[covid deaths]
where continent is null
Group by location
Order by  TOtaldeathcount desc

--Continent with the Highest deathcount

select continent, MAX(CAST(total_deaths as int)) as TOtaldeathcount
from [portfolio project].dbo.[covid deaths]
where continent is not null
Group by continent
Order by  TOtaldeathcount desc

select continent, CAST(total_deaths as int) as TOtaldeathcount
from [portfolio project].dbo.[covid deaths]
where continent is not null
Group by continent, CAST(total_deaths as int)
Order by TOtaldeathcount desc


--GLOBAL COUNT

select SUM(new_cases) as Totalcases,  SUM(CAST(new_deaths as int)) as globaldeath,  SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as percentageglobaldeath
from [portfolio project].dbo.[covid deaths]
where continent is not null
--Group by date
order by 1,2

select date, SUM(new_cases) as Totalcases,  SUM(CAST(new_deaths as int)) as globaldeath,  SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as percentageglobaldeath
from [portfolio project].dbo.[covid deaths]
where continent is not null
Group by date
order by 1,2


select*
from [portfolio project].dbo.['owid-covid-data - Copy$']


--Total population vs vaccination

select*
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location

select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location
order by 2,3

select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location
where DEA.continent is not NULL
ORDER BY 2,3

select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations 
--, SUM(CONVERT(int,COV.new_vaccinations)) over (partition by DEA.location)
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location
where DEA.continent is not NULL
ORDER BY 2,3

select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations 
, SUM(CONVERT(int,COV.new_vaccinations)) over (partition by DEA.location order by DEA.LOCATION,DEA.DATE)
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location
where DEA.continent is not NULL
ORDER BY 2,3

select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations 
, SUM(CONVERT(int,COV.new_vaccinations)) over (partition by DEA.location order by DEA.LOCATION,DEA.DATE) Rollingpeoplevaccinated 
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location
where DEA.continent is not NULL
ORDER BY 2,3



With Popvsvac (continent, location, date, population, new_vaccinations, Rollingpeoplevaccinated)
as
(
select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations 
, SUM(CONVERT(int,COV.new_vaccinations)) over (partition by DEA.location order by DEA.LOCATION,DEA.DATE) Rollingpeoplevaccinated
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
    on DEA.location = COV.location
    and DEA.date = COV.date
where DEA.continent is not NULL
)
SELECT*, (Rollingpeoplevaccinated/population)*100 percentagerollingpeoplvaccinated
FROM Popvsvac


--TEMP_TABLE
	DROP TABLE IF EXISTS PERCENTPOPULATIONVACCINATED 
CREATE TABLE PERCENTPOPULATIONVACCINATED 
(
continent nvarchar(100),
location nvarchar(100),
 date datetime,
population numeric,
new_vaccination numeric,
Rollingpeoplevaccinated numeric
)

insert into PERCENTPOPULATIONVACCINATED 
select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations 
, SUM(CONVERT(int,COV.new_vaccinations)) over (partition by DEA.location order by DEA.LOCATION,DEA.DATE) Rollingpeoplevaccinated
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
    on DEA.location = COV.location
    and DEA.date = COV.date
where DEA.continent <> NULL

SELECT*, (Rollingpeoplevaccinated/population)*100 percentagerollingpeoplvaccinated
FROM PERCENTPOPULATIONVACCINATED 



create view PERCENTPOPVACCINATED as
select DEA.continent,DEA.location,DEA.date,DEA.population, COV.new_vaccinations 
, SUM(CONVERT(int,COV.new_vaccinations)) over (partition by DEA.location order by DEA.LOCATION,DEA.DATE) Rollingpeoplevaccinated
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
    on DEA.location = COV.location
    and DEA.date = COV.date
where DEA.continent is not NULL


select*
FROM PERCENTPOPVACCINATED



CREATE VIEW GLOBALCOUNT AS
select continent, MAX(CAST(total_deaths as int)) as TOtaldeathcount
from [portfolio project].dbo.[covid deaths]
where continent is not null
Group by continent


SELECT*
FROM GLOBALCOUNT

select DEA.location, new_vaccinations
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location
where DEA.location like '%Nigeria%'
--group by DEA.location, DEA.population
--order by new_vaccinations


select DEA.date, DEA.location, new_vaccinations
from [portfolio project].dbo.[covid deaths] DEA
JOIN [portfolio project].dbo.['owid-covid-data - Copy$'] COV
on DEA.date=COV.date
and DEA.location=COV.location
where DEA.location like '%Nigeria%'
group by DEA.date, DEA.location, new_vaccinations
--order by new_vaccinations