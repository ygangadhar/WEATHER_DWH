





CREATE PROCEDURE [dbo].[USP_LoadDimHour]
AS

SET NOCOUNT ON

TRUNCATE TABLE [DIM].[Hour]

DECLARE @StartHour TINYINT = 00, @Endhour TINYINT =23

BEGIN
     IF NOT EXISTS (SELECT * FROM [DIM].[Hour] WHERE HourSK =-1)
     SET IDENTITY_INSERT [DIM].[Hour] ON
     INSERT INTO [DIM].[Hour]
        ([HourSK],[HourNK],[Hour12],[Hour24],[HourlyBucketKey],[HourlyBucketLabel])
          VALUES( -1,-1,'Unk','Unk','Unknown','Unknown')
      SET IDENTITY_INSERT [DIM].[Hour] OFF
END

WHILE @StartHour <= @Endhour
 BEGIN
      INSERT INTO [DIM].[Hour]
      SELECT 
              [HourNK] = @StartHour
             ,[Hour12] =  CASE 
                           WHEN @StartHour BETWEEN 0 AND 12 THEN CONCAT(CAST(@StartHour AS VARCHAR(2)),' AM')
	                       ELSE CONCAT(CAST(@StartHour AS VARCHAR(2)),' PM') END
             ,[Hour24] =  RIGHT(CONCAT('0',CAST (@StartHour AS nvarchar(2))),2)
             ,[HourlyBucketKey] = CASE 
                                      WHEN @StartHour BETWEEN 0 AND 2 THEN '00-02'
                                      WHEN @StartHour BETWEEN 3 AND 5 THEN '03-05'
                                      WHEN @StartHour BETWEEN 6 AND 8 THEN '06-08'
                                      WHEN @StartHour BETWEEN 9 AND 11 THEN '09-11'
                                      WHEN @StartHour BETWEEN 12 AND 14 THEN '12-14'
                                      WHEN @StartHour BETWEEN 15 AND 17 THEN '15-17'
                                      WHEN @StartHour BETWEEN 18 AND 20 THEN '18-20'
	                                  ELSE '21-23' END
            ,[HourlyBucketLabel] = CASE 
                                       WHEN @StartHour BETWEEN 0 AND 2 THEN '00-02 Hours Bucket'
                                       WHEN @StartHour BETWEEN 3 AND 5 THEN '03-05 Hours Bucket'
                                       WHEN @StartHour BETWEEN 6 AND 8 THEN '06-08 Hours Bucket'
                                       WHEN @StartHour BETWEEN 9 AND 11 THEN '09-11 Hours Bucket'
                                       WHEN @StartHour BETWEEN 12 AND 14 THEN '12-14 Hours Bucket'
                                       WHEN @StartHour BETWEEN 15 AND 17 THEN '15-17 Hours Bucket'
                                       WHEN @StartHour BETWEEN 18 AND 20 THEN '18-20 Hours Bucket'
	                                   ELSE '21-23 Hours Bucket' END
   
   SET @StartHour = @StartHour+1   

END

--EXEC [dbo].[USP_LoadDimHour] 
     
