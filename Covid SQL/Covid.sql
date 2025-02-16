select *
from PortfolioProject..Deaths
where continent is not null
order by 3,4

--select *
--from PortfolioProject..Vaccinations

-- Select Data

select location, date, total_cases,new_cases, total_deaths, population
from PortfolioProject..Deaths
order by 1,2

-- Total Cases vs Total Deaths
-- % of Deaths in Colombia

select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..Deaths
where location like '%Colombia%'
order by 1,2

-- Total Cases vs Population 
-- % of Population infected


select location,date, population, total_cases, (total_cases/population)*100 as InfectedPercentage
from PortfolioProject..Deaths
where location like '%Colombia%'
order by 1,2 

-- Countries with  the highest infection rate 

Select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as InfectedPercentage
From PortfolioProject..Deaths
Group by location, population
order by 4 DESC

-- Countries with  the highest death rate

Select location, max(total_deaths) as TotalDeathCount
From PortfolioProject..Deaths
where continent is not null 
Group by location
order by TotalDeathCount DESC

-- BY Continent

Select continent, max(total_deaths) as TotalDeathCount
From PortfolioProject..Deaths
where continent is not null
Group by continent
order by TotalDeathCount DESC