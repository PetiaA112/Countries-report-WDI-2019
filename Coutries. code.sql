SELECT *
  FROM [Project].[dbo].[HEFPICountry]

  --Coutries overview

  --Number of coutries by region
SELECT Region, COUNT(Short_Name)
FROM [Project].[dbo].[HEFPICountry]
GROUP BY Region
 --------------------------------------------------------------------------

--Number of Countries grouped by Income_Group
SELECT Income_Group, COUNT(Short_Name)
FROM [Project].[dbo].[HEFPICountry]
GROUP BY Income_Group
 --------------------------------------------------------------------------

--Number of Coutries by Lending_category
SELECT Lending_category, COUNT(Short_Name) AS Num_of_Coutries
FROM [Project].[dbo].[HEFPICountry]
GROUP BY Lending_category
 --------------------------------------------------------------------------

--Which currency is mostly used across coutries ? 
SELECT Currency_Unit, COUNT(Short_Name) AS Number_of_Coutries
FROM [Project].[dbo].[HEFPICountry]
GROUP BY Currency_Unit
ORDER BY Number_of_Coutries DESC
 --------------------------------------------------------------------------

-- Income_Groups by Region 
SELECT  DISTINCT(Region),
(
SELECT COUNT(*) AS High_income_Coutries 
FROM [Project].[dbo].[HEFPICountry] innert
WHERE innert.Income_Group = 'High income'
AND innert.Region =outerb.Region
) AS   High_income_Coutries,
(
SELECT COUNT(*) AS Middle_income_Coutries
FROM [Project].[dbo].[HEFPICountry] innera
WHERE innera.Income_Group = 'Upper middle income'
AND innera.Region = outerb.Region
) AS  Middle_income_Coutries,
(
SELECT COUNT(*) AS Lower_mid_inc_Coutries
FROM [Project].[dbo].[HEFPICountry] innerc
WHERE innerc.Income_Group = 'Lower middle income'
AND innerc.Region = outerb.Region
) AS Lower_mid_inc_Coutries,
(
SELECT COUNT(*) AS Low_income_Coutries
FROM [Project].[dbo].[HEFPICountry] innerd
WHERE innerd.Income_Group = 'Low income'
AND innerd.Region = outerb.Region
) AS Low_income_Coutries
FROM [Project].[dbo].[HEFPICountry] outerb
GROUP BY Region
 --------------------------------------------------------------------------

 -- Number System_of_trade by each continent
SELECT DISTINCT(System_of_trade),
(
SELECT COUNT(*) AS East_Asia_and_Pacific 
FROM [Project].[dbo].[HEFPICountry] innert
WHERE innert.Region = 'East Asia & Pacific'
AND innert.System_of_trade =outerb.System_of_trade
) AS East_Asia_and_Pacific,
(
SELECT COUNT(*) AS Europe_and_Central_Asia
FROM [Project].[dbo].[HEFPICountry] innera
WHERE innera.Region = 'Europe & Central Asia'
AND innera.System_of_trade = outerb.System_of_trade
) AS  Europe_and_Central_Asian,
(
SELECT COUNT(*) AS Latin_America_and_Caribbean
FROM [Project].[dbo].[HEFPICountry] innerc
WHERE innerc.Region = 'Latin America & Caribbean'
AND innerc.System_of_trade = outerb.System_of_trade
) AS Latin_America_and_Caribbean,
(
SELECT COUNT(*) AS Mid_East_and_North_Africa
FROM [Project].[dbo].[HEFPICountry] innerd
WHERE innerd.Region = 'Middle East & North Africa'
AND innerd.System_of_trade = outerb.System_of_trade
) AS Mid_East_and_North_Africa,
(
SELECT COUNT(*) AS North_America
FROM [Project].[dbo].[HEFPICountry] innerd
WHERE innerd.Region = 'North America'
AND innerd.System_of_trade = outerb.System_of_trade
) AS North_America,
(
SELECT COUNT(*) AS South_Asia
FROM [Project].[dbo].[HEFPICountry] innerd
WHERE innerd.Region = 'South Asia'
AND innerd.System_of_trade = outerb.System_of_trade
) AS South_Asia,
(
SELECT COUNT(*) AS Sub_Saharan_Africa
FROM [Project].[dbo].[HEFPICountry] innerd
WHERE innerd.Region = 'Sub-Saharan Africa'
AND innerd.System_of_trade = outerb.System_of_trade
) AS Sub_Saharan_Africa
FROM [Project].[dbo].[HEFPICountry] outerb
GROUP BY System_of_trade
--------------------------------------------------------------------------

--Comparisson of Trade_System ( wich system has more coutries with high, upper middle, lower middle and low incomes)
SELECT  DISTINCT(System_of_trade),
(
SELECT COUNT(*) AS High_income_Coutries 
FROM [Project].[dbo].[HEFPICountry] innert
WHERE innert.Income_Group = 'High income'
AND innert.System_of_trade =outerb.System_of_trade
) AS   High_income_Coutries,
(
SELECT COUNT(*) AS Middle_income_Coutries
FROM [Project].[dbo].[HEFPICountry] innera
WHERE innera.Income_Group = 'Upper middle income'
AND innera.System_of_trade = outerb.System_of_trade
) AS  Middle_income_Coutries,
(
SELECT COUNT(*) AS Lower_mid_inc_Coutries
FROM [Project].[dbo].[HEFPICountry] innerc
WHERE innerc.Income_Group = 'Lower middle income'
AND innerc.System_of_trade = outerb.System_of_trade
) AS Lower_mid_inc_Coutries,
(
SELECT COUNT(*) AS Low_income_Coutries
FROM [Project].[dbo].[HEFPICountry] innerd
WHERE innerd.Income_Group = 'Low income'
AND innerd.System_of_trade = outerb.System_of_trade
) AS Low_income_Coutries
FROM [Project].[dbo].[HEFPICountry] outerb
GROUP BY System_of_trade
--------------------------------------------------------------------------
 




