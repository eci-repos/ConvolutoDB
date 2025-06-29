
CREATE TABLE Activity.Activity_Participant (
   ActivityParticipantID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
   ActivityNo     INT NOT NULL,
   ParticipantNo  INT NOT NULL,
   RegisteredDate DATE,
   StatusID       VARCHAR(20),
   StatusDate     DATE,
   
   CONSTRAINT fk_ActivityParticipant FOREIGN KEY (ActivityNo)
      REFERENCES Activity.Activity(ActivityNo),
   CONSTRAINT fk_ParticipantActivity FOREIGN KEY (ParticipantNo)
      REFERENCES Activity.Participant(ParticipantNo),
   CONSTRAINT fk_ActivityParticipantStatus_Type FOREIGN KEY (StatusID)
      REFERENCES Common.Status_Type(TypeID)
)
GO

