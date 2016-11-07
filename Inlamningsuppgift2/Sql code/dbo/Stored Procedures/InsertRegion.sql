Create procedure InsertRegion(@RegionID int, @RegionDesc nchar(50))
as

INSERT INTO [dbo].[Region]
           ([RegionID]
           ,[RegionDescription])
     VALUES
           (@RegionID
           ,@RegionDesc)
