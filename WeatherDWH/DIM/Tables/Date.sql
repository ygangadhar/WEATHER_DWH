CREATE TABLE [DIM].[Date] (
    [DateSK]           INT           NOT NULL,
    [DateNK]           DATE          NOT NULL,
    [DateLabel]        NVARCHAR (8)  NULL,
    [YearKey]          SMALLINT      NULL,
    [QuarterKey]       NVARCHAR (2)  NULL,
    [YearQuarterLabel] NVARCHAR (7)  NULL,
    [MonthKey]         TINYINT       NULL,
    [MonthLabel]       NVARCHAR (12) NULL,
    [YearMothnKey]     NVARCHAR (7)  NULL,
    [YearMonthLabel]   NVARCHAR (16) NULL,
    [WeekofYearKey]    INT           NULL,
    [DayofYearKey]     SMALLINT      NULL,
    [DayofMonthKey]    TINYINT       NULL,
    [DayofWeekKey]     TINYINT       NULL,
    PRIMARY KEY CLUSTERED ([DateSK] ASC)
);

