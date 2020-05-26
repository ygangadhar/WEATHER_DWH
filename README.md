# WEATHER_DWH (Code challenge for one of the position applied)

Implementation of Weather DWH

This BI solution captures historical, current and forecasted weather data for some meteorological stations as:

Capture historical forecast for meteorological stations (5 at least) listed on https://data.gov.uk/dataset/historic-monthly-meteorological-station-data

For the above meteorological stations, constantly ingest current weather and future forecasts data on http://openweathermap.org/

Then we need to consolidate weather data for the 5 selected stations above and prepare information for our BI Analysis:

Weather Measures of analysis are : Total rainfall in mm, Mean maximum temperature in degree Celsius

Weather Dimensions of analysis are : per month, per day (current & forecast data only) and per 3 hours intervals (current & forecast data only)

3 hourly data is expected to be kept for one week maximum and Daily data is expected to be kept for one month maximum

Data should be accessible by BI Analyst with a standard (ANSI) SQL

Data structure should be clear and easy (self-explanatory) to understand by a BI Analyst

Also, please bear in mind that it needs to be quite changeable in the future, as the Product Owner has big plans in this space!

We need to be able to connect to your DWH / BI view and reading data through MS SQL.

Details and Assumptions:
--------------------------

1) Selected 6 Stations for analysis are Aberporth, Bradford, Camborne,Durham, Eastbourne and Lerwick. All the Stations are in UK

2) You need SQL Server 2017 and Visual Studio 2017 version to manage the data model.

3) Historical data is extracted on 11th every month.

4) Current Weather and 5 Days/3Hour forecast data are extracted for every 3 hours (i.e. 00,03,06,09,12,15,18,21 Hours).

5) Per Day data and Per Month data are aggregates of data extracted. (Current Weather data API and 5 Day/3Hour Forecast API are     available for free on https://openweathermap.org/. So, the Data model based on those 2 API). 

6) Historical Data loaded from https://data.gov.uk is shown in the model as Historical Monthly data
   
7) All the values are in Metrics.

8) GitRepo has 3 Projects: Database, ETL Packages and Tabular Model 
	 
9) Data model used for this solution is Tabular Model. Data in this model can be analyzed by using Excel or Power BI or any reporting tools.


Instruction to deploy :
-------------------------

1) Publish database project in GitRepo to your SQL Server Instance.

2) Change the Project parameter 'ETLSeverName' value in the ETL Project to your server name and make sure the Project connection is pointing to your Database.

3) In case you wish to use your own API Key, replace Project parameter 'APIKey' value with your API Key. My API Key 'f82cd4526798221525146a5c6d0a16dc' works fine.

4) Load data to [DIM].[Cities] table executing the Stored Procedure [dbo].[USP_LoadDimCities]. See Stored Procedure script for the parameters you need to supply to execute SP, 6 Stations details are availble in SP script.
   If there is a requirement of analysing new Stations Weather data, Just insert Station details in [DIM].[Cities]table. Data for newly added station will be availabe for analysis from that point of time. 
    
5) Load [dbo].[Year] table by executing the stored procedure [dbo].[USP_LoadDimYear] with Start date and End Date as parameters. 

6) Load [DIM].[Month] table by executing the stored procedure [dbo].[USP_LoadDimMonth].

7) Load [DIM].[Day] table by executing the stored proceduredbo].[USP_LoadDimDay].
   
8) Load [DIM].[Hour] table by executing the stored procedure [dbo].[USP_LoadDimHour].

9) Deploy the ETL Project (or packages can be executed from your local SSDT/Visual studio). Run the packages HistoricalData.dtsx, CurrentData.dtsx  and ForecastData_3Hours to extract data to Staging tables.

10) Execute the stored procedure [dbo].[LoadFct3HourlyData] and [dbo].[LoadFctMonthlyData] to load data from Staging tables to [FCT].[3HourlyData] and [FCT].[MonthlyData].

11) Update the Data source to your database in the tabular model, Deploy it and process it. 

12) Data is now ready for analysis service.
    
