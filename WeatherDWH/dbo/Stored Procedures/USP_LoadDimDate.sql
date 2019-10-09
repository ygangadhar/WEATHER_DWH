


CREATE PROCEDURE [dbo].[USP_LoadDimDate] (@Startdate date, @EndDate date)
AS

SET NOCOUNT ON

TRUNCATE TABLE [DIM].[DATE]

WHILE @Startdate <= @endDate
BEGIN
INSERT INTO [DIM].[DATE]
SELECT 
 DateSK = CAST(CONVERT(NVARCHAR(8),@Startdate, 112) AS INT)
,DateNK = @Startdate
,DateLabel = CONVERT(nvarchar(8), @startdate, 112)
,YearKey = YEAR(@startdate) 
,QuarterKey = DATEPART(QQ,@Startdate)
,YearQuarterLabel = CAST(YEAR(@startdate) as nvarchar(4))+' Q' + CAST(DATEPART(QQ,@Startdate) as nvarchar(2))
,MonthKey = MONTH(@Startdate)
,MonthLabel = DATENAME(MM,@Startdate)
,YearMonthKey = CAST(YEAR(@startdate) as nvarchar(4))+' '+LEFT(CONCAT('0',CAST(MONTH(@StartDate) as nvarchar(2))),2)
,YearMonthLabel  =  CAST(YEAR(@startdate) as nvarchar(4))+' '+DATENAME(MM,@Startdate)
,WeekofYearKey = DATEPART(wk, @Startdate)
,DayofYearKey = DATENAME(DY,@Startdate)
,DayofMonthKey = DAY(@Startdate)
,DayofWeekKey = DATEPART(DW,@Startdate) 

Set @Startdate = DATEADD(DD,1,@Startdate)

END

IF NOT EXISTS (SELECT * FROM [DIM].[DATE] WHERE DATESK = -1)
INSERT INTO [DIM].[DATE] 
       ( [DateSK]
        ,[DateNK]
        ,[DateLabel]
        ,[YearKey]
        ,[QuarterKey]
        ,[YearQuarterLabel]
        ,[MonthKey]
        ,[MonthLabel]
        ,[YearMothnKey]
        ,[YearMonthLabel]
        ,[WeekofYearKey]
        ,[DayofYearKey]
        ,[DayofMonthKey]
        ,[DayofWeekKey]) VALUES
		(-1
		 ,'19000101'
		 ,'Unknown'
		 ,1900
		 ,00
		 ,'Unknown'
		 ,00
		 ,'Unknown'
		 ,'Unknown'
		 ,'Unknown' 
		 ,00
		 ,00
		 ,00
		 ,00)


--EXEC [dbo].[USP_LoadDimDate] '19500101','20251231'

