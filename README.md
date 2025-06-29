# Convoluto DB - AI Enhancements POC

## Overview

Industries of all kinds would like to enhance their data products to take advantage of the existing wealth of AI resources and offerings.  The recent announcements of Microsoft of its SQL Server 2025 (SS25) database show a deep commitment and a path for companies and agencies to start their AI initiatives.  This POC offers some examples on how to enhance an existing database (Convoluto) within SS25 with AI based Semantic Search and other techniques and methods.

Convoluto is an Activity Tracking Database designed to manage information about recreational activities, event locations, and participant registrations. This relational database serves as a centralized platform for organizations to track their offerings, manage customer engagements, and analyze participation patterns across various events and venues.

This POC presents a simple Activity Tracking Database stating its Purpose, Key Features, Target Users, and Technical Approach, then goes through the steps of Enhancing the Schema and the preparation of resources for AI exploration based on the related features as offered by SQL Server 2025.

## Publishing the Database
After building the Database project (in Visual Studio) you can Publish it to the target 
Convoluto Database in SQL-Server 2025.  This will setup the base Database resources 
including Tables, Views, and Procedures.

## VECTOR EMBEDDINGS & SEMANTIC SEARCH
To prepare for Semantic Search (for now) additional steps must be done by hand including:

- Run Scripts 1 through 3 in that order.
- Run the Activity/Scripts/Activity_Embeddings_Add.sql script to add embeddings.
- Run the Entity/Scripts/Location_Embeddings_Add.sql script to add embeddings.
- Run the Activity/Procedures/Activity_Embedding_Update.sql script to update embeddings.
- Run the Entity/Procedures/Location_Embedding_Update.sql script to update embeddings.
- If needed, run the Activity/Indexes/Activity_Vector_Index.sql to create the VECTOR INDEX.
- Test deployed resources with Activity/Tests/Test_Activity_Embeddings.

NOTES:

- Embeddings can't be updated in a table if there is an existing VECTOR INDEX
  therefore create the VECTOR INDEX after you updated the embeddings.
- Before testing AI features start the NGINX instance.

## ADVANCE CHUNKING & SEARCH



