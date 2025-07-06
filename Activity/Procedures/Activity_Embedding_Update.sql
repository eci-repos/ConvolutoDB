-- MODEL: ollama VECTOR(768)

-- DROP PROCEDURE [Activity].[Activity_Embedding_Update];
CREATE PROCEDURE [Activity].[Activity_Embedding_Update]
   @CutOffDate DATETIMEOFFSET = null
AS
BEGIN
   SET NOCOUNT ON
   DECLARE @dt DATETIMEOFFSET = getutcdate()

   INSERT INTO Activity.Activity_Embedding (
      ActivityNo,
      ChunkText,
      Embedding,
      UpdatedDateTime
   )
   SELECT x.ActivityNo,
          v.ChunkText,
          AI_GENERATE_EMBEDDINGS(v.ChunkText
             USE MODEL ollama),
          @dt
     FROM Activity.Activity x
     JOIN Activity.Activity_Text_Chunk_View v
       ON x.ActivityNo = v.ActivityNo
      AND x.ActivityNo not in (
   SELECT ActivityNo
     FROM Activity.Activity_Embedding
      )

   UPDATE x
      SET x.Embedding =
             AI_GENERATE_EMBEDDINGS(x.ChunkText 
                USE MODEL ollama)
     FROM Activity.Activity_Embedding x
     JOIN Activity.Activity a
       ON a.ActivityNo = x.ActivityNo
    WHERE @CutOffDate is not null
      AND x.UpdatedDateTime > @CutOffDate
END
GO

/*
-- test
SELECT * FROM Activity.Activity_Embedding WHERE Embedding is null
EXEC [Activity].[Activity_Embedding_Update]
 */