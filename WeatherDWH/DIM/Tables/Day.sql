CREATE TABLE [DIM].[Day] (
    [DaySK]    INT          IDENTITY (1, 1) NOT NULL,
    [DayNK]    INT          NOT NULL,
    [DayLabel] NVARCHAR (3) NULL,
    PRIMARY KEY CLUSTERED ([DaySK] ASC)
);

