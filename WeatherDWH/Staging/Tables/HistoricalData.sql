CREATE TABLE [Staging].[HistoricalData] (
    [CitiSK]           INT           NOT NULL,
    [CitiNK]           INT           NULL,
    [CitiName]         NVARCHAR (60) NULL,
    [Year]             INT           NULL,
    [Month]            INT           NULL,
    [TMax]             NVARCHAR (50) NULL,
    [TMin]             NVARCHAR (50) NULL,
    [AFDays]           NVARCHAR (50) NULL,
    [RainFall]         NVARCHAR (50) NULL,
    [SunHours]         NVARCHAR (50) NULL,
    [CreatedTimeStamp] DATETIME      DEFAULT (getdate()) NULL
);

