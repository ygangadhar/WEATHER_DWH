
CREATE VIEW [CUB].[DimYear]
AS
SELECT [YearSK]
      ,[YearNK] AS [Year]
      ,[YearLabel] AS [Year Label]
  FROM [DIM].[Year]
