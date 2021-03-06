DROP DATABASE IF EXISTS `online_exam`;
CREATE DATABASE `online_exam`;

USE `online_exam`;


DROP TABLE IF EXISTS `streams`;
CREATE TABLE `streams`
(
    `stream_name`   varchar(30) NOT NULL,
    `date_created`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`stream_name`),

    KEY `index_streams_date_created` (`date_created`),
    KEY `index_streams_date_modified` (`date_modified`)
);

INSERT INTO streams (stream_name)
VALUES ('East'),
       ('West'),
       ('North'),
       ('South'),
       ('Red'),
       ('Yellow'),
       ('Blue'),
       ('Green');


DROP TABLE IF EXISTS `class_names`;
CREATE TABLE `class_names`
(
    `class_name`    varchar(30) NOT NULL,
    `date_created`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`class_name`),

    KEY `index_class_names_date_created` (`date_created`),
    KEY `index_class_names_date_modified` (`date_modified`)
);

INSERT INTO class_names (class_name)
VALUES ('Class 8'),
       ('Class 7'),
       ('Class 6'),
       ('Class 5'),
       ('Class 4'),
       ('Class 3'),
       ('Class 2'),
       ('Class 1');


DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`
(
    `class_id`          bigint      NOT NULL AUTO_INCREMENT,
    `class_name`        varchar(30) NOT NULL,
    `stream_name`       varchar(30)          DEFAULT NULL,
    `class_description` varchar(30)          DEFAULT NULL,
    `date_created`      timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`class_id`),

    KEY `index_classes_class_name` (`class_name`),
    KEY `index_classes_stream_name` (`stream_name`),
    KEY `index_classes_date_created` (`date_created`),
    KEY `index_classes_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_classes_class_name_stream_name` (`class_name`, `stream_name`),

    CONSTRAINT `fk_class_names_classes_class_name` FOREIGN KEY (`class_name`) REFERENCES `class_names` (`class_name`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_streams_classes_stream_name` FOREIGN KEY (`stream_name`) REFERENCES `streams` (`stream_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO classes (class_name, stream_name)
VALUES ('Class 8', 'West'),
       ('Class 8', 'East'),
       ('Class 7', 'West'),
       ('Class 7', 'East'),
       ('Class 6', 'West'),
       ('Class 6', 'East'),
       ('Class 5', 'West'),
       ('Class 5', 'East');


DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects`
(
    `subject_name`  varchar(30) NOT NULL,
    `date_created`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`subject_name`),

    KEY `index_subjects_date_created` (`date_created`),
    KEY `index_subjects_date_modified` (`date_modified`)
);

INSERT INTO subjects (subject_name)
VALUES ('Maths'),
       ('English'),
       ('Kiswahili'),
       ('Science'),
       ('Social Studies'),
       ('CRE'),
       ('Home Science'),
       ('PE');


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

INSERT INTO genders (gender)
VALUES ('Male'),
       ('Female');


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


DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`
(
    `teacher_id`           bigint      NOT NULL AUTO_INCREMENT,
    `first_name`           varchar(30) NOT NULL,
    `last_name`            varchar(30) NOT NULL,
    `designation`          varchar(30)          DEFAULT NULL,
    `gender`               varchar(30) NOT NULL,
    `identification_type`  varchar(30) NOT NULL,
    `identification_value` varchar(30) NOT NULL,
    `phone_number`         varchar(30) NOT NULL,
    `email_address`        varchar(30) NOT NULL,
    `date_created`         timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`teacher_id`),

    KEY `index_teachers_designation` (`designation`),
    KEY `index_teachers_gender` (`gender`),
    KEY `index_teachers_date_created` (`date_created`),
    KEY `index_teachers_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_teachers_identification_value` (`identification_value`),
    UNIQUE KEY `uindex_teachers_phone_number` (`phone_number`),
    UNIQUE KEY `uindex_teachers_email_address` (`email_address`),

    CONSTRAINT `fk_genders_teachers_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_identification_types_teachers_identification_type` FOREIGN KEY (`identification_type`) REFERENCES `identification_types` (`identification_type`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO teachers (first_name, last_name, designation, gender, identification_type, identification_value,
                      phone_number, email_address)
VALUES ('Firstname1', 'Lastname1', 'HeadMaster', 'Male', 'id_number', '12345A', '254712123456', 'f1l1@gmail.com'),
       ('Firstname2', 'Lastname2', 'Deputy-HeadMaster', 'Female', 'id_number', '12345B', '254713123456',
        'f2l2@gmail.com'),
       ('Firstname3', 'Lastname3', 'Games Master', 'Male', 'id_number', '12345C', '254714123456', 'f3l3@gmail.com'),
       ('Firstname4', 'Lastname4', 'Class Teacher 8', 'Male', 'id_number', '12345D', '254715123456', 'f4l4@gmail.com'),
       ('Firstname5', 'Lastname5', 'Class Teacher 7', 'Female', 'id_number', '12345E', '254716123456',
        'f5l5@gmail.com'),
       ('Firstname6', 'Lastname6', 'Class Teacher 6', 'FeMale', 'id_number', '12345F', '254717123456',
        'f6l6@gmail.com'),
       ('Firstname7', 'Lastname7', 'Class Teacher 5', 'Male', 'id_number', '12345G', '254718123456', 'f7l7@gmail.com'),
       ('Firstname8', 'Lastname8', 'Class Teacher 4', 'Female', 'id_number', '12345H', '254719123456',
        'f8l8@gmail.com'),
       ('Firstname9', 'Lastname9', 'Class Teacher 3', 'Male', 'id_number', '12345I', '254720123456', 'f9l9@gmail.com'),
       ('Firstname10', 'Lastname10', 'Class Teacher 2', 'Male', 'id_number', '12345J', '254721123456',
        'f10l10@gmail.com'),
       ('Firstname11', 'Lastname11', 'Class Teacher 1', 'Female', 'id_number', '12345K', '254722123456',
        'f11l11@gmail.com');


DROP TABLE IF EXISTS `teacher_class_subject`;
CREATE TABLE `teacher_class_subject`
(
    `teacher_class_subject_id` bigint      NOT NULL AUTO_INCREMENT,
    `class_id`                 bigint      NOT NULL,
    `teacher_id`               bigint      NOT NULL,
    `subject_name`             varchar(30) NOT NULL,
    `description`              varchar(50)          DEFAULT NULL,
    `date_created`             timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`            timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`teacher_class_subject_id`),

    KEY `index_teacher_class_subject_class_id` (`class_id`),
    KEY `index_teacher_class_subject_teacher_id` (`teacher_id`),
    KEY `index_teacher_class_subject_subject_name` (`subject_name`),
    KEY `index_teacher_class_subject_date_created` (`date_created`),
    KEY `index_teacher_class_subject_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_teacher_class_subject_class_id_teacher_id_subject_name` (`class_id`, `teacher_id`, `subject_name`),

    CONSTRAINT `fk_classes_teacher_class_subject_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_teachers_teacher_class_subject_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_subjects_teacher_class_subject_subject_name` FOREIGN KEY (`subject_name`) REFERENCES `subjects` (`subject_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO teacher_class_subject (class_id, teacher_id, subject_name, description)
VALUES (1, 1, 'Maths', 'description1'),
       (4, 1, 'Science', 'description2'),
       (5, 1, 'Maths', 'description3'),
       (1, 2, 'English', 'description4'),
       (4, 2, 'English', 'description5'),
       (5, 2, 'English', 'description6');


DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents`
(
    `parent_id`            bigint      NOT NULL AUTO_INCREMENT,
    `first_name`           varchar(30) NOT NULL,
    `last_name`            varchar(30) NOT NULL,
    `gender`               varchar(30) NOT NULL,
    `identification_type`  varchar(30) NOT NULL,
    `identification_value` varchar(30) NOT NULL,
    `phone_number`         varchar(30) NOT NULL,
    `email_address`        varchar(30) NOT NULL,
    `date_created`         timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`parent_id`),

    KEY `index_parents_gender` (`gender`),
    KEY `index_parents_phone_number` (`phone_number`),
    KEY `index_parents_email_address` (`email_address`),
    KEY `index_parents_date_created` (`date_created`),
    KEY `index_parents_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_parents_id_number` (`identification_value`),

    CONSTRAINT `fk_genders_parents_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_identification_types_parents_identification_type` FOREIGN KEY (`identification_type`) REFERENCES `identification_types` (`identification_type`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO parents (first_name, last_name, gender, identification_type, identification_value, phone_number,
                     email_address)
VALUES ('Firstname1', 'Lastname1', 'Male', 'id_number', '12345A', '254712123456', 'pf1l1@gmail.com'),
       ('Firstname2', 'Lastname2', 'Female', 'id_number', '12345B', '254713123456', 'pf2l2@gmail.com'),
       ('Firstname3', 'Lastname3', 'Male', 'id_number', '12345C', '254714123456', 'pf3l3@gmail.com'),
       ('Firstname4', 'Lastname4', 'Male', 'id_number', '12345D', '254715123456', 'pf4l4@gmail.com'),
       ('Firstname5', 'Lastname5', 'Female', 'id_number', '12345E', '254716123456', 'pf5l5@gmail.com'),
       ('Firstname6', 'Lastname6', 'FeMale', 'id_number', '12345F', '254717123456', 'pf6l6@gmail.com'),
       ('Firstname7', 'Lastname7', 'Male', 'id_number', '12345G', '254718123456', 'pf7l7@gmail.com'),
       ('Firstname8', 'Lastname8', 'Female', 'id_number', '12345H', '254719123456', 'pf8l8@gmail.com'),
       ('Firstname9', 'Lastname9', 'Male', 'id_number', '12345I', '254720123456', 'pf9l9@gmail.com'),
       ('Firstname10', 'Lastname10', 'Male', 'id_number', '12345J', '254721123456', 'pf10l10@gmail.com'),
       ('Firstname11', 'Lastname11', 'Female', 'id_number', '12345K', '254722123456', 'pf11l11@gmail.com');


DROP TABLE IF EXISTS `pupils`;
CREATE TABLE `pupils`
(
    `pupil_id`      bigint                     NOT NULL AUTO_INCREMENT,
    `class_id`      bigint                     NOT NULL,
    `first_name`    varchar(30)                NOT NULL,
    `last_name`     varchar(30)                NOT NULL,
    `gender`        varchar(30)                NOT NULL,
    `date_of_birth` date                       NOT NULL,
    `status`        ENUM ('ACTIVE','INACTIVE') NOT NULL,
    `date_created`  timestamp                  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` timestamp                  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`pupil_id`),

    KEY `index_pupils_class_id` (`class_id`),
    KEY `index_pupils_gender` (`gender`),
    KEY `index_pupils_date_of_birth` (`date_of_birth`),
    KEY `index_pupils_status` (`status`),
    KEY `index_pupils_date_created` (`date_created`),
    KEY `index_pupils_date_modified` (`date_modified`),

    CONSTRAINT `fk_genders_pupils_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_classes_pupils_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO pupils (class_id, first_name, last_name, gender, date_of_birth, status)
VALUES (1, 'Firstname101', 'Lastname101', 'Male', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname102', 'Lastname102', 'Female', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname103', 'Lastname103', 'Male', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname104', 'Lastname104', 'Male', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname105', 'Lastname105', 'Female', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname106', 'Lastname106', 'FeMale', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname107', 'Lastname107', 'Male', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname108', 'Lastname108', 'Female', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname109', 'Lastname109', 'Male', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname1010', 'Lastnamed1010', 'Male', '2021-10-05', 'ACTIVE'),
       (1, 'Firstname1011', 'Lastname1011', 'Female', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname201', 'Lastname201', 'Male', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname202', 'Lastname202', 'Female', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname203', 'Lastname203', 'Male', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname204', 'Lastname204', 'Male', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname205', 'Lastname205', 'Female', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname206', 'Lastname206', 'FeMale', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname207', 'Lastname207', 'Male', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname208', 'Lastname208', 'Female', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname209', 'Lastname209', 'Male', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname2010', 'Lastname2010', 'Male', '2021-10-05', 'ACTIVE'),
       (2, 'Firstname2011', 'Lastname2011', 'Female', '2021-10-05', 'ACTIVE');


DROP TABLE IF EXISTS `pupil_parent`;
CREATE TABLE `pupil_parent`
(
    `pupil_parent_id` bigint      NOT NULL AUTO_INCREMENT,
    `pupil_id`        bigint      NOT NULL,
    `parent_id`       bigint      NOT NULL,
    `description`     varchar(50) NULL,
    `date_created`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`pupil_parent_id`),

    KEY `index_pupil_parent_pupil_id` (`pupil_id`),
    KEY `index_pupil_parent_parent_id` (`parent_id`),
    KEY `index_pupil_parent_date_created` (`date_created`),
    KEY `index_pupil_parent_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_pupil_parent_pupil_id_parent_id` (`pupil_id`, `parent_id`),

    CONSTRAINT `fk_pupils_pupil_parent_pupil_id` FOREIGN KEY (`pupil_id`) REFERENCES `pupils` (`pupil_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_parents_pupil_parent_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO pupil_parent (pupil_id, parent_id, description)
VALUES (1, 1, 'description1'),
       (1, 2, 'description2'),
       (2, 3, 'description3'),
       (3, 4, 'description4'),
       (3, 5, 'description5'),
       (4, 6, 'description6');


DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms`
(
    `term_name`        varchar(30) NOT NULL,
    `term_description` varchar(30) NOT NULL,
    `date_created`     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`term_name`),

    KEY `index_terms_date_created` (`date_created`),
    KEY `index_terms_date_modified` (`date_modified`)
);

INSERT INTO terms (term_name, term_description)
VALUES ('Term12021', '04January2021-15April2021'),
       ('Term22021', '04May2021-15August2021'),
       ('Term32021', '04September2021-15November2021');


DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams`
(
    `exam_id`         bigint      NOT NULL AUTO_INCREMENT,
    `teacher_id`      bigint      NOT NULL,
    `subject_name`    varchar(30) NOT NULL,
    `class_name`      varchar(30) NOT NULL,
    `term_name`       varchar(30) NOT NULL,
    `exam_title`      varchar(50) NOT NULL,
    `exam_date`       date        NOT NULL,
    `exam_duration`   time        NOT NULL,
    `total_questions` varchar(50) NOT NULL,
    `date_created`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`exam_id`),

    KEY `index_exams_teacher_id` (`teacher_id`),
    KEY `index_exams_subject_name` (`subject_name`),
    KEY `index_exams_class_name` (`class_name`),
    KEY `index_exams_exam_date` (`exam_date`),
    KEY `index_exams_date_created` (`date_created`),
    KEY `index_exams_date_modified` (`date_modified`),

    CONSTRAINT `fk_teachers_exams_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_subjects_exams_subject_name` FOREIGN KEY (`subject_name`) REFERENCES `subjects` (`subject_name`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_class_names_exams_class_name` FOREIGN KEY (`class_name`) REFERENCES `class_names` (`class_name`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_terms_exams_term_name` FOREIGN KEY (`term_name`) REFERENCES `terms` (`term_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO exams (teacher_id, subject_name, class_name, term_name, exam_title, exam_date, exam_duration,
                   total_questions)
VALUES (1, 'Maths', 'Class 8', 'Term12021', 'exam_title1', '2021-10-05', ' 03:00:00', 25),
       (2, 'Maths', 'Class 8', 'Term12021', 'exam_title2', '2021-10-05', ' 03:00:00', 25),
       (3, 'Maths', 'Class 8', 'Term12021', 'exam_title3', '2021-10-05', ' 03:00:00', 25),
       (4, 'Maths', 'Class 8', 'Term12021', 'exam_title4', '2021-10-05', ' 03:00:00', 25),
       (5, 'Maths', 'Class 8', 'Term12021', 'exam_title5', '2021-10-05', ' 03:00:00', 25);


DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`
(
    `question_id`          bigint      NOT NULL AUTO_INCREMENT,
    `exam_id`              bigint      NOT NULL,
    `question_description` varchar(50) NOT NULL,
    `marks`                varchar(50) NOT NULL,
    `date_created`         timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`question_id`),

    KEY `index_questions_exam_id` (`exam_id`),
    KEY `index_questions_date_created` (`date_created`),
    KEY `index_questions_date_modified` (`date_modified`),

    CONSTRAINT `fk_exams_questions_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP PROCEDURE IF EXISTS generate_questions;
DELIMITER $$
CREATE PROCEDURE generate_questions()
BEGIN
    DECLARE i INT DEFAULT 1;

    -- exam_id = 1 25 question
    WHILE i < 26
        DO
            INSERT INTO `questions` (`exam_id`, `question_description`, `marks`)
            VALUES (1, concat('question_description - ', i), 2);
            SET i = i + 1;
        END WHILE;

    -- exam_id = 2 25 question
    WHILE i < 51
        DO
            INSERT INTO `questions` (`exam_id`, `question_description`, `marks`)
            VALUES (2, concat('question_description - ', i), 2);
            SET i = i + 1;
        END WHILE;

    -- exam_id = 3 25 question
    WHILE i < 76
        DO
            INSERT INTO `questions` (`exam_id`, `question_description`, `marks`)
            VALUES (3, concat('question_description - ', i), 2);
            SET i = i + 1;
        END WHILE;
END$$
DELIMITER ;
CALL generate_questions();


DROP TABLE IF EXISTS `choices`;
CREATE TABLE `choices`
(
    `choice_id`          bigint                   NOT NULL AUTO_INCREMENT,
    `question_id`        bigint                   NOT NULL,
    `choice_label`       varchar(50)              NOT NULL,
    `choice_description` varchar(50)              NOT NULL,
    `remark`             ENUM ('WRONG','CORRECT') NOT NULL,
    `date_created`       timestamp                NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`      timestamp                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`choice_id`),

    KEY `index_choices_question_id` (`question_id`),
    KEY `index_choices_choice_label` (`choice_label`),
    KEY `index_choices_remark` (`remark`),
    KEY `index_choices_date_created` (`date_created`),
    KEY `index_choices_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_choices_question_id_choice_label` (`question_id`, `choice_label`),

    CONSTRAINT `fk_questions_choices_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP PROCEDURE IF EXISTS generate_choices;
DELIMITER $$
CREATE PROCEDURE generate_choices()
BEGIN
    DECLARE i INT DEFAULT 1;

    -- exam 1 choices***
    WHILE i < 26
        DO
            INSERT INTO `choices` (`question_id`, `choice_label`, `choice_description`, `remark`)
            VALUES (i, 'A', concat('choice_description - ', i), 'WRONG'),
                   (i, 'B', concat('choice_description - ', i), 'WRONG'),
                   (i, 'C', concat('choice_description - ', i), 'CORRECT'),
                   (i, 'D', concat('choice_description - ', i), 'WRONG');
            SET i = i + 1;
        END WHILE;

    -- exam 2 choices***
    WHILE i < 51
        DO
            INSERT INTO `choices` (`question_id`, `choice_label`, `choice_description`, `remark`)
            VALUES (i, 'A', concat('choice_description - ', i), 'WRONG'),
                   (i, 'B', concat('choice_description - ', i), 'CORRECT'),
                   (i, 'C', concat('choice_description - ', i), 'WRONG'),
                   (i, 'D', concat('choice_description - ', i), 'WRONG');
            SET i = i + 1;
        END WHILE;

    -- exam 3 choices***
    WHILE i < 76
        DO
            INSERT INTO `choices` (`question_id`, `choice_label`, `choice_description`, `remark`)
            VALUES (i, 'A', concat('choice_description - ', i), 'WRONG'),
                   (i, 'B', concat('choice_description - ', i), 'WRONG'),
                   (i, 'C', concat('choice_description - ', i), 'CORRECT'),
                   (i, 'D', concat('choice_description - ', i), 'WRONG');
            SET i = i + 1;
        END WHILE;
END$$
DELIMITER ;
CALL generate_choices();


DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`
(
    `answer_id`     bigint    NOT NULL AUTO_INCREMENT,
    `pupil_id`      bigint    NOT NULL,
    `question_id`   bigint    NOT NULL,
    `choice_id`     bigint    NOT NULL,
    `date_created`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`answer_id`),

    KEY `index_answers_pupil_id` (`pupil_id`),
    KEY `index_answers_question_id` (`question_id`),
    KEY `index_answers_date_created` (`date_created`),
    KEY `index_answers_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_answers_pupil_id_question_id` (`pupil_id`, `question_id`),

    CONSTRAINT `fk_pupils_answers_pupil_id` FOREIGN KEY (`pupil_id`) REFERENCES `pupils` (`pupil_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_questions_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_choices_answers_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `choices` (`choice_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP PROCEDURE IF EXISTS generate_answers;
DELIMITER $$
CREATE PROCEDURE generate_answers()
BEGIN
    DECLARE i INT DEFAULT 1;

    -- exam 1 answers for all 22 students *
    WHILE i < 23
        DO
            INSERT INTO `answers` (`pupil_id`, `question_id`, `choice_id`)
            VALUES (i, 1, CAST((RAND() * (4 - 1) + 1) AS SIGNED)),
                   (i, 2, CAST((RAND() * (8 - (4 + 1)) + (4 + 1)) AS SIGNED)),
                   (i, 3, CAST((RAND() * (12 - (8 + 1)) + (8 + 1)) AS SIGNED)),
                   (i, 4, CAST((RAND() * (16 - (12 + 1)) + (12 + 1)) AS SIGNED)),
                   (i, 5, CAST((RAND() * (20 - (16 + 1)) + (16 + 1)) AS SIGNED)),
                   (i, 6, CAST((RAND() * (24 - (20 + 1)) + (20 + 1)) AS SIGNED)),
                   (i, 7, CAST((RAND() * (28 - (24 + 1)) + (24 + 1)) AS SIGNED)),
                   (i, 8, CAST((RAND() * (32 - (28 + 1)) + (28 + 1)) AS SIGNED)),
                   (i, 9, CAST((RAND() * (36 - (32 + 1)) + (32 + 1)) AS SIGNED)),
                   (i, 10, CAST((RAND() * (40 - (36 + 1)) + (36 + 1)) AS SIGNED)),
                   (i, 11, CAST((RAND() * (44 - (40 + 1)) + (40 + 1)) AS SIGNED)),
                   (i, 12, CAST((RAND() * (48 - (44 + 1)) + (44 + 1)) AS SIGNED)),
                   (i, 13, CAST((RAND() * (52 - (48 + 1)) + (48 + 1)) AS SIGNED)),
                   (i, 14, CAST((RAND() * (56 - (52 + 1)) + (52 + 1)) AS SIGNED)),
                   (i, 15, CAST((RAND() * (60 - (56 + 1)) + (56 + 1)) AS SIGNED)),
                   (i, 16, CAST((RAND() * (64 - (60 + 1)) + (60 + 1)) AS SIGNED)),
                   (i, 17, CAST((RAND() * (68 - (64 + 1)) + (64 + 1)) AS SIGNED)),
                   (i, 18, CAST((RAND() * (72 - (68 + 1)) + (68 + 1)) AS SIGNED)),
                   (i, 19, CAST((RAND() * (76 - (72 + 1)) + (72 + 1)) AS SIGNED)),
                   (i, 20, CAST((RAND() * (80 - (76 + 1)) + (76 + 1)) AS SIGNED)),
                   (i, 21, CAST((RAND() * (84 - (80 + 1)) + (80 + 1)) AS SIGNED)),
                   (i, 22, CAST((RAND() * (88 - (84 + 1)) + (84 + 1)) AS SIGNED)),
                   (i, 23, CAST((RAND() * (92 - (88 + 1)) + (88 + 1)) AS SIGNED)),
                   (i, 24, CAST((RAND() * (96 - (92 + 1)) + (92 + 1)) AS SIGNED)),
                   (i, 25, CAST((RAND() * (100 - (96 + 1)) + (96 + 1)) AS SIGNED));
            SET i = i + 1;
        END WHILE;

    -- exam 2 answers for all 22 students *
    set i = 1;
    WHILE i < 23
        DO
            INSERT INTO `answers` (`pupil_id`, `question_id`, `choice_id`)
            VALUES (i, 26, CAST((RAND() * (104 - 101) + 101) AS SIGNED)),
                   (i, 27, CAST((RAND() * (108 - (104 + 1)) + (104 + 1)) AS SIGNED)),
                   (i, 28, CAST((RAND() * (112 - (108 + 1)) + (108 + 1)) AS SIGNED)),
                   (i, 29, CAST((RAND() * (116 - (112 + 1)) + (112 + 1)) AS SIGNED)),
                   (i, 30, CAST((RAND() * (120 - (116 + 1)) + (116 + 1)) AS SIGNED)),
                   (i, 31, CAST((RAND() * (124 - (120 + 1)) + (120 + 1)) AS SIGNED)),
                   (i, 32, CAST((RAND() * (128 - (124 + 1)) + (124 + 1)) AS SIGNED)),
                   (i, 33, CAST((RAND() * (132 - (128 + 1)) + (128 + 1)) AS SIGNED)),
                   (i, 34, CAST((RAND() * (136 - (132 + 1)) + (132 + 1)) AS SIGNED)),
                   (i, 35, CAST((RAND() * (140 - (136 + 1)) + (136 + 1)) AS SIGNED)),
                   (i, 36, CAST((RAND() * (144 - (140 + 1)) + (140 + 1)) AS SIGNED)),
                   (i, 37, CAST((RAND() * (148 - (144 + 1)) + (144 + 1)) AS SIGNED)),
                   (i, 38, CAST((RAND() * (152 - (148 + 1)) + (148 + 1)) AS SIGNED)),
                   (i, 39, CAST((RAND() * (156 - (152 + 1)) + (152 + 1)) AS SIGNED)),
                   (i, 40, CAST((RAND() * (160 - (156 + 1)) + (156 + 1)) AS SIGNED)),
                   (i, 41, CAST((RAND() * (164 - (160 + 1)) + (160 + 1)) AS SIGNED)),
                   (i, 42, CAST((RAND() * (168 - (164 + 1)) + (164 + 1)) AS SIGNED)),
                   (i, 43, CAST((RAND() * (172 - (168 + 1)) + (168 + 1)) AS SIGNED)),
                   (i, 44, CAST((RAND() * (176 - (172 + 1)) + (172 + 1)) AS SIGNED)),
                   (i, 45, CAST((RAND() * (180 - (176 + 1)) + (176 + 1)) AS SIGNED)),
                   (i, 46, CAST((RAND() * (184 - (180 + 1)) + (180 + 1)) AS SIGNED)),
                   (i, 47, CAST((RAND() * (188 - (184 + 1)) + (184 + 1)) AS SIGNED)),
                   (i, 48, CAST((RAND() * (192 - (188 + 1)) + (188 + 1)) AS SIGNED)),
                   (i, 49, CAST((RAND() * (196 - (192 + 1)) + (192 + 1)) AS SIGNED)),
                   (i, 50, CAST((RAND() * (200 - (196 + 1)) + (196 + 1)) AS SIGNED));
            SET i = i + 1;
        END WHILE;

    -- exam 3 answers for all 22 students *
    set i = 1;
    WHILE i < 23
        DO
            INSERT INTO `answers` (`pupil_id`, `question_id`, `choice_id`)
            VALUES (i, 51, CAST((RAND() * (204 - 201) + 201) AS SIGNED)),
                   (i, 52, CAST((RAND() * (208 - (204 + 1)) + (204 + 1)) AS SIGNED)),
                   (i, 53, CAST((RAND() * (212 - (208 + 1)) + (208 + 1)) AS SIGNED)),
                   (i, 54, CAST((RAND() * (216 - (212 + 1)) + (212 + 1)) AS SIGNED)),
                   (i, 55, CAST((RAND() * (220 - (216 + 1)) + (216 + 1)) AS SIGNED)),
                   (i, 56, CAST((RAND() * (224 - (220 + 1)) + (220 + 1)) AS SIGNED)),
                   (i, 57, CAST((RAND() * (228 - (224 + 1)) + (224 + 1)) AS SIGNED)),
                   (i, 58, CAST((RAND() * (232 - (228 + 1)) + (228 + 1)) AS SIGNED)),
                   (i, 59, CAST((RAND() * (236 - (232 + 1)) + (232 + 1)) AS SIGNED)),
                   (i, 60, CAST((RAND() * (240 - (236 + 1)) + (236 + 1)) AS SIGNED)),
                   (i, 61, CAST((RAND() * (244 - (240 + 1)) + (240 + 1)) AS SIGNED)),
                   (i, 62, CAST((RAND() * (248 - (244 + 1)) + (244 + 1)) AS SIGNED)),
                   (i, 63, CAST((RAND() * (252 - (248 + 1)) + (248 + 1)) AS SIGNED)),
                   (i, 64, CAST((RAND() * (256 - (252 + 1)) + (252 + 1)) AS SIGNED)),
                   (i, 65, CAST((RAND() * (260 - (256 + 1)) + (256 + 1)) AS SIGNED)),
                   (i, 66, CAST((RAND() * (264 - (260 + 1)) + (260 + 1)) AS SIGNED)),
                   (i, 67, CAST((RAND() * (268 - (264 + 1)) + (264 + 1)) AS SIGNED)),
                   (i, 68, CAST((RAND() * (272 - (268 + 1)) + (268 + 1)) AS SIGNED)),
                   (i, 69, CAST((RAND() * (276 - (272 + 1)) + (272 + 1)) AS SIGNED)),
                   (i, 70, CAST((RAND() * (280 - (276 + 1)) + (276 + 1)) AS SIGNED)),
                   (i, 71, CAST((RAND() * (284 - (280 + 1)) + (280 + 1)) AS SIGNED)),
                   (i, 72, CAST((RAND() * (288 - (284 + 1)) + (284 + 1)) AS SIGNED)),
                   (i, 73, CAST((RAND() * (292 - (288 + 1)) + (288 + 1)) AS SIGNED)),
                   (i, 74, CAST((RAND() * (296 - (292 + 1)) + (292 + 1)) AS SIGNED)),
                   (i, 75, CAST((RAND() * (300 - (296 + 1)) + (296 + 1)) AS SIGNED));
            SET i = i + 1;
        END WHILE;

END$$
DELIMITER ;

CALL generate_answers();


DROP FUNCTION IF EXISTS full_name;
CREATE FUNCTION full_name(first_nm varchar(30), last_nm varchar(30))
    RETURNS varchar(60) DETERMINISTIC
    RETURN CONCAT(first_nm, ' ', last_nm);


DROP TABLE IF EXISTS `results`;
CREATE TABLE `results`
(
    `result_id`        bigint    NOT NULL AUTO_INCREMENT,
    `pupil_id`         bigint    NOT NULL,
    `exam_id`          bigint    NOT NULL,
    `percentage_score` bigint    NOT NULL,
    `date_created`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified`    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`result_id`),

    KEY `index_results_pupil_id` (`pupil_id`),
    KEY `index_results_exam_id` (`exam_id`),
    KEY `index_results_percentage_score` (`percentage_score`),
    KEY `index_results_date_created` (`date_created`),
    KEY `index_results_date_modified` (`date_modified`),

    UNIQUE KEY `uindex_results_pupil_id_exam_id` (`pupil_id`, `exam_id`),

    CONSTRAINT `fk_pupils_results_pupil_id` FOREIGN KEY (`pupil_id`) REFERENCES `pupils` (`pupil_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT `fk_exams_results_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP PROCEDURE IF EXISTS generate_percentage_score;
DELIMITER $$
CREATE PROCEDURE generate_percentage_score()
BEGIN
    -- exam 1 result for all 22 students *
    DECLARE i INT DEFAULT 1;
    WHILE i < 23
        DO
            SET @totalmarks = (SELECT SUM(q.marks)
                               FROM questions AS q
                                        LEFT JOIN exams AS e ON q.exam_id = e.exam_id
                               WHERE e.exam_id = 1
            );
            set @percentage_score = (SELECT ROUND(((SUM(q.marks) / @totalmarks) * 100), 1)

                                     FROM answers a
                                              RIGHT JOIN choices c ON a.choice_id = c.choice_id
                                              RIGHT JOIN questions q ON a.question_id = q.question_id
                                              RIGHT JOIN pupils p ON a.pupil_id = p.pupil_id
                                              LEFT JOIN exams e ON q.exam_id = e.exam_id

                                     WHERE e.exam_id = 1
                                       and remark = 'CORRECT'
                                       AND p.pupil_id = i
            );

            INSERT INTO `results` (`pupil_id`, `exam_id`, `percentage_score`)
            VALUES (i, 1, @percentage_score);
            SET i = i + 1;
        END WHILE;

    -- exam 2 result for all 22 students *
    SET i = 1;
    WHILE i < 23
        DO
            SET @totalmarks = (SELECT SUM(q.marks)
                               FROM questions AS q
                                        LEFT JOIN exams AS e ON q.exam_id = e.exam_id
                               WHERE e.exam_id = 2
            );
            set @percentage_score = (SELECT ROUND(((SUM(q.marks) / @totalmarks) * 100), 1)

                                     FROM answers a
                                              RIGHT JOIN choices c ON a.choice_id = c.choice_id
                                              RIGHT JOIN questions q ON a.question_id = q.question_id
                                              RIGHT JOIN pupils p ON a.pupil_id = p.pupil_id
                                              LEFT JOIN exams e ON q.exam_id = e.exam_id

                                     WHERE e.exam_id = 2
                                       and remark = 'CORRECT'
                                       AND p.pupil_id = i
            );

            INSERT INTO `results` (`pupil_id`, `exam_id`, `percentage_score`)
            VALUES (i, 2, @percentage_score);
            SET i = i + 1;
        END WHILE;

    -- exam 3 result for all 22 students *
    SET i = 1;
    WHILE i < 23
        DO
            SET @totalmarks = (SELECT SUM(q.marks)
                               FROM questions AS q
                                        LEFT JOIN exams AS e ON q.exam_id = e.exam_id
                               WHERE e.exam_id = 3
            );
            set @percentage_score = (SELECT ROUND(((SUM(q.marks) / @totalmarks) * 100), 1)

                                     FROM answers a
                                              RIGHT JOIN choices c ON a.choice_id = c.choice_id
                                              RIGHT JOIN questions q ON a.question_id = q.question_id
                                              RIGHT JOIN pupils p ON a.pupil_id = p.pupil_id
                                              LEFT JOIN exams e ON q.exam_id = e.exam_id

                                     WHERE e.exam_id = 3
                                       and remark = 'CORRECT'
                                       AND p.pupil_id = i
            );

            INSERT INTO `results` (`pupil_id`, `exam_id`, `percentage_score`)
            VALUES (i, 3, @percentage_score);
            SET i = i + 1;
        END WHILE;

END$$
DELIMITER ;
CALL generate_percentage_score();