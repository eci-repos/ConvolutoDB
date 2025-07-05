-- Find activities that match location characteristics
DECLARE @locationConcept VECTOR(768) = 
   AI_GENERATE_EMBEDDINGS(
      'historic landmark with scenic views' USE MODEL ollama);
DECLARE @activityConcept VECTOR(768) =
   AI_GENERATE_EMBEDDINGS('educational tour' USE MODEL ollama);

SELECT a.Name AS Activity,
       a.Description,
       l.Name AS Location,
      (vector_distance('cosine', @locationConcept, l.CombinedEmbedding) * 0.5 +
       vector_distance('cosine', @activityConcept, a.CombinedEmbedding) * 0.5) AS Relevance
  FROM Activity.Activity a
  JOIN Entity.Location l
    ON a.LocationNo = l.LocationNo
 ORDER BY Relevance;
