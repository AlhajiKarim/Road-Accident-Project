

			Road Accident Report SQL Queries

-- Calculating Current Year Casualties

Select sum(number_of_casualties) As CY_Casualties
from Road_Accident
where Year(accident_date) = '2022' 




-- Calculating Current Year Accidents

Select count(distinct accident_index) As CY_Accidents
from dbo.Road_Accident
where Year(accident_date) = '2022'




-- Calculating Current Year Accidents

--calculation for PowerBi and Tableau (Fatal Accidents)

Select sum(number_of_casualties) As CY_Fatal_Casualties
from dbo.Road_Accident
where Year(accident_date) = '2022' and accident_severity = 'Fatal'



-- Calculation for excel
Select sum(number_of_casualties) As CY_Fatal_Casualties
from dbo.Road_Accident
where accident_severity = 'Fatal' 



-- Calculation for excel
Select sum(number_of_casualties) As CY_Serious_Casualties
from dbo.Road_Accident
where accident_severity = 'serious'



--calculation for PowerBi and Tableau

Select sum(number_of_casualties) As CY_Serious_Casualties
from dbo.Road_Accident
where Year(accident_date) = '2022' and accident_severity = 'Serious'



-- Calculation for excel
Select sum(number_of_casualties) As CY_Slight_Casualties
from dbo.Road_Accident
where accident_severity = 'slight'



--calculation for PowerBi and Tableau

Select sum(number_of_casualties) As CY_Slight_Casualties
from dbo.Road_Accident
where Year(accident_date) = '2022' and accident_severity = 'slight'




-- Calculation for Percentage Total for Slight Accident Severity

Select Cast(sum(number_of_casualties) As Decimal(10,2)) * 100/ 
(Select Cast(sum(number_of_casualties) AS Decimal(10,2)) from dbo.Road_Accident) As PCT
from dbo.Road_Accident
where accident_severity = 'slight'



Calculation for Percentage Total for Serious Accident Severity

Select Cast(sum(number_of_casualties) As Decimal(10,2)) * 100/ 
(Select Cast(sum(number_of_casualties) AS Decimal(10,2)) from dbo.Road_Accident) As PCT
from dbo.Road_Accident
where accident_severity = 'serious'



-- Calculation for Percentage Total for Fatal Accident Severity

Select Cast(sum(number_of_casualties) As Decimal(10,2)) * 100/ 
(Select Cast(sum(number_of_casualties) AS Decimal(10,2)) from dbo.Road_Accident) As PCT
from dbo.Road_Accident
where accident_severity = 'fatal'




			Casualties BY Vehicle Type

--Casualties By Vehicle Type for PowerBI and Tableau

Select 
	Case
		When vehicle_type IN ('Agricultural Vehicle') Then 'Agricultural'
		When vehicle_type IN ('Car', 'Taxi/Private hire car') Then 'Cars'
		When vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc', 'Pedal cycle') Then'Bike'
		When vehicle_type IN ('Bus or coach(17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') Then 'Bus'
		When vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') Then 'Van'
		Else 'other'
	End As vehicle_group,
	sum(number_of_casualties) as CY_Casualties
From Road_Accident
Where Year(accident_date) = '2022'
Group BY
	Case
		When vehicle_type IN ('Agricultural Vehicle') Then 'Agricultural'
		When vehicle_type IN ('Car', 'Taxi/Private hire car') Then 'Cars'
		When vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc', 'Pedal cycle') Then'Bike'
		When vehicle_type IN ('Bus or coach(17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') Then 'Bus'
		When vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') Then 'Van'
		Else 'other'
	End




--Casualties By Vehicle Type for Excel

Select 
	Case
		When vehicle_type IN ('Agricultural Vehicle') Then 'Agricultural'
		When vehicle_type IN ('Car', 'Taxi/Private hire car') Then 'Cars'
		When vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc', 'Pedal cycle') Then'Bike'
		When vehicle_type IN ('Bus or coach(17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') Then 'Bus'
		When vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') Then 'Van'
		Else 'other'
	End As vehicle_group,
	sum(number_of_casualties) as CY_Casualties
From Road_Accident
Group BY
	Case
		When vehicle_type IN ('Agricultural Vehicle') Then 'Agricultural'
		When vehicle_type IN ('Car', 'Taxi/Private hire car') Then 'Cars'
		When vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc', 'Pedal cycle') Then'Bike'
		When vehicle_type IN ('Bus or coach(17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') Then 'Bus'
		When vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') Then 'Van'
		Else 'other'
	End




				Monthly Trend
--Current Year Monthly Trend 2022

Select Datename(month,accident_date) As Month_Name, sum(number_of_casualties) As CY_Casualties
from road_accident
where year(accident_date) = '2022'
Group by Datename(month,accident_date)



--Previous Year Trend 2021

Select Datename(month,accident_date) As Month_Name, sum(number_of_casualties) As PY_Casualties
from road_accident
where year(accident_date) = '2021'
Group by Datename(month,accident_date)




-- CY Casualties BY Road Type

Select road_type,sum(number_of_casualties) as CY_Casualties
from road_accident
Where year(accident_date) = '2022'
Group By road_type




-- Current Year Casualties By Urban/Rural Percentages for PowerBI and Tableau

Select urban_or_rural_area, CAST(sum(number_of_casualties) As Decimal(10,2)) * 100 / 
(Select CAST(sum(number_of_casualties) As Decimal(10,2)) from road_accident Where Year(accident_date) = '2022') As PCT_Total
from road_accident
Where Year(accident_date) = '2022'
Group BY urban_or_rural_area




-- Current Year Casualties By Urban/Rural Percentages for Excel

Select urban_or_rural_area,sum(number_of_casualties) as Total_Casualties ,
CAST(sum(number_of_casualties) As Decimal(10,2)) * 100 / 
(Select CAST(sum(number_of_casualties) As Decimal(10,2)) from road_accident) As PCT_Total
from road_accident
Group BY urban_or_rural_area





