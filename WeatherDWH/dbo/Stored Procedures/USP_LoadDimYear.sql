
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

--EXEC [dbo].[USP_LoadDimYear] 1950,2025

