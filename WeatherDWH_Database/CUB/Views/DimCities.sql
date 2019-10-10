

CREATE VIEW [CUB].[DimCities]
AS
SELECT [CitiSK]
      ,[CitiNK] AS [Citi ID]
      ,[CitiName] AS [Citi Name]
      ,[CountryCode] AS [Country Code]
      ,[Location].Lat as Latitude
	  ,[Location].Long as Longitude
      ,[ZIPCode]
      ,[InsertedDate]
  FROM [DIM].[Cities]
  WHERE IsDeleted = 0
