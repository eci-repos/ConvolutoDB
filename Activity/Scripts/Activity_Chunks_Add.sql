-- For large descriptions, use chunking with semantic search
ALTER TABLE Activity.Activity ADD DescriptionChunk VARCHAR(8000);

-- Create a memory-optimized chunk table
-- DROP TABLE Activity.Activity_Chunk
CREATE TABLE Activity.Activity_Chunk (
   ChunkID uniqueidentifier DEFAULT NEWID() PRIMARY KEY NONCLUSTERED,
   ActivityNo INT NOT NULL,
   ChunkNumber int NOT NULL,
   ChunkText nvarchar(500) NOT NULL,
   ChunkEmbedding VARCHAR(MAX)
)  WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA);



