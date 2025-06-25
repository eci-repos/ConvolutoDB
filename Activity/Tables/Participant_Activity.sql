
CREATE TABLE Activity.Activity_Participant (
   ActivityParticipantID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
   ActivityID     UNIQUEIDENTIFIER NOT NULL,
   ParticipantID  UNIQUEIDENTIFIER NOT NULL,
   RegisteredDate DATE,
   StatusID       VARCHAR(20),
   StatusDate     DATE,
   
   CONSTRAINT fk_ActivityParticipant FOREIGN KEY (ActivityID)
      REFERENCES Activity.Activity(ActivityID),
   CONSTRAINT fk_ParticipantActivity FOREIGN KEY (ParticipantID)
      REFERENCES Activity.Participant(ParticipantID),
   CONSTRAINT fk_ActivityParticipantStatus_Type FOREIGN KEY (StatusID)
      REFERENCES Common.Status_Type(TypeID)
)
GO

