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
