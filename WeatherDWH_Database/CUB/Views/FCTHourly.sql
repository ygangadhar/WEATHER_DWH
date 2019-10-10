


CREATE VIEW [CUB].[FCTHourly]
AS
SELECT [CitiSK]
      ,[YearSK]
      ,[MonthSK]
      ,[DaySK]
      ,[HourSK]
      ,[ForcastedTempDegC] AS [Forecasted Temperature(C)]
      ,[ActualTempDegC] AS [Actual Temperature(C)]
      ,[ForecastedMaxTempDegC] AS [Forecasted Max Temperature(C)]
      ,[ForecastedRainVol_mm] AS [Forecasted Rainfall(mm)]
      ,[ActualRainVol_mm] AS [Actual Rainfall(mm)]
  FROM [FCT].[3HourlyData]

