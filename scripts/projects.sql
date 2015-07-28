alter table projects add(
CDM_ID VARCHAR2(10),
REGISTRATION_NUMBER VARCHAR2(10),
LATITUDE FLOAT(126),
LONGITUDE FLOAT(126),
PROJECT_CATEGORY_ID NUMBER,
PLANNED_ANNUAL_ER number
);

ALTER TABLE projects add CONSTRAINT fk_prj_category_id foreign key(project_category_id) 
    references project_categories(project_category_id) enable;
	
--
