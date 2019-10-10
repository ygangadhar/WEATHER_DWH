

CREATE VIEW [CUB].[FCTMonthlyHistorical]
AS
SELECT [CitiSK]
      ,[YearSK]
      ,[MonthSK]
      ,[TempMax_DegC] AS [Temperature Max(C)] 
      ,[TempMin_DegC] AS [Temperature Min (C)] 
      ,[RainFall_mm]  AS [Rainfall(mm)]
  FROM [FCT].[MonthlyData]
