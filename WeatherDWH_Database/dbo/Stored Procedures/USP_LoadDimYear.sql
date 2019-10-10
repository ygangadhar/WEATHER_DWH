/****** This SP is to Truncate and load [DIM].[Year] table ******/
/****** It can be executed by running EXEC [dbo].[USP_LoadDimYear] 1950,2025 ******/
/****** You can give Start Year and End year of your choice  ******/
/****** If there is any data for the years which are not present in this table, then it will be displayed as UNKNOWN in data model  ******/

CREATE PROCEDURE [dbo].[USP_LoadDimYear] (@StartYear INT, @EndYear INT)
AS

SET NOCOUNT ON

TRUNCATE TABLE [DIM].[Year]
BEGIN 
     IF NOT EXISTS (SELECT * FROM [DIM].[Year] WHERE YearSK =-1)
     SET IDENTITY_INSERT [DIM].[Year] ON
     INSERT INTO [DIM].[Year]
           ([YearSK],[YearNK],[YearLabel])
                VALUES( -1,-1,'Unk')
      SET IDENTITY_INSERT [DIM].[Year] OFF
END
WHILE @StartYear <= @EndYear
BEGIN
     INSERT INTO [DIM].[Year]
     SELECT 
          [YearNK] = @StartYear
         ,[YearLabel] =  CAST(@StartYear AS NVARCHAR(4))
         
      SET @StartYear = @StartYear+1   

END


