







CREATE PROCEDURE [dbo].[USP_LoadDimCities] 
(@CitiID int, @CitiName nvarchar(60), @CountryCode nvarchar(2),@ZipCode nvarchar(10), @Latitude DECIMAL(8,4),@Longitude DECIMAL(8,4))
AS
SET NOCOUNT ON

EXEC [dbo].[USP_DimCities_Unknown] 

INSERT INTO [DIM].[Cities] (
   [CitiNK]
  ,[CitiName]
  ,[CountryCode]
  ,[ZIPCode]
  ,[Location]) VALUES
  (@CitiID
  ,@CitiName
  ,@CountryCode
  ,@ZipCode
  ,Geography::Point(@Latitude,@Longitude,4326))



/* Cities Used in the exercise to insert data to [DIM].[CITIES] */
--EXEC [dbo].[USP_LoadDimCities] 2657789,'Aberporth', 'GB',NULL,52.139,-4.570
--EXEC [dbo].[USP_LoadDimCities] 2654993,'Bradford', 'GB', NULL, 53.813,-1.772
--EXEC [dbo].[USP_LoadDimCities] 2653945,'Camborne', 'GB', NULL, 50.218,-5.327
--EXEC [dbo].[USP_LoadDimCities] 2650628,'Durham', 'GB', NULL, 54.768,-1.585
--EXEC [dbo].[USP_LoadDimCities] 2651513,'Eastbourne', 'GB', NULL, 50.762,0.285
--EXEC [dbo].[USP_LoadDimCities] 2644605,'Lerwick', 'GB', NULL, 60.1392,-1.183

