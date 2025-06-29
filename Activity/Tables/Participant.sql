
CREATE TABLE Activity.Participant (
   ParticipantNo  INT IDENTITY PRIMARY KEY,
   ParticipantID  UNIQUEIDENTIFIER DEFAULT NEWID(),
   TypeID         VARCHAR(20),
   Name           VARCHAR(128),
   Email          VARCHAR(128),
   Phone          VARCHAR(20),
   BirthYear      INTEGER,
   Country        VARCHAR(40) DEFAULT 'US',
   State          VARCHAR(2),
   County         VARCHAR(40),
   City           VARCHAR(40),
   ZipCode        VARCHAR(20),
   RegisteredDate DATE,
   StatusID       VARCHAR(20),
   StatusDate     DATE,
   
   CONSTRAINT fk_ParticipantType FOREIGN KEY (TypeID)	
      REFERENCES Activity.Participant_Type(TypeID),
   CONSTRAINT fk_ParticipantStatus_Type FOREIGN KEY (StatusID)
      REFERENCES Common.Status_Type(TypeID)
)
GO