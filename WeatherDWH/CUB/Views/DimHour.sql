CREATE VIEW [CUB].[DimHour]
AS
SELECT [HourSK]
      ,[HourNK]
      ,[Hour12]
      ,[Hour24]
      ,[HourlyBucketKey]
      ,[HourlyBucketLabel]
  FROM [WeatherDWH].[DIM].[Hour]
