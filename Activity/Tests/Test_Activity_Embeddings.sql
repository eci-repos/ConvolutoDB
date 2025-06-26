
/*
SELECT * FROM Activity.Activity
 */

DECLARE @search_text NVARCHAR(4000) = 
   'are there any outdoorsy not hard activities for kids that they can practice a hobby?'
DECLARE @search_vector VECTOR(768) = AI_GENERATE_EMBEDDINGS(@search_text USE MODEL ollama);

SELECT TOP(4) 
       a.ActivityID,
       a.Name,
       a.Description,
       a.DificultyID,
       vector_distance('cosine', @search_vector, a.CombinedEmbedding) AS distance
  FROM Activity.Activity a
 ORDER BY distance;
 

SELECT @search_text =
   'are there any entertaining sporty not hard activities?'
SELECT @search_vector = AI_GENERATE_EMBEDDINGS(@search_text USE MODEL ollama);

SELECT TOP(4) 
       a.ActivityID,
       a.Name,
       a.Description,
       a.DificultyID,
       vector_distance('cosine', @search_vector, a.CombinedEmbedding) AS distance
  FROM Activity.Activity a
 ORDER BY distance;
