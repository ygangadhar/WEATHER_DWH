CREATE TABLE [DIM].[HistoricalWeather] (
    [HistoricDataSK]  INT           IDENTITY (1, 1) NOT NULL,
    [CitiNK]          INT           NULL,
    [Year]            INT           NULL,
    [Month]           INT           NULL,
    [Temp_Max]        NVARCHAR (50) NULL,
    [Temp_Min]        NVARCHAR (50) NULL,
    [AirFrostDays]    NVARCHAR (50) NULL,
    [RainFall]        NVARCHAR (50) NULL,
    [SunHours]        NVARCHAR (50) NULL,
    [AuditInsertDate] DATE          DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([HistoricDataSK] ASC)
);

