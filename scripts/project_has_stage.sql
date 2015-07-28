
  CREATE TABLE PROJECT_HAS_STAGE
   (	ID NUMBER(38,0) NOT NULL ENABLE,
	PROJECT_ID NUMBER(38,0) NOT NULL ENABLE,
	PROJECT_STAGE_ID NUMBER(38,0) NOT NULL ENABLE,
	EFFECTIVE_DATE_FROM DATE NOT NULL ENABLE,
	EFFECTIVE_DATE_TO DATE,
	CREATE_BY VARCHAR2(30) NOT NULL ENABLE,
	CREATE_DATE DATE NOT NULL ENABLE,
	MODIFY_BY VARCHAR2(30) NOT NULL ENABLE,
	MODIFY_DATE DATE NOT NULL ENABLE
   ) ;
  ALTER TABLE PROJECT_HAS_STAGE ADD CONSTRAINT PK_PROJECT_HAS_STAGE PRIMARY KEY (ID) ENABLE;
  ALTER TABLE PROJECT_HAS_STAGE ADD CONSTRAINT FK_PHS_PROJECTS FOREIGN KEY (PROJECT_ID)
	  REFERENCES PROJECTS (PROJECT_ID) ON DELETE CASCADE ENABLE;
  ALTER TABLE PROJECT_HAS_STAGE ADD CONSTRAINT FK_PHS_PROJECT_STAGES FOREIGN KEY (PROJECT_STAGE_ID)
	  REFERENCES PROJECT_STAGES (PROJECT_STAGE_ID) ON DELETE CASCADE ENABLE;


  CREATE OR REPLACE TRIGGER trg_project_has_stage_biur
   BEFORE INSERT OR UPDATE ON project_has_stage
  FOR EACH ROW
BEGIN
  IF inserting THEN
    :NEW.id := project_has_stage_seq.NEXTVAL;
    :new.create_by := USER;
    :new.create_date := sysdate;
  END IF;
    :new.modify_by := USER;
    :new.modify_date := sysdate;
END trg_project_has_stage_biur;

/
ALTER TRIGGER trg_project_has_stage_biur ENABLE;
