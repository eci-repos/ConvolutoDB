-- Enable semantic search on key columns within combined embedding
ALTER TABLE Entity.Location ADD CombinedEmbedding VECTOR(768)
GO


