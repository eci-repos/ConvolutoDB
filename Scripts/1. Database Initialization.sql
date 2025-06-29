USE master

-- Enable memory-optimized filegroup if not already enabled
ALTER DATABASE Convoluto
  ADD FILEGROUP MemOptFileGroup CONTAINS MEMORY_OPTIMIZED_DATA;

ALTER DATABASE Convoluto
  ADD FILE (
     NAME='MemOptContainer',
     FILENAME='d:\Data\MemOptContainer'
  )  TO FILEGROUP MemOptFileGroup;

-- prepare database to access external services...
USE Convoluto
GO

-- Turn External REST Endpoint Invocation ON in the database
EXECUTE sp_configure 'external rest endpoint enabled', 1;
GO

RECONFIGURE WITH OVERRIDE;
GO
