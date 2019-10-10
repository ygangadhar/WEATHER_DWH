/****** This SP is to Truncate and load [DIM].[Month] table ******/
/****** It can be executed by running EXEC [dbo].[USP_LoadDimMonth] ******/

CREATE PROCEDURE [dbo].[USP_LoadDimMonth]
AS

SET NOCOUNT ON

TRUNCATE TABLE [DIM].[Month]

BEGIN
      IF NOT EXISTS (SELECT * FROM [DIM].[Month] WHERE MonthSK = -1)
      SET IDENTITY_INSERT [DIM].[Month] ON
      
      INSERT INTO [DIM].[Month] 
        ([MonthSK],[MonthNK],[MonthLabel],[MonthDescription]) 
          VALUES (-1,-1,'-1','Unknown')
      
      SET IDENTITY_INSERT [DIM].[Month] OFF
END

DECLARE @FirstMonth TINYINT = 1, @LastMonth TINYINT =12

WHILE @FirstMonth <= @LastMonth
 BEGIN
      INSERT INTO [DIM].[Month]
      SELECT 
             [MonthNK] = @FirstMonth
            ,[MonthLabel] =  RIGHT(CONCAT('0',CAST(@FirstMonth as nvarchar(2))),2)
            ,[MonthDescription] =  CASE @FirstMonth
                                        WHEN 1 THEN 'January'
                                        WHEN 2 THEN 'February'
							            WHEN 3 THEN 'March'
							            WHEN 4 THEN 'April'
							            WHEN 5 THEN 'May'
							            WHEN 6 THEN 'June'
							            WHEN 7 THEN 'July'
							            WHEN 8 THEN 'August'
							            WHEN 9 THEN 'September'
							            WHEN 10 THEN 'October'
							            WHEN 11 THEN 'November'
	                                    ELSE 'December' END
   
   SET @FirstMonth = @FirstMonth+1 
 
 END    

