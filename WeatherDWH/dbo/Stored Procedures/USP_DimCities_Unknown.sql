






CREATE PROCEDURE [dbo].[USP_DimCities_Unknown] 
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [DIM].[Cities] WHERE CitiSK =-1)
BEGIN SET IDENTITY_INSERT [DIM].[Cities] ON
INSERT INTO [DIM].[Cities] (
   [CitiSK]
  ,[CitiNK]
  ,[CitiName]
  ,[CountryCode]
  ,[Location]
  ,[ZIPCode]) VALUES
  (-1
  ,-1
  ,'Unknown'
  ,'NA'
  ,Geography::Point(0,0,4326)
  ,'Unknown')
SET IDENTITY_INSERT [DIM].[Cities] OFF
END
