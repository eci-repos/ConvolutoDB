-- DROP VIEW [Activity].[Activity_Text_Chunk_View]
CREATE VIEW [Activity].[Activity_Text_Chunk_View] AS
SELECT ActivityID,
       'activity name (' + Name + ')' +
       ' described as (' + Description + ')' +
       ' with Type (' + TypeID + ')' +
       ' for Age Group (' + AgeGroupID + ')' +
       ' with Price Range (' + PriceRangeID + ')' +
       ' with Dificulty (' + DificultyID + ')' +
       ' with Rating (' + cast(Rating as varchar) + ')' TextChunk,
       StatusID,
       StatusDate,
       RatingDate,
       UpdatedDateTime
  FROM Activity.Activity
GO

