CREATE TABLE [FCT].[MonthlyData] (
    [CitiSK]       INT            NOT NULL,
    [YearSK]       INT            NOT NULL,
    [MonthSK]      INT            NOT NULL,
    [TempMax_DegC] DECIMAL (5, 2) NULL,
    [TempMin_DegC] DECIMAL (5, 2) NULL,
    [RainFall_mm]  DECIMAL (7, 3) NULL
);

