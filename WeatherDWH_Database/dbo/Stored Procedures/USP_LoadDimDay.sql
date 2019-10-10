/****** This SP is to Truncate and load [Dim].[Day] table ******/
/****** It can be executed by running EXEC [dbo].[USP_LoadDimDay] ******/

CREATE PROCEDURE [dbo].[USP_LoadDimDay]
AS

SET NOCOUNT ON

TRUNCATE TABLE [Dim].[Day]

BEGIN
      IF NOT EXISTS (SELECT * FROM [Dim].[Day] WHERE DaySK = -1)
      SET IDENTITY_INSERT [Dim].[Day] ON
      
      INSERT INTO [Dim].[Day] 
        (DaySK, DayNK, DayLabel) 
          VALUES (-1,-1,'Unk')
      
      SET IDENTITY_INSERT [Dim].[Day] OFF
END

DECLARE @FirstDay SMALLINT = 1, @LastDay SMALLINT =31

WHILE @FirstDay <= @LastDay
 BEGIN
      INSERT INTO [Dim].[Day]
      SELECT 
             [DayNK] = @FirstDay
            ,[DayLabel] =  RIGHT(CONCAT('0',CAST(@FirstDay as nvarchar(2))),2)
               
      SET @FirstDay = @FirstDay+1 
 
 END
     
 
