



CREATE PROCEDURE [dbo].[LoadFct3HourlyData]
AS
BEGIN
     SET NOCOUNT ON
     TRUNCATE TABLE [FCT].[3HourlyData]
     
	 INSERT INTO [FCT].[3HourlyData]
     SELECT  ISNULL(CTY.CitiSK,-1) AS CitiSK
	        ,ISNULL(YER.YearSK,-1) AS YearSK
            ,ISNULL(MNT.MonthSK,-1) AS MonthSK 
            ,ISNULL(DAT.DaySK,-1) AS DateSK
	        ,ISNULL(HOR.HourSK,-1) AS HourSK
	        ,F3H.[Temperature] AS ForecastedTempDecC
	        ,CUR.[TempInC] AS ActualTempDegC
            ,F3H.[Temp_Max] AS ForecastedMaxTempDecC
	        ,ISNULL(CAST(F3H.[Rain_Vol_3H] as decimal(5,2)),0) AS ForecastedRain_mm
	        ,CASE WHEN CUR.[Rain3H] IS NULL AND CONCAT(YER.YearLabel,MNT.MonthLabel,DAT.DayLabel,HOR.Hour24) <= CONVERT(NVARCHAR(8),GETDATE(),112)+LEFT(CONVERT(NVARCHAR(20),GETDATE(),114),2) THEN 0
		         ELSE CAST(CUR.[Rain3H] AS DECIMAL(5,2)) END AS ActualRain_mm 
            ,DATEADD(SS,F3H.[SunRiseTime],'19700101 00:00:00:000') AS ForecastedSunRise
	        ,DATEADD(SS,CUR.[Sunrise],'19700101 00:00:00:000') AS ActualSunRise
            ,DATEADD(SS,F3H.[SunSetTime], '19700101 00:00:00:000') AS ForecastedSunSet
            ,DATEADD(SS,CUR.[Sunset],'19700101 00:00:00:000') AS ActualSunSet
    FROM [Staging].[Forecast_3h] F3H
    LEFT JOIN [Staging].[CurrentData] CUR ON F3H.CityID = CUR.CityID AND CONVERT(NVARCHAR(8),DATEADD(SS,F3H.[TimeofDataForecasted],'19700101 00:00:00:000'),112) 
                                                                +LEFT(CONVERT(NVARCHAR(8),DATEADD(SS,F3H.[TimeofDataForecasted],'19700101 00:00:00:000'),114),2) =
                                                                CONVERT(NVARCHAR(8),DATEADD(SS,CUR.[CalulatedDateTime],'19700101 00:00:00:000'),112) 
                                                                +LEFT(CONVERT(NVARCHAR(8),DATEADD(SS,CUR.[CalulatedDateTime],'19700101 00:00:00:000'),114),2)
    LEFT JOIN [DIM].[Cities] CTY  ON F3H.CityID = CTY.CitiNK 
	LEFT JOIN [Dim].[Year] YER ON DATEPART(YY,DATEADD(SS,F3H.[TimeofDataForecasted],'19700101 00:00:00:000')) = YER.YearNK
    LEFT JOIN [DIM].[MONTH] MNT ON DATEPART(MM,DATEADD(SS,F3H.[TimeofDataForecasted],'19700101 00:00:00:000')) = MNT.MonthNK
    LEFT JOIN [DIM].[Day] DAT ON DATEPART(DD,DATEADD(SS,F3H.[TimeofDataForecasted],'19700101 00:00:00:000')) = DAT.DayNK
    LEFT JOIN [DIM].[Hour] HOR ON LEFT(CONVERT(NVARCHAR(8),DATEADD(SS,F3H.[TimeofDataForecasted],'19700101 00:00:00:000'),114),2) = HOR.Hour24

--EXEC [dbo].[LoadFct3HourlyData]

END
