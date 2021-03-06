
  CREATE TABLE METHODOLOGIES_ML
   (	METHODOLOGY_ID NUMBER(22,0),
	METHODOLOGY_NAME VARCHAR2(400) NOT NULL ENABLE,
	METHODOLOGY_DESCRIPTION VARCHAR2(2000),
	METHODOLOGY_SOURCE VARCHAR2(500),
	LANGUAGE_ID NUMBER
   ) ;
  ALTER TABLE METHODOLOGIES_ML ADD CONSTRAINT PK_METHODOLOGIES_ML PRIMARY KEY (METHODOLOGY_ID, LANGUAGE_ID) ENABLE;
  ALTER TABLE METHODOLOGIES_ML ADD CONSTRAINT METHODOLOGIES_ML_UK UNIQUE (METHODOLOGY_NAME, LANGUAGE_ID) ENABLE;
  ALTER TABLE METHODOLOGIES_ML ADD CONSTRAINT FK_METHODOLOGIES_ML_1 FOREIGN KEY (METHODOLOGY_ID)
	  REFERENCES METHODOLOGIES (METHODOLOGY_ID) ON DELETE CASCADE ENABLE;
  ALTER TABLE METHODOLOGIES_ML ADD CONSTRAINT FK_METHODOLOGIES_ML_2 FOREIGN KEY (LANGUAGE_ID)
	  REFERENCES LANGUAGE (ID) ON DELETE CASCADE ENABLE;

