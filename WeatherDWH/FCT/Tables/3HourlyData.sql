CREATE TABLE [FCT].[3HourlyData] (
    [CitiSK]                INT            NOT NULL,
    [YearSK]                INT            NOT NULL,
    [MonthSK]               INT            NOT NULL,
    [DaySK]                 INT            NOT NULL,
    [HourSK]                INT            NOT NULL,
    [ForcastedTempDegC]     DECIMAL (5, 2) NULL,
    [ActualTempDegC]        DECIMAL (5, 2) NULL,
    [ForecastedMaxTempDegC] DECIMAL (5, 2) NULL,
    [ForecastedRainVol_mm]  DECIMAL (7, 3) NULL,
    [ActualRainVol_mm]      DECIMAL (7, 3) NULL,
    [ForecastedSunRise]     DATETIME       NULL,
    [ActualSunRise]         DATETIME       NULL,
    [ForecastedSunSet]      DATETIME       NULL,
    [ActualSunSet]          DATETIME       NULL
);

