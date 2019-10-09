CREATE TABLE [DIM].[Cities] (
    [CitiSK]       INT               IDENTITY (1, 1) NOT NULL,
    [CitiNK]       INT               NOT NULL,
    [CitiName]     NVARCHAR (60)     NOT NULL,
    [CountryCode]  NVARCHAR (4)      NULL,
    [Location]     [sys].[geography] NULL,
    [ZIPCode]      NVARCHAR (10)     NULL,
    [IsDeleted]    BIT               DEFAULT ((0)) NULL,
    [InsertedDate] DATE              DEFAULT (getdate()) NULL
);

