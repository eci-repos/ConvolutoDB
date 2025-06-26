--
CREATE TABLE Activity.Activity (
   ActivityID      UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
   TypeID          VARCHAR(20),
   LocationID      UNIQUEIDENTIFIER,
   Name            VARCHAR(128),
   Description     VARCHAR(1028),
   StartDateTime   DATETIME,
   EndDateTime     DATETIME,
   StatusID        VARCHAR(20),
   StatusDate      DATE,
   AgeGroupID      VARCHAR(60),
   Price           DECIMAL(12,2),
   PriceRangeID    VARCHAR(60),
   Rating          DECIMAL(4,2),  -- a number between 1 and 5
   RatingDate      DATE,
   DificultyID     VARCHAR(20),
   UpdatedDateTime DATETIMEOFFSET DEFAULT getutcdate(),
   
   CONSTRAINT fk_Activity_Type FOREIGN KEY (TypeID)
      REFERENCES Activity.Activity_Type(TypeID),
   CONSTRAINT fk_ActivityLocation FOREIGN KEY (LocationID)	
      REFERENCES Entity.Location(LocationID),
   CONSTRAINT fk_ActivityStatus_Type FOREIGN KEY (StatusID)
      REFERENCES Common.Status_Type(TypeID),
   CONSTRAINT fk_ActivityAgeGroup_Type FOREIGN KEY (AgeGroupID)
      REFERENCES Entity.Age_Group_Type(TypeID),
   CONSTRAINT fk_ActivityPriceRange_Type FOREIGN KEY (PriceRangeID)
      REFERENCES Activity.Price_Range_Type(TypeID),
   CONSTRAINT fk_ActivityDificulty FOREIGN KEY (DificultyID)
      REFERENCES Activity.Dificulty_Type(TypeID)
)
GO


