CREATE TABLE [DIM].[Year] (
    [YearSK]    INT          IDENTITY (1, 1) NOT NULL,
    [YearNK]    INT          NOT NULL,
    [YearLabel] NVARCHAR (4) NULL,
    PRIMARY KEY CLUSTERED ([YearSK] ASC)
);

