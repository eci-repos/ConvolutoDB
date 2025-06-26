-- Enable semantic search on key columns within combined embedding
ALTER TABLE Activity.Activity ADD 
   CombinedEmbedding varbinary(8000)
GO


