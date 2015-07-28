
  CREATE TABLE PARTNERS_ML
   (	PARTNER_ID NUMBER,
	PARTNER_NAME VARCHAR2(80) NOT NULL ENABLE,
	PARTNER_ADDRESS VARCHAR2(300),
	PARTNER_NOTES VARCHAR2(2000),
	PARTNER_LOCATION VARCHAR2(300),	
LANGUAGE_ID NUMBER
   );

  ALTER TABLE PARTNERS_ML ADD CONSTRAINT PK_PARTNERS_ML PRIMARY KEY (PARTNER_ID, LANGUAGE_ID) ENABLE;
  ALTER TABLE PARTNERS_ML ADD CONSTRAINT FK_PARTNER_ID_1 FOREIGN KEY (PARTNER_ID)
	  REFERENCES PARTNERS (PARTNER_ID) ON DELETE CASCADE ENABLE;
  ALTER TABLE PARTNERS_ML ADD CONSTRAINT FK_PARTNER_ID_2 FOREIGN KEY (LANGUAGE_ID)
	  REFERENCES LANGUAGE (ID) ON DELETE CASCADE ENABLE;