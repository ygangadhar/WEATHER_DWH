﻿CREATE TABLE [Staging].[Forecast_3h] (
    [CityID]               INT            NULL,
    [CityName]             NVARCHAR (60)  NULL,
    [Latitude]             NVARCHAR (16)  NULL,
    [Longitude]            NVARCHAR (16)  NULL,
    [CountryCode]          NVARCHAR (2)   NULL,
    [TimeZone]             NVARCHAR (16)  NULL,
    [SunRiseTime]          INT            NULL,
    [SunSetTime]           INT            NULL,
    [Code]                 INT            NULL,
    [Message]              NVARCHAR (100) NULL,
    [Cnt]                  INT            NULL,
    [Temperature]          DECIMAL (5, 2) NULL,
    [Temp_Min]             DECIMAL (5, 2) NULL,
    [Temp_Max]             DECIMAL (5, 2) NULL,
    [Pressure]             INT            NULL,
    [SeaLevel]             DECIMAL (7, 2) NULL,
    [GroundLevel]          NVARCHAR (10)  NULL,
    [Humidity]             SMALLINT       NULL,
    [Temp_KF]              DECIMAL (5, 2) NULL,
    [WeatherID]            INT            NULL,
    [WeatherMain]          NVARCHAR (60)  NULL,
    [WeatherDesc]          NVARCHAR (100) NULL,
    [WeatherIcon]          NVARCHAR (10)  NULL,
    [Cloudniess]           SMALLINT       NULL,
    [WindSpeed]            DECIMAL (5, 2) NULL,
    [WindDeg]              DECIMAL (6, 3) NULL,
    [SysPod]               NVARCHAR (10)  NULL,
    [Rain_Vol_3H]          NVARCHAR (10)  NULL,
    [Calculated_DateTime]  DATETIME       NULL,
    [TimeofDataForecasted] INT            NULL,
    [InsertedTimeStamp]    DATETIME       DEFAULT (getdate()) NULL
);
