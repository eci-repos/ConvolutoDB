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

-- Find family-friendly cooking activities under $50 near a location
-- ollama vector size is 768 (768 agnostic size)
DECLARE @locationEmbedding VECTOR(768) = 
   AI_GENERATE_EMBEDDINGS('Central Park New York' USE MODEL ollama)
DECLARE @activityEmbedding VECTOR(768) =
   AI_GENERATE_EMBEDDINGS(N'family cooking class' USE MODEL ollama)

SELECT a.ActivityNo,
       a.Name,
       a.Description,
       a.Price,
       l.Name AS LocationName,
       (vector_distance('cosine', @locationEmbedding, l.CombinedEmbedding) * 0.4 +
        vector_distance('cosine', @activityEmbedding, 
           a.CombinedEmbedding) * 0.6) AS RelevanceScore
  FROM Activity.Activity a
  JOIN Entity.Location l 
    ON a.LocationNo = l.LocationNo
 WHERE a.StatusID = 'Active'
   AND a.Price < 50
   AND a.AgeGroupID IN ('All Ages', 'Family')
 ORDER BY RelevanceScore DESC;



