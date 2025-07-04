-- Enable semantic search on key columns within combined embedding
-- ollama vector size is 768 (1998 agnostic size)
ALTER TABLE Entity.Location ADD CombinedEmbedding VECTOR(1998)
GO


