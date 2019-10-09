

CREATE VIEW [CUB].[DimMonth]
AS
SELECT  [MonthSK]
      ,[MonthNK]
      ,[MonthLabel]
      ,[MonthDescription]
  FROM [DIM].[Month]
