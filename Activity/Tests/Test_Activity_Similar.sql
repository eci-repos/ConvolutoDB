-- MODEL: ollama VECTOR(768)

-- Find similar activities to a specific one
-- SELECT * FROM Activity.Activity
DECLARE @targetActivityNo INT = 4 -- Hamilton Matinee

SELECT a2.ActivityID,
       a2.Name,
       vector_distance(
          'cosine', cast(e1.Embedding as vector(768)), 
                    cast(e2.Embedding as vector(768))) AS Similarity
  FROM Activity.Activity a1
  JOIN Activity.Activity_Embedding e1
    ON a1.ActivityNo = e1.ActivityNo
 CROSS JOIN Activity.Activity a2
  JOIN Activity.Activity_Embedding e2
    ON a2.ActivityNo = e2.ActivityNo
 WHERE a1.ActivityNo = @targetActivityNo
   AND a2.ActivityNo <> @targetActivityNo
   AND vector_distance(
          'cosine', cast(e1.Embedding as vector(768)), 
                    cast(e2.Embedding as vector(768))) > 0.7
 ORDER BY Similarity DESC;
