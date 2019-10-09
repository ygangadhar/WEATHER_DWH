
CREATE VIEW [CUB].[FCTMonthly]
AS
SELECT [CitiSK]
      ,[YearSK]
      ,[MonthSK]
      ,[TempMax_DegC]
      ,[TempMin_DegC]
      ,[RainFall_mm]
  FROM [FCT].[MonthlyData]
