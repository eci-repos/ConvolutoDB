
-- -----------------------------------------------------------------------------
-- VECTOR SIZE AGNOSTIC

-- DEFAULT: ollama VECTOR(768)

-- DROP TABLE Activity.Activity_Embedding
CREATE TABLE Activity.Activity_Embedding (
   EmbeddingID     uniqueidentifier DEFAULT NEWID() PRIMARY KEY NONCLUSTERED,
   ActivityNo      INT NOT NULL,
   EmbeddingNumber INT IDENTITY,
   ChunkText       VARCHAR(8000) NOT NULL,
   Model           VARCHAR(128) DEFAULT 'ollama',
   Embedding       JSON,
   VectorSize      INT DEFAULT 768,
   UpdatedDateTime DATETIMEOFFSET,

   CONSTRAINT fk_ActivityEmbedding FOREIGN KEY (ActivityNo)
      REFERENCES Activity.Activity(ActivityNo)
)

-- -----------------------------------------------------------------------------
-- VECTOR SIZE OLLAMA


