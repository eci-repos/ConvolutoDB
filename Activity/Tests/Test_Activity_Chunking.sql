-- MODEL: ollama VECTOR(768)

-- Search within chunks
DECLARE @questionEmbedding VECTOR(768) = 
   AI_GENERATE_EMBEDDINGS('What safety measures are included?' USE MODEL ollama);

SELECT a.ActivityID,
       a.Name,
       c.ChunkText,
       vector_distance('cosine', @questionEmbedding, 
          cast(c.ChunkEmbedding as VECTOR(768))) AS Relevance
  FROM Activity.Activity a
  JOIN Activity.Activity_Chunk c 
    ON a.ActivityNo = c.ActivityNo
 WHERE vector_distance('cosine', @questionEmbedding,
          cast(c.ChunkEmbedding as VECTOR(768))) > 0.75
 ORDER BY Relevance DESC;

