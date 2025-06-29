-- DROP PROCEDURE [Entity].[Location_Embedding_Update]
CREATE PROCEDURE [Entity].[Location_Embedding_Update]
AS
BEGIN
   SET NOCOUNT ON
   UPDATE Location
      SET CombinedEmbedding = AI_GENERATE_EMBEDDINGS(
             Name + ' ' + Description USE MODEL ollama)
    WHERE CombinedEmbedding is null
END
GO

/*
-- test
SELECT * FROM Entity.Location WHERE CombinedEmbedding is null
EXEC [Entity].[Location_Embedding_Update]
 */