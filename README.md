# Convoluto DB - AI Enhancements POC

## Overview

Industries of all kinds would like to enhance their data products to take advantage of the existing wealth of AI resources and offerings.  The recent announcements of Microsoft of its SQL Server 2025 (SS25) database show a deep commitment and a path for companies and agencies to start their AI initiatives.  This POC offers some examples on how to enhance an existing database (Convoluto) within SS25 with AI based Semantic Search and other techniques and methods.

Convoluto is an Activity Tracking Database designed to manage information about recreational activities, event locations, and participant registrations. This relational database serves as a centralized platform for organizations to track their offerings, manage customer engagements, and analyze participation patterns across various events and venues.

This POC presents a simple Activity Tracking Database stating its Purpose, Key Features, Target Users, and Technical Approach, then goes through the steps of Enhancing the Schema and the preparation of resources for AI exploration based on the related features as offered by SQL Server 2025.

## Publishing the Database
After building the Database project (in Visual Studio) you can Publish it to the target 
Convoluto Database in SQL-Server 2025.  This will setup the base Database resources 
including Tables, Views, and Procedures.

The enhancement of the Convoluto Database adding resources to implement AI Semantic 
Search follows and can be supplemented with the related
"Implementing Native AI Semantic Search POC" documentation (article) topics 1 through 6.

### 1. Vector Embeddings
To prepare for Semantic Search (for now) additional steps must be done by hand including:

- Run the Scripts/ 1 through 3 in that order.
- Run the Activity/Scripts/Activity_Embeddings_Add.sql script to add embeddings.
- Run the Entity/Scripts/Location_Embeddings_Add.sql script to add embeddings.
- Test deployed resources with Activity/Tests/Test_Activity_Embeddings.sql

NOTES:

- Before testing AI features start the NGINX instance.

### 2. Semantic Search
To prepare for Semantic Search (for now) additional steps must be done by hand including:

- Run the Activity/Procedures/Activity_Embedding_Update.sql script to update embeddings.
- Run the Entity/Procedures/Location_Embedding_Update.sql script to update embeddings.
- If needed, run the Activity/Indexes/Activity_Vector_Index.sql to create the VECTOR INDEX.
- Test deployed resources with Activity/Tests/Test_Activity_Embeddings.sql

NOTES:

- Embeddings can't be updated in a table if there is an existing VECTOR INDEX
  therefore create the VECTOR INDEX after you updated the embeddings.

### 3. Advance Chunking & Search
To prepare for Chunking & Search (for now) additional steps must be done by hand including:

- Run the Activity/Scripts/Activity_Chunks_Add.sql script to support Chunks.
- Run the Activity/Procedures/Activity_Chunks_Update.sql script to update Chunks.
- Test deployed resources with Activity/Tests/Test_Activity_Chunking.sql

### 4. Native VECTOR_SEARCH Function
Test VECTOR_SEARCH using Activity/Tests/Test_Activity_VectorSearch.sql

### 5. Semantic Join Across Tables 
Test Semantic Join using Activity/Tests/Test_Activity_Location.sql

### 6. Semantic Similarity Join 
Test Semantic Similarity using Activity/Tests/Test_Activity_Similar.sql

## Model (Vector) Agnostic Approach
SQL Server 2025 supports the AI_GENERATE_EMBEDDINGS
function, which relies on externally registered models. These models 
are not hardcoded into SQL Server itself—instead, you define them using 
CREATE EXTERNAL MODEL, and the embedding dimensions depend on the model 
you choose and how it's configured.

### Commonly Used Embedding Models and Their Dimensions
Here are some commonly used models that you can register and use with
AI_GENERATE_EMBEDDINGS, along with their typical embedding dimensions:

|Model Name	|Provider	|Dimension|
|-----------|-----------|------------------|
|text-embedding-3-small	|OpenAI / Azure	|1536|
|text-embedding-3-large	|OpenAI / Azure	|3072|
|text-embedding-ada-002	|OpenAI / Azure	|1536|
|nomic-embed-text-v1	|Ollama / Hugging Face	|768|
|bge-small-en	|Hugging Face	|384|
|bge-large-en	|Hugging Face	|1024|

### Considerations...

When supporting multiple embedding models in T-SQL 2025 using the 
AI_GENERATE_EMBEDDINGS function, several key considerations must be 
addressed to ensure flexibility, maintainability, and performance.

1. Model Registration and Naming -
Each model must be registered using CREATE EXTERNAL MODEL, and the 
model name is used statically in queries. This means you need a 
clear naming convention to distinguish between models (e.g., by 
provider, dimension, or use case). Since T-SQL does not support 
passing model names as variables directly, managing multiple models 
often requires dynamic SQL or separate queries per model.

2. Embedding Dimensions -
Different models produce embeddings of different dimensions (e.g., 384, 768, 1536, 3072). This affects downstream storage and similarity search logic. You must ensure that the target tables or vector indexes are dimensionally compatible with the model output. If you plan to switch models dynamically, consider designing your schema to accommodate variable-length vectors or normalize all embeddings to a common dimension (e.g., via PCA or truncation).

3. Performance and Cost -
Each model may have different latency and cost characteristics, especially if hosted on external services like Azure OpenAI or Hugging Face. Supporting multiple models means balancing quality versus cost and performance. You might use smaller, faster models for real-time tasks and larger, more accurate models for batch processing or analytics.

4. Security and Governance -
Each external model requires authentication (e.g., API keys), and these credentials must be securely managed. When supporting multiple models from different providers, ensure that access controls, logging, and usage policies are in place to prevent misuse or data leakage.

5. Query Complexity and Maintainability -
Since T-SQL does not support dynamic model selection natively, using multiple models often involves dynamic SQL (sp_executesql) or application-side logic to construct queries. This can increase complexity and reduce readability. Consider abstracting model selection logic into stored procedures or views to simplify usage for end users.

### Dynamic Embeddings
The Convoluto database has been updated to be ready to support multiple
models by adding the Activity_Embedding and Location_Embedding tables
to have the ability to generate embeddings based on model characteristics
such as VECTOR size (dimensions).

Using dynamic SQL statements and the details stored in the Activities
and Locations Embeddings tables a stored procedure can be created to
generate those.


