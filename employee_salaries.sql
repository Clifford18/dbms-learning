
DROP DATABASE IF EXISTS `employee_salaries`;
CREATE DATABASE `employee_salaries`;
USE `employee_salaries`;

-- status *
-- genders

-- department
-- employees
-- managers_description
-- managers

-- performance_reviews

-- training_history
-- courses

-- skills
-- skill_levels
-- employee_skills

-- relationships
-- relationship_descriptions
-- dependants

-- designations
-- employee_designations

-- projects
-- tasks

-- earning
-- deductions

CREATE TABLE `status` (
`status` 	varchar(30) 	NOT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`status`),

KEY `index_pupil_status_date_created`(`date_created`),
KEY `index_pupil_status_date_modified`(`date_modified`)
);







