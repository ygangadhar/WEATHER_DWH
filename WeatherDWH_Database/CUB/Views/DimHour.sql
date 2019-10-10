

CREATE VIEW [CUB].[DimHour]
AS
SELECT [HourSK]
      ,[HourNK] AS [Hour of Day]
      ,[Hour12] AS [Hour of Day 12]
	  ,[Hour24] AS [Hour of Day Label]
      ,[HourlyBucketKey] AS [Hourly Bucket Key]
      ,[HourlyBucketLabel] AS [Hourly Bucket Label]
  FROM [WeatherDWH].[DIM].[Hour]
