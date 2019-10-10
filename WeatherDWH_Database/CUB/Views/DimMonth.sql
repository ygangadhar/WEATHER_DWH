



CREATE VIEW [CUB].[DimMonth]
AS
SELECT [MonthSK]
      ,[MonthNK] AS [Month]
      ,[MonthLabel] AS [Month Label]
      ,[MonthDescription] AS [Month Name]
  FROM [DIM].[Month]
