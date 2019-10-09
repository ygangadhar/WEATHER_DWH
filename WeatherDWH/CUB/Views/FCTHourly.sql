
CREATE VIEW [CUB].[FCTHourly]
AS
SELECT [CitiSK]
      ,[YearSK]
      ,[MonthSK]
      ,[DaySK]
      ,[HourSK]
      ,[ForcastedTempDegC]
      ,[ActualTempDegC]
      ,[ForecastedMaxTempDegC]
      ,[ForecastedRainVol_mm]
      ,[ActualRainVol_mm]
      ,[ForecastedSunRise]
      ,[ActualSunRise]
      ,[ForecastedSunSet]
      ,[ActualSunSet]
  FROM [FCT].[3HourlyData]

