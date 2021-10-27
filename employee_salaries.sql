
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

-- courses *
-- training_histories *

-- skills *
-- skill_levels *
-- employee_skills *

-- relationships *
-- relationship_descriptions *
-- dependants *

-- designations *
-- employee_designations *

-- projects *
-- tasks*

-- earning
-- deductions


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
    `department_name` 	      varchar(30) 	NOT NULL,
    `department_description` 	varchar(30) 	DEFAULT NULL,
    `date_created`          	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`         	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`department_name`),

    KEY `index_subjects_date_created`(`date_created`),
    KEY `index_subjects_date_modified`(`date_modified`)
    );


    DROP TABLE IF EXISTS `employees`;
    CREATE TABLE `employees` (
    `employee_id`	          bigint	 		  NOT NULL AUTO_INCREMENT,
    `first_name` 	          varchar(30) 	NOT NULL,
    `last_name` 	          varchar(30) 	NOT NULL,
    `gender`                varchar(30) 	NOT NULL,
    `id_number` 	          varchar(30) 	NOT NULL,
    `phone_number` 	        varchar(30) 	NOT NULL,
    `email_address` 	      varchar(30) 	NOT NULL,
    `date_of_birth` 	      date 	        NOT NULL,
    `department_name` 	    varchar(30) 	NOT NULL,
    `initial_basic_pay` 	  varchar(30) 	NOT NULL,
    `status` 	              ENUM('new','active','leaving','terminated') NOT NULL,
    `employment_start_date` varchar(30) 	NOT NULL,
    `employment_end_date` 	varchar(30) 	NOT NULL,
    `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`employee_id`),

    KEY `index_employees_gender`(`gender`),
    KEY `index_employees_phone_number`(`phone_number`),
    KEY `index_employees_email_address`(`email_address`),
    KEY `index_employees_department_name`(`department_name`),
    KEY `index_employees_status`(`status`),
    KEY `index_employees_employment_start_date`(`employment_start_date`),
    KEY `index_employees_employment_end_date`(`employment_end_date`),
    KEY `index_employees_date_created`(`date_created`),
    KEY `index_employees_date_modified`(`date_modified`),

    UNIQUE KEY `uindex_employees_id_number` (`id_number`),

    KEY `fk_genders_employees_gender` (`gender`),
    CONSTRAINT `fk_genders_employees_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

    KEY `fk_departments_employees_gender` (`department_name`),
    CONSTRAINT `fk_departments_employees_gender` FOREIGN KEY (`department_name`) REFERENCES `departments` (`department_name`) ON DELETE RESTRICT ON UPDATE CASCADE
    );


    DROP TABLE IF EXISTS `manager_descriptions`;
    CREATE TABLE `manager_descriptions` (
    `manager_description`   varchar(30)   NOT NULL,
    `date_created`  	      timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	      timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`manager_description`),

    KEY `index_pupil_status_date_created`(`date_created`),
    KEY `index_pupil_status_date_modified`(`date_modified`)
    );


    DROP TABLE IF EXISTS `managers`;
    CREATE TABLE `managers`(
    `manager_id`	         bigint	 	    NOT NULL AUTO_INCREMENT,
    `employee_id` 	       bigint   	  NOT NULL,
    `manager_description`  varchar(30)  NOT NULL,
    `department_name`      varchar(30)  NOT NULL,
    `manager_start_date` 	 date 	      NOT NULL,
    `manager_end_date` 	   date 	      DEFAULT NULL,
    `date_created` 	       timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	     timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`manager_id`),

    KEY `index_managers_employee_id`(`employee_id`),
    KEY `index_managers_manager_description`(`manager_description`),
    KEY `index_managers_department_name`(`department_name`),
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
    `performance_review_id` bigint	 		  NOT NULL AUTO_INCREMENT,
    `employee_id` 	        bigint 	      NOT NULL,
    `date_of_review` 	      date 	        NOT NULL,
    `manager_id` 	          bigint 	      NOT NULL,
    `comment_by_employee`   varchar(30)   NOT NULL,
    `comment_by_manager` 	  varchar(30)   NOT NULL,
    `date_created` 	        timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	      timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`performance_review_id`),

    KEY `index_performance_reviews_employee_id`(`employee_id`),
    KEY `index_performance_reviews_date_of_review`(`date_of_review`),
    KEY `index_performance_reviews_manager_id`(`manager_id`),
    KEY `index_performance_reviews_date_created`(`date_created`),
    KEY `index_performance_reviews_date_modified`(`date_modified`),

    KEY `fk_employees_performance_reviews_employee_id` (`employee_id`),
    CONSTRAINT `fk_employees_performance_reviews_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    KEY `fk_managers_performance_reviews_manager_id` (`manager_id`),
    CONSTRAINT `fk_managers_performance_reviews_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`) ON DELETE RESTRICT ON UPDATE CASCADE
    );


    DROP TABLE IF EXISTS `courses`;
    CREATE TABLE `courses` (
    `course_name` 			   varchar(30) 	NOT NULL,
    `course_description` 	 varchar(30) 	NOT NULL,
    `course_institution` 	 varchar(30) 	NOT NULL,
    `course_cost` 	       varchar(30) 	NOT NULL,
    `course_duration`	     varchar(30) 	NOT NULL,
    `date_created` 		     timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 		   timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`course_name`),

    KEY `index_courses_date_created`(`date_created`),
    KEY `index_courses_date_modified`(`date_modified`)
    ) ;


    DROP TABLE IF EXISTS `training_histories`;
    CREATE TABLE `training_histories`(
    `training_history_id`       bigint	 		  NOT NULL AUTO_INCREMENT,
    `employee_id` 	            bigint 	      NOT NULL,
    `course_name`               varchar(30)   NOT NULL,
    `training_start_date` 	    varchar(30)   NOT NULL,
    `training_description`      varchar(30)   DEFAULT NULL,
    `training_completion_date` 	varchar(30)   NOT NULL,
    `date_created` 	            timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	          timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`training_history_id`),

    KEY `index_training_histories_training_start_date`(`training_start_date`),
    KEY `index_training_histories_training_completion_date`(`training_completion_date`),
    KEY `index_training_histories_date_created`(`date_created`),
    KEY `index_training_histories_date_modified`(`date_modified`),

    KEY `fk_employees_training_histories_employee_id` (`employee_id`),
    CONSTRAINT `fk_employees_training_histories_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    KEY `fk_courses_training_histories_course_name` (`course_name`),
    CONSTRAINT `fk_courses_training_histories_course_name` FOREIGN KEY (`course_name`) REFERENCES `courses` (`course_name`) ON DELETE RESTRICT ON UPDATE CASCADE
    );


    DROP TABLE IF EXISTS `skills`;
    CREATE TABLE `skills` (
    `skill_name` 	        varchar(30) 	NOT NULL,
    `skill_description` 	varchar(30) 	DEFAULT NULL,
    `date_created`        timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`       timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`skill_name`),

    KEY `index_skills_date_created`(`date_created`),
    KEY `index_skills_date_modified`(`date_modified`)
    );


    DROP TABLE IF EXISTS `employee_skills`;
    CREATE TABLE `employee_skills`(
    `employee_skill_id`   bigint	 		  NOT NULL AUTO_INCREMENT,
    `employee_id` 	      bigint 	      NOT NULL,
    `skill_name`          varchar(30)   NOT NULL,
    `skill_level`         ENUM(' Novice','Advanced Beginner','Competent',' Proficient',' Expert') NOT NULL,
    `date_acquired` 	    date 	        DEFAULT NULL,
    `date_created` 	      timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	    timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`employee_skill_id`),

    KEY `index_employee_skills_employee_id`(`employee_id`),
    KEY `index_employee_skills_skill_name`(`skill_name`),
    KEY `index_employee_skills_skill_level`(`skill_level`),
    KEY `index_employee_skills_date_acquired`(`date_acquired`),
    KEY `index_employee_skills_date_created`(`date_created`),
    KEY `index_employee_skills_date_modified`(`date_modified`),

    UNIQUE KEY `uindex_employee_skills_employee_id_skill_name`(`employee_id`,`skill_name`),

    KEY `fk_employees_employee_skills_employee_id` (`employee_id`),
    CONSTRAINT `fk_employees_employee_skills_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    KEY `fk_skills_employee_skills_skill_name` (`skill_name`),
    CONSTRAINT `fk_skills_employee_skills_skill_name` FOREIGN KEY (`skill_name`) REFERENCES `skills` (`skill_name`) ON DELETE RESTRICT ON UPDATE CASCADE
    );

    DROP TABLE IF EXISTS `dependants`;
    CREATE TABLE `dependants` (
    `dependant_id`	              bigint	 		  NOT NULL AUTO_INCREMENT,
    `employee_id` 	              bigint 	      NOT NULL,
    `first_name` 	                varchar(30) 	NOT NULL,
    `last_name` 	                varchar(30) 	NOT NULL,
    `gender`                      varchar(30) 	NOT NULL,
    `relationship`                ENUM(' Father','Mother','Spouse',' Sister','Brother',' Daughter','Son','Extended Family','Friend') NOT NULL,
    `relationship_description`    ENUM('Next of Kin','Family','Friend') NOT NULL,
    `date_of_birth` 	            date 	        NOT NULL,
    `id_number` 	                varchar(30) 	DEFAULT NULL,
    `phone_number` 	              varchar(30) 	DEFAULT NULL,
    `email_address` 	            varchar(30) 	DEFAULT NULL,
    `date_created` 	              timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	            timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`dependant_id`),

    KEY `index_dependants_employee_id`(`employee_id`),
    KEY `index_dependants_gender`(`gender`),
    KEY `index_dependants_relationship`(`relationship`),
    KEY `index_dependants_relationship_description`(`relationship_description`),
    KEY `index_dependants_id_number`(`id_number`),
    KEY `index_dependants_phone_number`(`phone_number`),
    KEY `index_dependants_email_address`(`email_address`),
    KEY `index_dependants_date_created`(`date_created`),
    KEY `index_dependants_date_modified`(`date_modified`),

    UNIQUE KEY `uindex_dependants_dependant_id_employee_id` (`dependant_id`,`employee_id`),

    KEY `fk_employees_dependants_employee_id` (`employee_id`),
    CONSTRAINT `fk_employees_dependants_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    KEY `fk_genders_dependants_gender` (`gender`),
    CONSTRAINT `fk_genders_dependants_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE
    );


    DROP TABLE IF EXISTS `designations`;
    CREATE TABLE `designations` (
    `designation`                 varchar(30) 	NOT NULL,
    `designation_description`     varchar(30) 	DEFAULT NULL,
    `date_created`                timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`               timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`designation`),

    KEY `index_designations_date_created`(`date_created`),
    KEY `index_designations_date_modified`(`date_modified`)
    );


    DROP TABLE IF EXISTS `employee_designations`;
    CREATE TABLE `employee_designations`(
    `employee_designation_id`   bigint	 		  NOT NULL AUTO_INCREMENT,
    `employee_id` 	            bigint 	      NOT NULL,
    `designation`               varchar(30) 	NOT NULL,
    `designation_start_date`    date 	        NOT NULL,
    `designation_end_date` 	    date 	        NOT NULL,
    `date_created` 	            timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	          timestamp 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`employee_designation_id`),

    KEY `index_employee_designations_designation_start_date`(`designation_start_date`),
    KEY `index_employee_designations_designation_end_date`(`designation_end_date`),
    KEY `index_employee_designations_date_created`(`date_created`),
    KEY `index_employee_designations_date_modified`(`date_modified`),

    UNIQUE KEY `uindex_employee_designations_employee_id_designation`(`employee_id`,`designation`),

    KEY `fk_employees_employee_designations_employee_id` (`employee_id`),
    CONSTRAINT `fk_employees_employee_designations_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    KEY `fk_designations_employee_designations_designation` (`designation`),
    CONSTRAINT `fk_designations_employee_designations_designation` FOREIGN KEY (`designation`) REFERENCES `designations` (`designation`) ON DELETE RESTRICT ON UPDATE CASCADE
    );


    DROP TABLE IF EXISTS `projects`;
    CREATE TABLE `projects` (
    `project_id`            bigint	 		  NOT NULL AUTO_INCREMENT,
    `project_start_date`    date 	        NOT NULL,
    `project_title` 			  varchar(30) 	NOT NULL,
    `project_description`   varchar(30) 	NOT NULL,
    `project_location` 	    varchar(30) 	NOT NULL,
    `project_end_date`      date 	        NOT NULL,
    `date_created` 		      timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 		    timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`project_id`),

    KEY `index_projects_project_start_date`(`project_start_date`),
    KEY `index_projects_project_end_date`(`project_end_date`),
    KEY `index_projects_date_created`(`date_created`),
    KEY `index_projects_date_modified`(`date_modified`)
    ) ;


    DROP TABLE IF EXISTS `tasks`;
    CREATE TABLE `tasks` (
    `task_id`                 bigint	 		  NOT NULL AUTO_INCREMENT,
    `employee_id` 	          bigint 	      NOT NULL,
    `project_id`              bigint	 		  NOT NULL,
    `task_description`        varchar(30) 	NOT NULL,
    `task_start_date`         date 	        NOT NULL,
    `task_completion_date`    date 	        NOT NULL,
    `date_created` 		        timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 		      timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`task_id`),

    KEY `index_tasks_task_start_date`(`task_start_date`),
    KEY `index_tasks_task_completion_date`(`task_completion_date`),
    KEY `index_tasks_date_created`(`date_created`),
    KEY `index_tasks_date_modified`(`date_modified`),

    KEY `fk_employees_tasks_employee_id` (`employee_id`),
    CONSTRAINT `fk_employees_tasks_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    KEY `fk_projects_tasks_project_id` (`project_id`),
    CONSTRAINT `fk_projects_tasks_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ;