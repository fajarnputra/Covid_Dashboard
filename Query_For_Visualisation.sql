use covid_analysis;

-- Query 1
-- 10 Countries with the highest overall covid cases (count)
select location, sum(new_cases) as total_cases from coviddeaths 
where continent is not null group by location order by total_cases desc;

-- Query 2
-- 10 Countries with the highest overall covid deaths (count)
select location, sum(new_deaths) as total_death from coviddeaths 
where continent is not null group by location order by total_death desc;

-- Query 3
-- Highest overall fatality percentage (new_deaths/new_cases) by countries
select location,sum(new_deaths),sum(new_cases), sum(new_deaths)/sum(new_cases)*100 death_rate from coviddeaths
where continent is not null group by location order by death_rate desc;

-- Query 4 
-- Highest number of population infected by countries (percentage) -> map chart
select d.location, p.population, max(d.total_cases), max(d.total_cases/p.population)*100
from coviddeaths d inner join (select distinct location, population from covidpopulation)  p
on d.location = p.location
where continent is not null
group by d.location, p.population
order by max(d.total_cases/p.population) desc;

-- Query 5 
-- relationship between total vaccinations and gdp_per_capita
select v.location, gdp_per_capita, (max(total_vaccinations)/population)*100
from covidvaccinations v inner join (select distinct location, population from covidpopulation)  p
on v.location = p.location
where continent is not null
group by location, gdp_per_capita, population; 

select * from coviddeaths limit 100;