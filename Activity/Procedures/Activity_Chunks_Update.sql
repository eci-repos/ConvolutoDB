-- DROP PROCEDURE [Activity].[Activity_Chunks_Update]
CREATE PROCEDURE [Activity].[Activity_Chunks_Update]
   @CutOffDate DATETIMEOFFSET = null
AS
BEGIN
   SET NOCOUNT ON
   DECLARE @dt DATETIMEOFFSET = getutcdate()
   UPDATE x
      SET x.DescriptionChunk = v.TextChunk,
          x.UpdatedDateTime = @dt
   -- DECLARE @CutOffDate DATETIMEOFFSET = null; SELECT *
     FROM Activity.Activity x
     JOIN Activity.Activity_Text_Chunk_View v
       ON x.ActivityNo = v.ActivityNo
      AND (x.DescriptionChunk is null
       OR (@CutOffDate is not null
      AND  x.UpdatedDateTime > @CutOffDate))

   INSERT INTO Activity.ActivityChunk (
      ActivityNo, ChunkNumber, ChunkText, ChunkEmbedding)
   SELECT a.ActivityNo,
          c.chunk_order,
          c.chunk,
          cast(AI_GENERATE_EMBEDDINGS(c.chunk USE MODEL ollama) as VARCHAR(MAX))
     FROM Activity.Activity a
    CROSS APPLY 
       AI_GENERATE_CHUNKS(
          source = a.DescriptionChunk,
          chunk_type = FIXED,
          chunk_size = 500,
          overlap = 5,
          enable_chunk_set_id = 1) c
END
GO

/*
-- test
SELECT * FROM Activity.Activity WHERE DescriptionChunk is null
EXEC [Activity].[Activity_Chunks_Update]
SELECT * FROM Activity.ActivityChunk
 */
