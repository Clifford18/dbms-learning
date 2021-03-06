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
CREATE TABLE `genders`
(
    `gender`        varchar(30) NOT NULL,
    `date_created`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`gender`),

    KEY `index_genders_date_created` (`date_created`),
    KEY `index_genders_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`
(
    `department_name`        varchar(30) NOT NULL,
    `department_description` varchar(30)          DEFAULT NULL,
    `date_created`           timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`          timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`department_name`),

    KEY `index_departments_date_created` (`date_created`),
    KEY `index_departments_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `identification_types`;
CREATE TABLE `identification_types`
(
    `identification_type` varchar(30) NOT NULL,
    `date_created`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`       timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`identification_type`),

    KEY `index_identification_types_date_created` (`date_created`),
    KEY `index_identification_types_date_modified` (`date_modified`)
);

INSERT INTO identification_types (identification_type)
VALUES ('id_number'),
       ('alien_id_number'),
       ('passport_number');


DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`
(
    `employee_id`           bigint                                       NOT NULL AUTO_INCREMENT,
    `first_name`            varchar(30)                                  NOT NULL,
    `last_name`             varchar(30)                                  NOT NULL,
    `gender`                varchar(30)                                  NOT NULL,
    `identification_type`   varchar(30)                                  NOT NULL,
    `identification_value`  varchar(30)                                  NOT NULL,
    `phone_number`          bigint(30)                                   NOT NULL,
    `email_address`         varchar(30)                                  NOT NULL,
    `date_of_birth`         date                                         NOT NULL,
    `department_name`       varchar(30)                                  NOT NULL,
    `initial_basic_pay`     varchar(30)                                  NOT NULL,
    `status`                ENUM ('NEW','ACTIVE','LEAVING','TERMINATED') NOT NULL,
    `employment_start_date` varchar(30)                                  NOT NULL,
    `employment_end_date`   varchar(30)                                  NOT NULL,
    `date_created`          timestamp                                    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`         timestamp                                    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`employee_id`),

    KEY `index_employees_gender` (`gender`),
    KEY `index_employees_department_name` (`department_name`),
    KEY `index_employees_status` (`status`),
    KEY `index_employees_employment_start_date` (`employment_start_date`),
    KEY `index_employees_employment_end_date` (`employment_end_date`),
    KEY `index_employees_date_created` (`date_created`),
    KEY `index_employees_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_employees_identification_value` (`identification_value`),
    UNIQUE KEY `uindex_employees_phone_number` (`phone_number`),
    UNIQUE KEY `uindex_employees_email_address` (`email_address`),

    CONSTRAINT `fk_genders_employees_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_identification_types_employees_identification_type` FOREIGN KEY (`identification_type`) REFERENCES `identification_types` (`identification_type`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_departments_employees_gender` FOREIGN KEY (`department_name`) REFERENCES `departments` (`department_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `manager_descriptions`;
CREATE TABLE `manager_descriptions`
(
    `manager_description` varchar(30) NOT NULL,
    `date_created`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`       timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`manager_description`),

    KEY `index_manager_descriptions_date_created` (`date_created`),
    KEY `index_manager_descriptions_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers`
(
    `manager_id`          bigint      NOT NULL AUTO_INCREMENT,
    `employee_id`         bigint      NOT NULL,
    `manager_description` varchar(30) NOT NULL,
    `department_name`     varchar(30) NOT NULL,
    `manager_start_date`  date        NOT NULL,
    `manager_end_date`    date                 DEFAULT NULL,
    `date_created`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`       timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`manager_id`),

    KEY `index_managers_employee_id` (`employee_id`),
    KEY `index_managers_manager_description` (`manager_description`),
    KEY `index_managers_department_name` (`department_name`),
    KEY `index_managers_manager_start_date` (`manager_start_date`),
    KEY `index_managers_manager_end_date` (`manager_end_date`),
    KEY `index_managers_date_created` (`date_created`),
    KEY `index_managers_date_modified` (`date_modified`),

    CONSTRAINT `fk_employees_managers_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_manager_descriptions_managers_manager_description` FOREIGN KEY (`manager_description`) REFERENCES `manager_descriptions` (`manager_description`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_departments_managers_department_name` FOREIGN KEY (`department_name`) REFERENCES `departments` (`department_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `performance_reviews`;
CREATE TABLE `performance_reviews`
(
    `performance_review_id` bigint      NOT NULL AUTO_INCREMENT,
    `employee_id`           bigint      NOT NULL,
    `date_of_review`        date        NOT NULL,
    `manager_id`            bigint      NOT NULL,
    `comment_by_employee`   varchar(30) NOT NULL,
    `comment_by_manager`    varchar(30) NOT NULL,
    `date_created`          timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`         timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`performance_review_id`),

    KEY `index_performance_reviews_employee_id` (`employee_id`),
    KEY `index_performance_reviews_date_of_review` (`date_of_review`),
    KEY `index_performance_reviews_manager_id` (`manager_id`),
    KEY `index_performance_reviews_date_created` (`date_created`),
    KEY `index_performance_reviews_date_modified` (`date_modified`),

    CONSTRAINT `fk_employees_performance_reviews_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_managers_performance_reviews_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`
(
    `course_name`        varchar(30) NOT NULL,
    `course_description` varchar(30) NOT NULL,
    `course_institution` varchar(30) NOT NULL,
    `course_cost`        varchar(30) NOT NULL,
    `course_duration`    varchar(30) NOT NULL,
    `date_created`       timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`      timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`course_name`),

    KEY `index_courses_date_created` (`date_created`),
    KEY `index_courses_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `training_histories`;
CREATE TABLE `training_histories`
(
    `training_history_id`      bigint      NOT NULL AUTO_INCREMENT,
    `employee_id`              bigint      NOT NULL,
    `course_name`              varchar(30) NOT NULL,
    `training_start_date`      varchar(30) NOT NULL,
    `training_description`     varchar(30)          DEFAULT NULL,
    `training_completion_date` varchar(30) NOT NULL,
    `date_created`             timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`            timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`training_history_id`),

    KEY `index_training_histories_training_start_date` (`training_start_date`),
    KEY `index_training_histories_training_completion_date` (`training_completion_date`),
    KEY `index_training_histories_date_created` (`date_created`),
    KEY `index_training_histories_date_modified` (`date_modified`),

    CONSTRAINT `fk_employees_training_histories_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_courses_training_histories_course_name` FOREIGN KEY (`course_name`) REFERENCES `courses` (`course_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills`
(
    `skill_name`        varchar(30) NOT NULL,
    `skill_description` varchar(30)          DEFAULT NULL,
    `date_created`      timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`skill_name`),

    KEY `index_skills_date_created` (`date_created`),
    KEY `index_skills_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `employee_skills`;
CREATE TABLE `employee_skills`
(
    `employee_skill_id` bigint                                                                   NOT NULL AUTO_INCREMENT,
    `employee_id`       bigint                                                                   NOT NULL,
    `skill_name`        varchar(30)                                                              NOT NULL,
    `skill_level`       ENUM (' NOVICE','ADVANCED BEGINNER','COMPETENT',' PROFICIENT',' EXPERT') NOT NULL,
    `date_acquired`     date                                                                              DEFAULT NULL,
    `date_created`      timestamp                                                                NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`     timestamp                                                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`employee_skill_id`),

    KEY `index_employee_skills_employee_id` (`employee_id`),
    KEY `index_employee_skills_skill_name` (`skill_name`),
    KEY `index_employee_skills_skill_level` (`skill_level`),
    KEY `index_employee_skills_date_acquired` (`date_acquired`),
    KEY `index_employee_skills_date_created` (`date_created`),
    KEY `index_employee_skills_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_employee_skills_employee_id_skill_name` (`employee_id`, `skill_name`),

    CONSTRAINT `fk_employees_employee_skills_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_skills_employee_skills_skill_name` FOREIGN KEY (`skill_name`) REFERENCES `skills` (`skill_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `dependants`;
CREATE TABLE `dependants`
(
    `dependant_id`             bigint                                                                                              NOT NULL AUTO_INCREMENT,
    `employee_id`              bigint                                                                                              NOT NULL,
    `first_name`               varchar(30)                                                                                         NOT NULL,
    `last_name`                varchar(30)                                                                                         NOT NULL,
    `gender`                   varchar(30)                                                                                         NOT NULL,
    `relationship`             ENUM (' FATHER','MOTHER','SPOUSE',' SISTER','BROTHER',' DAUGHTER','SON','EXTENDED FAMILY','FRIEND') NOT NULL,
    `relationship_description` ENUM ('NEXT OF KIN','FAMILY','FRIEND')                                                              NOT NULL,
    `date_of_birth`            date                                                                                                NOT NULL,
    `identification_type`      varchar(30)                                                                                         NOT NULL,
    `identification_value`     varchar(30)                                                                                         NOT NULL,
    `phone_number`             bigint(30)                                                                                          NOT NULL,
    `email_address`            varchar(30)                                                                                                  DEFAULT NULL,
    `date_created`             timestamp                                                                                           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`            timestamp                                                                                           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`dependant_id`),

    KEY `index_dependants_employee_id` (`employee_id`),
    KEY `index_dependants_gender` (`gender`),
    KEY `index_dependants_relationship` (`relationship`),
    KEY `index_dependants_relationship_description` (`relationship_description`),
    KEY `index_dependants_email_address` (`email_address`),
    KEY `index_dependants_date_created` (`date_created`),
    KEY `index_dependants_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_dependants_dependant_id_employee_id` (`dependant_id`, `employee_id`),
    UNIQUE KEY `uindex_dependants_identification_value` (`identification_value`),
    UNIQUE KEY `uindex_dependants_phone_number` (`phone_number`),

    CONSTRAINT `fk_employees_dependants_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_genders_dependants_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_identification_types_dependants_identification_type` FOREIGN KEY (`identification_type`) REFERENCES `identification_types` (`identification_type`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `designations`;
CREATE TABLE `designations`
(
    `designation`             varchar(30) NOT NULL,
    `designation_description` varchar(30)          DEFAULT NULL,
    `date_created`            timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`           timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`designation`),

    KEY `index_designations_date_created` (`date_created`),
    KEY `index_designations_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `employee_designations`;
CREATE TABLE `employee_designations`
(
    `employee_designation_id` bigint      NOT NULL AUTO_INCREMENT,
    `employee_id`             bigint      NOT NULL,
    `designation`             varchar(30) NOT NULL,
    `designation_start_date`  date        NOT NULL,
    `designation_end_date`    date        NOT NULL,
    `date_created`            timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`           timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`employee_designation_id`),

    KEY `index_employee_designations_designation_start_date` (`designation_start_date`),
    KEY `index_employee_designations_designation_end_date` (`designation_end_date`),
    KEY `index_employee_designations_date_created` (`date_created`),
    KEY `index_employee_designations_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_employee_designations_employee_id_designation` (`employee_id`, `designation`),

    CONSTRAINT `fk_employees_employee_designations_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_designations_employee_designations_designation` FOREIGN KEY (`designation`) REFERENCES `designations` (`designation`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`
(
    `project_id`          bigint      NOT NULL AUTO_INCREMENT,
    `project_start_date`  date        NOT NULL,
    `project_title`       varchar(30) NOT NULL,
    `project_description` varchar(30) NOT NULL,
    `project_location`    varchar(30) NOT NULL,
    `project_end_date`    date        NOT NULL,
    `date_created`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`       timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`project_id`),

    KEY `index_projects_project_start_date` (`project_start_date`),
    KEY `index_projects_project_end_date` (`project_end_date`),
    KEY `index_projects_date_created` (`date_created`),
    KEY `index_projects_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`
(
    `task_id`              bigint      NOT NULL AUTO_INCREMENT,
    `employee_id`          bigint      NOT NULL,
    `project_id`           bigint      NOT NULL,
    `task_description`     varchar(30) NOT NULL,
    `task_start_date`      date        NOT NULL,
    `task_completion_date` date        NOT NULL,
    `date_created`         timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`task_id`),

    KEY `index_tasks_task_start_date` (`task_start_date`),
    KEY `index_tasks_task_completion_date` (`task_completion_date`),
    KEY `index_tasks_date_created` (`date_created`),
    KEY `index_tasks_date_modified` (`date_modified`),

    CONSTRAINT `fk_employees_tasks_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_projects_tasks_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `earning_names`;
CREATE TABLE `earning_names`
(
    `earning_name`  varchar(30) NOT NULL,
    `date_created`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`earning_name`),

    KEY `index_earning_names_date_created` (`date_created`),
    KEY `index_earning_names_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `earnings`;
CREATE TABLE `earnings`
(
    `earning_id`          varchar(30) NOT NULL,
    `employee_id`         bigint      NOT NULL,
    `earning_name`        varchar(30) NOT NULL,
    `earning_description` varchar(30) NOT NULL,
    `earning_date`        date        NOT NULL,
    `date_created`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`       timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`earning_id`),

    KEY `index_earnings_employee_id` (`employee_id`),
    KEY `index_earnings_earning_name` (`earning_name`),
    KEY `index_earnings_earning_date` (`earning_date`),
    KEY `index_earnings_date_created` (`date_created`),
    KEY `index_earnings_date_modified` (`date_modified`),

    CONSTRAINT `fk_employees_earnings_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_earning_names_earnings_earning_name` FOREIGN KEY (`earning_name`) REFERENCES `earning_names` (`earning_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE IF EXISTS `deduction_names`;
CREATE TABLE `deduction_names`
(
    `deduction_name` varchar(30) NOT NULL,
    `date_created`   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`deduction_name`),

    KEY `index_deduction_names_date_created` (`date_created`),
    KEY `index_deduction_names_date_modified` (`date_modified`)
);


DROP TABLE IF EXISTS `deductions`;
CREATE TABLE `deductions`
(
    `deduction_id`          varchar(30) NOT NULL,
    `employee_id`           bigint      NOT NULL,
    `deduction_name`        varchar(30) NOT NULL,
    `deduction_description` varchar(30) NOT NULL,
    `deduction_date`        date        NOT NULL,
    `date_created`          timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`         timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`deduction_id`),

    KEY `index_deductions_employee_id` (`employee_id`),
    KEY `index_deductions_deduction_name` (`deduction_name`),
    KEY `index_deductions_deduction_date` (`deduction_date`),
    KEY `index_deductions_date_created` (`date_created`),
    KEY `index_deductions_date_modified` (`date_modified`),

    CONSTRAINT `fk_employees_deductions_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_deduction_names_deductions_deduction_name` FOREIGN KEY (`deduction_name`) REFERENCES `deduction_names` (`deduction_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);