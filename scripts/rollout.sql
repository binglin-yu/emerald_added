@language.sql;
@project_document_stages_seq.sql;
@project_document_has_stage_seq.sql;
@project_categories_seq.sql;
@project_has_stage_seq.sql;

@project_document_stages.sql;
@project_document_stages_ml.sql;
@project_document_has_stage.sql;
@project_document_types_ml.sql;

@project_categories.sql;
@project_categories_ml.sql;

@states_ml.sql;

@partners_ml.sql;

@project_stages_ml.sql;
@project_has_stage.sql;

@representative_roles_ml.sql;

@methodologies_ml.sql;
@methodology_identifiers.sql;

@representatives_ml.sql;
@project_types_ml.sql;
@projects_ml.sql;


@project_reductions.sql;
@project_documents.sql;
@projects.sql;

EXECUTE dbms_utility.compile_schema(SCHEMA => 'EMERALD',compile_all => FALSE);
-- select OBJECT_TYPE, OBJECT_NAME  from user_objects where status <> 'VALID';


-- migrate data from  EMERALD.CCER_PROJECT_DETAILS
UPDATE projects p
   SET registration_number = (SELECT registration_id
                                FROM ccer_project_details c
                               WHERE c.project_id = p.project_id)
 WHERE p.project_id IN (SELECT c.project_id FROM ccer_project_details c where c.registration_id is not null);
--

insert into project_categories (name) values(1);
insert into project_categories (name) values(2);
insert into project_categories (name) values(3);
insert into project_categories (name) values(4);


UPDATE projects p
   SET project_category_id = (SELECT project_category_id
                                FROM project_categories   cat,
                                     ccer_project_details c
                               WHERE cat.NAME = c.category
                                 AND c.project_id = p.project_id)
 WHERE p.project_id IN (SELECT c.project_id
                          FROM ccer_project_details c
                         WHERE c.category IS NOT NULL);
--
update projects p
set PLANNED_ANNUAL_ER = (SELECT PLANNED_ANNUAL_ER
                                FROM ccer_project_details c
                               WHERE c.project_id = p.project_id)
 WHERE p.project_id IN (SELECT c.project_id FROM ccer_project_details c where c.PLANNED_ANNUAL_ER is not null);
--


-- !!!! migrate data from  EMERALD.PROJECT_VOLUMES not done !!!!
-- !!!! the problem is,  some info in project_volumes (like monitored_date) is related to the corresponding documents, but the lifecircle of project documents is not easy to track !!!!
-- !!!! one example is,
-- !!!!   in theory, the three dates in project_volumes should satisfy: monitored_date < requested_date < issued_date (refer to the PFS for the meaning of the three dates)
-- !!!!  monitored_date ( the report complete date) will change to a later date if the report doesn't get approved directly at the first meeting but with just some minor advice from the committee.



-- we should create views to replace the tables ccer_project_details and project_volumes

