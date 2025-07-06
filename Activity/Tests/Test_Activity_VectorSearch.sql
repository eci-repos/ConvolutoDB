-- MODEL: ollama VECTOR(768)

-- Using the optimized VECTOR_SEARCH function use after 
-- creating a VECTOR INDEX

-- STEP 1. Use or Create a table specific for the model
-- DROP TABLE Activity.Activity_Embedding_Ollama
CREATE TABLE Activity.Activity_Embedding_Ollama (
   EmbeddingID     INT IDENTITY PRIMARY KEY,
   ActivityNo      INT NOT NULL,
   Embedding       VECTOR(768),
   UpdatedDateTime DATETIMEOFFSET,

   CONSTRAINT fk_ActivityEmbeddingOllama FOREIGN KEY (ActivityNo)
      REFERENCES Activity.Activity(ActivityNo)
)
GO

-- STEP 2. As needed Insert or Update the embeddings
DECLARE @dt DATETIMEOFFSET = getutcdate()
INSERT INTO Activity.Activity_Embedding_Ollama (
   ActivityNo, Embedding, UpdatedDateTime)
SELECT ActivityNo,
       cast(Embedding as vector(768)),
       @dt
  FROM Activity.Activity_Embedding
GO

-- DROP INDEX ix_Activity_EmbeddingOllama ON Activity.Activity_Embedding_Ollama
CREATE VECTOR INDEX ix_Activity_Combined ON Activity.Activity_Embedding_Ollama(Embedding)
  WITH (METRIC='cosine', TYPE='diskann');
GO

-- TEST VECTOR_SEARCH
DECLARE @value VECTOR(768) =
   AI_GENERATE_EMBEDDINGS('educational STEM activities for teens' USE MODEL ollama)

SELECT a.ActivityID,
       a.Name,
       a.Description,
       vs.distance
  FROM VECTOR_SEARCH (
       TABLE = Activity.Activity_Embedding_Ollama as s,
       COLUMN = Embedding,
       SIMILAR_TO = @value,
       METRIC = 'cosine',
       TOP_N = 10
     ) AS vs
  JOIN Activity.Activity a
    ON s.ActivityNo = a.ActivityNo
 WHERE a.StatusID = 'Active';
