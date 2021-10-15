
DROP DATABASE IF EXISTS `employee_salaries`;
CREATE DATABASE `employee_salaries`;
USE `employee_salaries`;

-- status *
-- genders *

-- departments *
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

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
`status`        	varchar(30) 	NOT NULL,
`date_created`  	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`status`),

KEY `index_pupil_status_date_created`(`date_created`),
KEY `index_pupil_status_date_modified`(`date_modified`)
);


DROP TABLE IF EXISTS `genders`;

CREATE TABLE `genders` (
`gender`            	varchar(30) 	NOT NULL,
`date_created`      	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified`     	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`gender`),

KEY `index_genders_date_created`(`date_created`),
KEY `index_genders_date_modified`(`date_modified`)
);

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
`department_name` 	varchar(30) 	NOT NULL,
`department_description` 	varchar(30) 	DEFAULT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`department_name`),

KEY `index_subjects_date_created`(`date_created`),
KEY `index_subjects_date_modified`(`date_modified`)
);



