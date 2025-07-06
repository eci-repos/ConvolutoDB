-- MODEL: ollama VECTOR(768)

-- Find activities that match location characteristics
DECLARE @locationConcept VECTOR(768) = 
   AI_GENERATE_EMBEDDINGS(
      'historic landmark with scenic views' USE MODEL ollama);
DECLARE @activityConcept VECTOR(768) =
   AI_GENERATE_EMBEDDINGS('educational tour' USE MODEL ollama);

SELECT a.Name AS Activity,
       a.Description,
       l.Name AS Location,
      (vector_distance('cosine', @locationConcept, 
          cast(le.Embedding as vector(768))) * 0.5 +
       vector_distance('cosine', @activityConcept, 
          cast(ae.Embedding as vector(768))) * 0.5) AS Relevance
  FROM Activity.Activity a
  JOIN Activity.Activity_Embedding ae
    ON ae.ActivityNo = a.ActivityNo
  JOIN Entity.Location l 
    ON a.LocationNo = l.LocationNo
  JOIN Entity.Location_Embedding le
    ON le.LocationNo = l.LocationNo
 ORDER BY Relevance;
