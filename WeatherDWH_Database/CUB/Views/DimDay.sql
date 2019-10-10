


CREATE VIEW [CUB].[DimDay]
AS
SELECT [DaySK]
      ,[DayNK] AS [Day of Month]
	  ,[DayLabel] AS [Day of Month Label]
  FROM [DIM].[Day]
