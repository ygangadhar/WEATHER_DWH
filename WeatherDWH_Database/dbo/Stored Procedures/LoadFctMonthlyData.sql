/****** This SP is to Truncate and load [FCT].[MonthlyData] table ******/
/****** Execute it by running EXEC [dbo].[LoadFctMonthlyData] ******/

CREATE PROCEDURE [dbo].[LoadFctMonthlyData]
AS
BEGIN

TRUNCATE TABLE [FCT].[MonthlyData]

INSERT INTO [FCT].[MonthlyData]
   SELECT ISNULL(DC.[CitiSK],-1) AS CitiSK
         ,ISNULL(DY.[YearSK],-1) AS YearSK
         ,ISNULL(DM.[MonthSK],-1) AS MonthSK
         ,CASE TMAX 
   	        WHEN 'NA' THEN CAST(0 AS decimal)
   			ELSE CAST(TMAX AS DECIMAL(5,2))
   	      END AS TempMax_DegC
   	     ,CASE TMIN 
   	        WHEN 'NA' THEN CAST(0 AS decimal)
   			ELSE CAST(TMIN AS DECIMAL(5,2))
   	     END AS TempMin_DegC
   	    ,CASE [RainFall] 
   	        WHEN 'NA' THEN CAST(0 AS decimal)
   			ELSE CAST([RainFall] AS DECIMAL(5,2))
   	    END AS RainFall_mm
   FROM [Staging].[HistoricalData] HD
   LEFT JOIN [Dim].[Cities] DC ON HD.CitiNK =  DC.CitiNK
   LEFT JOIN [Dim].[Year] DY ON HD.[Year] = DY.YearNK
   LEFT JOIN [Dim].[Month] DM ON HD.[Month] = DM.MonthNK

END
