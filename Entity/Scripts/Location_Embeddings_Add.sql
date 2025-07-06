
-- -----------------------------------------------------------------------------
-- VECTOR SIZE AGNOSTIC

-- DEFAULT: ollama VECTOR(768)

-- DROP TABLE Entity.Location_Embedding
CREATE TABLE Entity.Location_Embedding (
   EmbeddingID     uniqueidentifier DEFAULT NEWID() PRIMARY KEY NONCLUSTERED,
   LocationNo      INT NOT NULL,
   EmbeddingNumber INT IDENTITY,
   ChunkText       VARCHAR(8000) NOT NULL,
   Model           VARCHAR(128) DEFAULT 'ollama',
   Embedding       JSON,
   VectorSize      INT DEFAULT 768,
   UpdatedDateTime DATETIMEOFFSET,

   CONSTRAINT fk_LocationEmbedding FOREIGN KEY (LocationNo)
      REFERENCES Entity.Location(LocationNo)
)




