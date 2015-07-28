
  CREATE TABLE PROJECT_CATEGORIES_ML
   (	PROJECT_CATEGORY_ID NUMBER(38,0),
	NAME VARCHAR2(60),
	DESCRIPTION VARCHAR2(300),
	LANGUAGE_ID NUMBER
   ) ;
  ALTER TABLE PROJECT_CATEGORIES_ML ADD CONSTRAINT PK_PROJECT_CATEGORIES_ML PRIMARY KEY (PROJECT_CATEGORY_ID, LANGUAGE_ID) ENABLE;
  ALTER TABLE PROJECT_CATEGORIES_ML ADD CONSTRAINT FK_PROJECT_CATEGORIES_ML_1 FOREIGN KEY (PROJECT_CATEGORY_ID)
	  REFERENCES PROJECT_CATEGORIES (PROJECT_CATEGORY_ID) ON DELETE CASCADE ENABLE;
  ALTER TABLE PROJECT_CATEGORIES_ML ADD CONSTRAINT FK_PROJECT_CATEGORIES_ML_2 FOREIGN KEY (LANGUAGE_ID)
	  REFERENCES LANGUAGE (ID) ON DELETE CASCADE ENABLE;

