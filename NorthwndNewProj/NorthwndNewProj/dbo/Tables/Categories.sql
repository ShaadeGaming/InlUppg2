CREATE TABLE [dbo].[Categories] (
    [CategoryID]   INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (15) NOT NULL,
    [Description]  NTEXT         NULL,
    [Picture]      IMAGE         NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CategoryName]
    ON [dbo].[Categories]([CategoryName] ASC);


GO
-- =============================================
-- Author:		Robin
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER CategoryUpdateTrigger 
   ON  Categories 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO CategoryChanges(CategoryID,OldCategoryName,NewCategoryName)
	select i.CategoryID, d.CategoryName, i.CategoryName
	from inserted i
	inner join deleted d on i.CategoryID= d.CategoryID
END
