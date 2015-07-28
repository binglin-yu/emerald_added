
  CREATE TABLE PROJECT_DOCUMENT_STAGES_ML
   (	PROJECT_DOCUMENT_STAGE_ID NUMBER NOT NULL,
	PROJECT_DOCUMENT_STAGE_NAME VARCHAR2(80) NOT NULL,
	STAGE_DESCRIPTION VARCHAR2(2000),
	LANGUAGE_ID NUMBER
   ) ;
  ALTER TABLE PROJECT_DOCUMENT_STAGES_ML ADD CONSTRAINT PK_PROJECT_DOCUMENT_STAGES_ML PRIMARY KEY (PROJECT_DOCUMENT_STAGE_ID, LANGUAGE_ID) ENABLE;
  ALTER TABLE PROJECT_DOCUMENT_STAGES_ML ADD CONSTRAINT PROJECT_DOCUMENT_STAGES_ML_UK UNIQUE (PROJECT_DOCUMENT_STAGE_NAME, LANGUAGE_ID) ENABLE;
  ALTER TABLE PROJECT_DOCUMENT_STAGES_ML ADD CONSTRAINT FK_PRJ_DOCUMENT_STAGES_ML_1 FOREIGN KEY (PROJECT_DOCUMENT_STAGE_ID)
	  REFERENCES PROJECT_DOCUMENT_STAGES (PROJECT_DOCUMENT_STAGE_ID) ON DELETE CASCADE ENABLE;
  ALTER TABLE PROJECT_DOCUMENT_STAGES_ML ADD CONSTRAINT FK_PRJ_DOCUMENT_STAGES_ML_2 FOREIGN KEY (LANGUAGE_ID)
	  REFERENCES LANGUAGE (ID) ON DELETE CASCADE ENABLE;
