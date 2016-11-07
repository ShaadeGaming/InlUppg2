CREATE TABLE [dbo].[CategoryChanges] (
    [CategoryChangeID] INT        IDENTITY (1, 1) NOT NULL,
    [CategoryID]       INT        NOT NULL,
    [OldCategoryName]  NCHAR (15) NOT NULL,
    [NewCategoryName]  NCHAR (15) NOT NULL,
    CONSTRAINT [PK_CategoryChanges] PRIMARY KEY CLUSTERED ([CategoryChangeID] ASC)
);

