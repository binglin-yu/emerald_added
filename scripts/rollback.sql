
drop table partners_ml;
drop table projects_ml;
drop table project_types_ml;
drop table representatives_ml;
drop table methodologies_ml;
drop table representative_roles_ml;
drop table project_stages_ml;
drop table states_ml;
drop table project_categories_ml;
drop table project_document_types_ml;
drop table project_document_stages_ml;

drop table project_document_has_stage;
drop table project_document_stages;

drop table project_has_stage;

drop table methodology_identifiers;

drop table language;

alter table projects drop (
CDM_ID,
LATITUDE,
LONGITUDE,
REGISTRATION_NUMBER,
PROJECT_CATEGORY_ID,
planned_annual_er);

drop table project_categories;


alter table project_documents drop (
DOCUMENT_ISSUER);

alter table PROJECT_REDUCTIONS drop (
PERIOD_START,
PERIOD_END,
PROJECT_MONITORED_VOLUME
);


drop sequence project_document_has_stage_seq;
drop sequence project_document_stages_seq;
drop sequence project_categories_seq;
drop sequence project_has_stage_seq;
