CREATE TABLE [DIM].[Hour] (
    [HourSK]            INT           IDENTITY (1, 1) NOT NULL,
    [HourNK]            INT           NOT NULL,
    [Hour12]            NVARCHAR (6)  NULL,
    [Hour24]            NVARCHAR (3)  NULL,
    [HourlyBucketKey]   NVARCHAR (15) NOT NULL,
    [HourlyBucketLabel] NVARCHAR (24) NULL,
    PRIMARY KEY CLUSTERED ([HourSK] ASC)
);

