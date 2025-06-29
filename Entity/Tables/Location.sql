CREATE TABLE Entity.Location (
   LocationNo     INT IDENTITY PRIMARY KEY,
   LocationID     UNIQUEIDENTIFIER DEFAULT NEWID(),
   TypeID         VARCHAR(20),
   Name           VARCHAR(128),
   Description    VARCHAR(1028),
   AddressLine1   VARCHAR(128),
   AddressLine2   VARCHAR(128),
   Country        VARCHAR(40) DEFAULT 'US',
   State          VARCHAR(2),
   County         VARCHAR(40),
   City           VARCHAR(40),
   ZipCode        VARCHAR(20),
   Latitude       DECIMAL(12,9),
   Longitude      DECIMAL(12,9),
   StatusID       VARCHAR(20),
   StatusDate     DATE,
   Rating         DECIMAL(4,2),  -- a number between 1 and 5
   RatingDate     DATE,
   CapacityID     VARCHAR(60),
   
   CONSTRAINT fk_Location_Type FOREIGN KEY (TypeID)
      REFERENCES Entity.Location_Type(TypeID),
   CONSTRAINT fk_LocationStatus_Type FOREIGN KEY (StatusID)
      REFERENCES Common.Status_Type(TypeID),
   CONSTRAINT fk_LocationCapacity_Type FOREIGN KEY (CapacityID)
      REFERENCES Entity.Capacity_Type(TypeID)
)
GO