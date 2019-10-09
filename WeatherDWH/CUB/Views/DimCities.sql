
CREATE VIEW [CUB].[DimCities]
AS
SELECT [CitiSK]
      ,[CitiNK]
      ,[CitiName]
      ,[CountryCode]
      ,[Location].Lat as Latitude
	  ,[Location].Long as Longitude
      ,[ZIPCode]
      ,[IsDeleted]
      ,[InsertedDate]
  FROM [DIM].[Cities]
  WHERE IsDeleted = 0
