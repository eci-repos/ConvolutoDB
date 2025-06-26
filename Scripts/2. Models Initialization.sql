-- -------------------------------------------------------------------
-- Enable trace flags for vector features
DBCC TRACEON (466, 474, 13981, -1);
GO

-- Check trace flags status
DBCC TRACESTATUS;
GO

-- -------------------------------------------------------------------
-- Remember to start the NGINX service before using the end-point
--
-- > # move to the nginx folder
-- > start ./nginx

CREATE EXTERNAL MODEL ollama
WITH (
   LOCATION = 'https://localhost:11435/api/embed',
   API_FORMAT = 'Ollama',
   MODEL_TYPE = EMBEDDINGS,
   MODEL = 'nomic-embed-text'
);

/*
-- Testing
SELECT AI_GENERATE_EMBEDDINGS(N'hello world!' USE MODEL ollama);
 */

