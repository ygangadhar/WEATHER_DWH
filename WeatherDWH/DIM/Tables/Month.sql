CREATE TABLE [DIM].[Month] (
    [MonthSK]          INT           IDENTITY (1, 1) NOT NULL,
    [MonthNK]          SMALLINT      NOT NULL,
    [MonthLabel]       NVARCHAR (2)  NULL,
    [MonthDescription] NVARCHAR (12) NULL,
    PRIMARY KEY CLUSTERED ([MonthSK] ASC)
);

