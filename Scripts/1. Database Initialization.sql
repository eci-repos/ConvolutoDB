USE Convoluto
GO

-- Turn External REST Endpoint Invocation ON in the database
EXECUTE sp_configure 'external rest endpoint enabled', 1;
GO

RECONFIGURE WITH OVERRIDE;
GO

