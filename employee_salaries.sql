
DROP DATABASE IF EXISTS `employee_salaries`;
CREATE DATABASE `employee_salaries`;
USE `employee_salaries`;

-- status *
-- genders *

-- departments *
-- employees *
-- managers_descriptions *
-- managers *

-- performance_reviews  *

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
`status`        	ENUM	('new','active','leaving','terminated'),
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


DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
`employee_id`	          bigint	 		NOT NULL AUTO_INCREMENT,
`first_name` 	          varchar(30) 	NOT NULL,
`last_name` 	          varchar(30) 	NOT NULL,
`gender`                varchar(30) 	NOT NULL,
`id_number` 	          varchar(30) 	NOT NULL,
`phone_number` 	        varchar(30) 	NOT NULL,
`email_address` 	      varchar(30) 	NOT NULL,
`date_of_birth` 	      date 	        NOT NULL,
`department_name` 	    varchar(30) 	NOT NULL,
`initial_basic_pay` 	  varchar(30) 	NOT NULL,
`status` 	              ENUM	('new','active','leaving','terminated'),
`employment_start_date` 	varchar(30) 	NOT NULL,
`employment_end_date` 	varchar(30) 	NOT NULL,

`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`employee_id`),

KEY `index_employees_phone_number`(`phone_number`),
KEY `index_employees_email_address`(`email_address`),
KEY `index_employees_date_created`(`date_created`),
KEY `index_employees_date_modified`(`date_modified`),

UNIQUE KEY `uindex_employees_id_number` (`id_number`),

KEY `fk_genders_employees_gender` (`gender`),
CONSTRAINT `fk_genders_employees_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_departments_employees_gender` (`department_name`),
CONSTRAINT `fk_departments_employees_gender` FOREIGN KEY (`department_name`) REFERENCES `departments` (`department_name`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_status_employees_status` (`status`),
CONSTRAINT `fk_status_employees_status` FOREIGN KEY (`status`) REFERENCES `status` (`status`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `manager_descriptions`;

CREATE TABLE `manager_descriptions` (
`manager_description`        	ENUM	('Manager','Assistant-manager','Acting-manager'),
`date_created`  	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`manager_description`),

KEY `index_pupil_status_date_created`(`date_created`),
KEY `index_pupil_status_date_modified`(`date_modified`)
);



DROP TABLE IF EXISTS `managers`;

CREATE TABLE `managers`(
`manager_id`	          bigint	 		NOT NULL AUTO_INCREMENT,
`employee_id` 	       bigint 	   NOT NULL,
`manager_description`  ENUM        ('Manager','Assistant-manager','Acting-manager'),
`department_name`      varchar(30) NOT NULL,
`manager_start_date` 	 date 	NOT NULL,
`manager_end_date` 	   date 	DEFAULT NULL,
`date_created` 	       timestamp 	 NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	     timestamp 	 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`manager_id`),

KEY `index_managers_manager_start_date`(`manager_start_date`),
KEY `index_managers_manager_end_date`(`manager_end_date`),
KEY `index_managers_date_created`(`date_created`),
KEY `index_managers_date_modified`(`date_modified`),

KEY `fk_employees_managers_employee_id` (`employee_id`),
CONSTRAINT `fk_employees_managers_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_manager_descriptions_managers_manager_description` (`manager_description`),
CONSTRAINT `fk_manager_descriptions_managers_manager_description` FOREIGN KEY (`manager_description`) REFERENCES `manager_descriptions` (`manager_description`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_departments_managers_department_name` (`department_name`),
CONSTRAINT `fk_departments_managers_department_name` FOREIGN KEY (`department_name`) REFERENCES `departments` (`department_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `performance_reviews`;

CREATE TABLE `performance_reviews`(
`performance_review_id`	          bigint	 		NOT NULL AUTO_INCREMENT,
`date of review` 	 date 	NOT NULL,
`manager_id` 	       bigint 	   NOT NULL,
`comment_by_employee`      varchar(30) NOT NULL,
`comment_by_manager` 	 varchar(30) NOT NULL,
`date_created` 	       timestamp 	 NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	     timestamp 	 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`performance_review_id`),


KEY `index_performance_reviews_date of review`(`date of review`),
KEY `index_performance_reviews_date_created`(`date_created`),
KEY `index_performance_reviews_date_modified`(`date_modified`),

KEY `fk_employees_performance_reviews_employee_id` (`employee_id`),
CONSTRAINT `fk_employees_performance_reviews_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_managers_performance_reviews_employee_id` (`manager_id`),
CONSTRAINT `fk_managers_performance_reviews_employee_id` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`manager_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
);