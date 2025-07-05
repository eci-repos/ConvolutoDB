-- Enable semantic search on key columns within combined embedding
ALTER TABLE Activity.Activity ADD CombinedEmbedding VECTOR(768)
GO


