﻿
CREATE VIEW [CUB].[DimDate]
AS
SELECT [DateSK]
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
      ,[DayofWeekKey]
  FROM [DIM].[Date]
