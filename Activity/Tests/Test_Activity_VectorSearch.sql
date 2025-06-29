-- Using the optimized VECTOR_SEARCH function use after 
-- creating a VECTOR INDEX

-- DROP INDEX ix_Activity_Combined ON Activity.Activity
CREATE VECTOR INDEX ix_Activity_Combined ON Activity.Activity(CombinedEmbedding)
  WITH (METRIC='cosine', TYPE='diskann');
GO

DECLARE @value VECTOR(768) =
   AI_GENERATE_EMBEDDINGS('educational STEM activities for teens' USE MODEL ollama)

SELECT a.ActivityID,
       a.Name,
       a.Description,
       vs.distance
  FROM VECTOR_SEARCH (
       TABLE = Activity.Activity as s,
       COLUMN = CombinedEmbedding,
       SIMILAR_TO = @value,
       METRIC = 'cosine',
       TOP_N = 10
     ) AS vs
  JOIN Activity.Activity a
    ON s.ActivityNo = a.ActivityNo
 WHERE a.StatusID = 'Active';
