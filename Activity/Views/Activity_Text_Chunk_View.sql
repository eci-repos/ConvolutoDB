-- DROP VIEW [Activity].[Activity_Text_Chunk_View]
CREATE VIEW [Activity].[Activity_Text_Chunk_View] AS
SELECT ActivityNo,
       'activity name (' + a.Name + ')' +
       ' described as (' + a.Description + ')' +
       ' with Type (' + a.TypeID + ')' +
       ' for Age Group (' + a.AgeGroupID + ')' +
       ' with Price Range (' + a.PriceRangeID + ')' +
       ' with Dificulty (' + a.DificultyID + ')' +
       ' with Rating (' + cast(a.Rating as varchar) + ') ' +
       ' with Scheduled Duration of (' + isnull(cast(a.ScheduledDuration as varchar),'1 hour') ChunkText,
       a.StatusID,
       a.StatusDate,
       a.RatingDate,
       a.UpdatedDateTime
  FROM Activity.Activity a
GO

