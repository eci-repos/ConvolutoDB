-- Don't create the VECTOR INDEX if you have not updated the embeddings...
-- DROP INDEX ix_Activity_Combined ON Activity.Activity
CREATE VECTOR INDEX ix_Activity_Combined ON Activity.Activity(CombinedEmbedding)
  WITH (METRIC='cosine', TYPE='diskann');
GO