-- Find similar activities to a specific one
-- SELECT * FROM Activity.Activity
DECLARE @targetActivityNo INT = 4 -- Hamilton Matinee

SELECT a2.ActivityID,
       a2.Name,
       vector_distance(
          'cosine', a1.CombinedEmbedding, a2.CombinedEmbedding) AS Similarity
  FROM Activity.Activity a1
 CROSS JOIN Activity.Activity a2
 WHERE a1.ActivityNo = @targetActivityNo
   AND a2.ActivityNo <> @targetActivityNo
   AND vector_distance(
          'cosine', a1.CombinedEmbedding, a2.CombinedEmbedding) > 0.7
 ORDER BY Similarity DESC;
