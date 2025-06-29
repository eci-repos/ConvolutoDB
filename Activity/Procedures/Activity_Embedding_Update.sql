-- DROP PROCEDURE [Activity].[Activity_Embedding_Update]
CREATE PROCEDURE [Activity].[Activity_Embedding_Update]
   @CutOffDate DATETIMEOFFSET = null
AS
BEGIN
   SET NOCOUNT ON
   DECLARE @dt DATETIMEOFFSET = getutcdate()
   UPDATE x
      SET x.CombinedEmbedding = AI_GENERATE_EMBEDDINGS(v.TextChunk USE MODEL ollama),
          x.UpdatedDateTime = @dt
   -- DECLARE @CutOffDate DATETIMEOFFSET = null; SELECT *
     FROM Activity.Activity x
     JOIN Activity.Activity_Text_Chunk_View v
       ON x.ActivityNo = v.ActivityNo
      AND (x.CombinedEmbedding is null
       OR (@CutOffDate is not null
      AND  x.UpdatedDateTime > @CutOffDate))
END
GO

/*
-- test
SELECT * FROM Activity.Activity WHERE CombinedEmbedding is null
EXEC [Activity].[Activity_Embedding_Update]
 */