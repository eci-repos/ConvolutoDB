-- MODEL: ollama VECTOR(768)

-- DROP PROCEDURE [Entity].[Location_Embedding_Update]
CREATE PROCEDURE [Entity].[Location_Embedding_Update]
   @CutOffDate DATETIMEOFFSET = null
AS
BEGIN
   SET NOCOUNT ON
   DECLARE @dt DATETIMEOFFSET = getutcdate()
   INSERT INTO Entity.Location_Embedding (
      LocationNo,
      ChunkText,
      Embedding,
      UpdatedDateTime
   )
   SELECT x.LocationNo,
          x.Name + ' - ' + x.Description,
          AI_GENERATE_EMBEDDINGS(x.Name + ' - ' + x.Description
             USE MODEL ollama),
          @dt
     FROM Entity.Location x
    WHERE x.LocationNo not in (
   SELECT LocationNo
     FROM Entity.Location_Embedding
      )

   UPDATE x
      SET x.Embedding =
             AI_GENERATE_EMBEDDINGS(l.Name + ' - ' + l.Description
                USE MODEL ollama)
     FROM Entity.Location_Embedding x
     JOIN Entity.Location l
       ON l.LocationNo = x.LocationNo
    WHERE @CutOffDate is not null
      AND x.UpdatedDateTime > @CutOffDate
END
GO

/*
-- test
SELECT * FROM Entity.Location_Embedding WHERE CombinedEmbedding is null
EXEC [Entity].[Location_Embedding_Update]
 */
