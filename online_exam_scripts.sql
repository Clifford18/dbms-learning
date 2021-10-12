
DROP DATABASE IF EXISTS `online_exam`;
CREATE DATABASE `online_exam`;
USE `online_exam`;

-- -- --entities

-- stream***
-- classes***

-- subjects***
-- genders***
-- teachers***
-- -- teacher_class***

-- parents***
-- status***
-- pupils***
-- --parent_pupil**

-- terms**
-- exams**
-- questions**
-- choices**
-- answers**
DROP TABLE IF EXISTS `streams`;

CREATE TABLE `streams` (
`stream_name` 	varchar(30) 	NOT NULL,
`stream_description` 	varchar(30) 	DEFAULT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`stream_name`),

KEY `index_streams_date_created`(`date_created`),
KEY `index_streams_date_modified`(`date_modified`)
);

INSERT INTO streams (stream_name)
VALUES
('East'),
('West'),
('North'),
('South'),
('Red'),
('Yellow'),
('Blue'),
('Green');


DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
`class_id`	bigint	 		NOT NULL AUTO_INCREMENT,
`class_name` 	varchar(30) 	NOT NULL,
`stream_name` 	varchar(30) 	DEFAULT NULL,
`class_description` 	varchar(30) 	DEFAULT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`class_id`),

KEY `index_classes_date_created`(`date_created`),
KEY `index_classes_date_modified`(`date_modified`),

UNIQUE KEY `uindex_classes_class_name_stream_name` (`class_name`,`stream_name`),

KEY `fk_streams_classes_stream_name` (`stream_name`),
CONSTRAINT `fk_streams_classes_stream_name` FOREIGN KEY (`stream_name`) REFERENCES `streams` (`stream_name`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO classes (class_name, stream_name)
VALUES
('Class 8','West'),('Class 8','East'),
('Class 7','West'),('Class 7','East'),
('Class 6','West'),('Class 6','East'),
('Class 5','West'),('Class 5','East');

INSERT INTO classes (class_name)
VALUES
('Class 4'),
('Class 3'),
('Class 2'),
('Class 1');


DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
`subject_name` 	varchar(30) 	NOT NULL,
`subject_description` 	varchar(30) 	DEFAULT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`subject_name`),

KEY `index_subjects_date_created`(`date_created`),
KEY `index_subjects_date_modified`(`date_modified`)
);

INSERT INTO subjects (subject_name)
VALUES
('Maths'),
('English'),
('Kiswahili'),
('Science'),
('Social Studies'),
('CRE'),
('Home Science'),
('PE');


DROP TABLE IF EXISTS `genders`;

CREATE TABLE `genders` (
`gender`  ENUM	('Male','Female'),
`gender_description` 	varchar(30) 	DEFAULT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`gender`),

KEY `index_genders_date_created`(`date_created`),
KEY `index_genders_date_modified`(`date_modified`)
);

INSERT INTO genders (gender)
VALUES
('Male'),
('Female');


DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
`teacher_id`	bigint	 		NOT NULL AUTO_INCREMENT,
`first_name` 	varchar(30) 	NOT NULL,
`last_name` 	varchar(30) 	NOT NULL,
`designation` 	varchar(30) 	DEFAULT NULL,
`gender`  ENUM	('Male','Female'),
`id_number` 	varchar(30) 	NOT NULL,
`phone_number` 	varchar(30) 	NOT NULL,
`email_address` 	varchar(30) 	NOT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`teacher_id`),

KEY `index_teachers_phone_number`(`phone_number`),
KEY `index_teachers_email_address`(`email_address`),
KEY `index_teachers_date_created`(`date_created`),
KEY `index_teachers_date_modified`(`date_modified`),

UNIQUE KEY `uindex_teachers_id_number` (`id_number`),

KEY `fk_genders_teachers_gender` (`gender`),
CONSTRAINT `fk_genders_teachers_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO teachers (first_name, last_name, designation, gender, id_number, phone_number,email_address)
VALUES
('Firstname1', 'Lastname1', 'HeadMaster','Male','12345A','254712123456','f1l1@gmail.com'),
('Firstname2', 'Lastname2', 'Deputy-HeadMaster','Female','12345B','254713123456','f2l2@gmail.com'),
('Firstname3', 'Lastname3', 'Games Master','Male','12345C','254714123456','f3l3@gmail.com'),
('Firstname4', 'Lastname4', 'Class Teacher 8','Male','12345D','254715123456','f4l4@gmail.com'),
('Firstname5', 'Lastname5', 'Class Teacher 7','Female','12345E','254716123456','f5l5@gmail.com'),
('Firstname6', 'Lastname6', 'Class Teacher 6','FeMale','12345F','254717123456','f6l6@gmail.com'),
('Firstname7', 'Lastname7', 'Class Teacher 5','Male','12345G','254718123456','f7l7@gmail.com'),
('Firstname8', 'Lastname8', 'Class Teacher 4','Female','12345H','254719123456','f8l8@gmail.com'),
('Firstname9', 'Lastname9', 'Class Teacher 3','Male','12345I','254720123456','f9l9@gmail.com'),
('Firstname10', 'Lastname10', 'Class Teacher 2','Male','12345J','254721123456','f10l10@gmail.com'),
('Firstname11', 'Lastname11', 'Class Teacher 1','Female','12345K','254722123456','f11l11@gmail.com');


DROP TABLE IF EXISTS `teacher_class`;

CREATE TABLE `teacher_class` (
`teacher_class_id` 			bigint 			NOT NULL AUTO_INCREMENT,
`class_id` 		bigint  			NOT NULL,
`teacher_id` 		bigint  			NOT NULL,
`subject_name` 		varchar(30) 	NOT NULL,
`description`	varchar(50) 	 NULL,
`date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`teacher_class_id`),

KEY `index_teacher_class_date_created`(`date_created`),
KEY `index_teacher_class_date_modified`(`date_modified`),

KEY `fk_classes_teacher_class_class_id` (`class_id`),
CONSTRAINT `fk_classes_teacher_class_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_teachers_teacher_class_teacher_id` (`teacher_id`),
CONSTRAINT `fk_teachers_teacher_class_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_subjects_teacher_class_subject_name` (`subject_name`),
CONSTRAINT `fk_subjects_teacher_class_subject_name` FOREIGN KEY (`subject_name`) REFERENCES `subjects` (`subject_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

INSERT INTO teacher_class (class_id, teacher_id, subject_name,description)    
VALUES
(1, 1, 'Maths','description1'),
(4, 1, 'Science','description2'),
(5, 1, 'Maths','description3'),
(1, 2, 'English','description4'),
(4, 2, 'English','description5'),
(5, 2, 'English','description6');


DROP TABLE IF EXISTS `parents`;

CREATE TABLE `parents` (
`parent_id`	bigint	 		NOT NULL AUTO_INCREMENT,
`first_name` 	varchar(30) 	NOT NULL,
`last_name` 	varchar(30) 	NOT NULL,
`gender`  ENUM	('Male','Female'),
`id_number` 	varchar(30) 	NOT NULL,
`phone_number` 	varchar(30) 	NOT NULL,
`email_address` 	varchar(30) 	NOT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`parent_id`),

KEY `index_parents_phone_number`(`phone_number`),
KEY `index_parents_email_address`(`email_address`),
KEY `index_parents_date_created`(`date_created`),
KEY `index_parents_date_modified`(`date_modified`),

UNIQUE KEY `uindex_parents_id_number` (`id_number`),

KEY `fk_genders_parents_gender` (`gender`),
CONSTRAINT `fk_genders_parents_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO parents (first_name, last_name,gender,id_number,phone_number,email_address)
VALUES
('Firstname1', 'Lastname1', 'Male','12345A','254712123456','pf1l1@gmail.com'),
('Firstname2', 'Lastname2', 'Female','12345B','254713123456','pf2l2@gmail.com'),
('Firstname3', 'Lastname3', 'Male','12345C','254714123456','pf3l3@gmail.com'),
('Firstname4', 'Lastname4', 'Male','12345D','254715123456','pf4l4@gmail.com'),
('Firstname5', 'Lastname5', 'Female','12345E','254716123456','pf5l5@gmail.com'),
('Firstname6', 'Lastname6', 'FeMale','12345F','254717123456','pf6l6@gmail.com'),
('Firstname7', 'Lastname7', 'Male','12345G','254718123456','pf7l7@gmail.com'),
('Firstname8', 'Lastname8', 'Female','12345H','254719123456','pf8l8@gmail.com'),
('Firstname9', 'Lastname9', 'Male','12345I','254720123456','pf9l9@gmail.com'),
('Firstname10', 'Lastname10','Male','12345J','254721123456','pf10l10@gmail.com'),
('Firstname11', 'Lastname11','Female','12345K','254722123456','pf11l11@gmail.com');


DROP TABLE IF EXISTS `pupil_status`;

CREATE TABLE `pupil_status` (
`status`  ENUM	('Active','Inactive'),
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`status`),

KEY `index_pupil_status_date_created`(`date_created`),
KEY `index_pupil_status_date_modified`(`date_modified`)
);

INSERT INTO pupil_status (status)
VALUES
('Active'),
('Inactive');


DROP TABLE IF EXISTS `pupils`;

CREATE TABLE `pupils` (
`pupil_id`	bigint	 		NOT NULL AUTO_INCREMENT,
`class_id` 		bigint  			NOT NULL,
`first_name` 	varchar(30) 	NOT NULL,
`last_name` 	varchar(30) 	NOT NULL,
`gender`  ENUM	('Male','Female'),
`date_of_birth` 	date	NOT NULL,
`status`  ENUM	('Active','Inactive'),
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`pupil_id`),

KEY `index_pupils_date_of_birth`(`date_of_birth`),
KEY `index_pupils_date_created`(`date_created`),
KEY `index_pupils_date_modified`(`date_modified`),

KEY `fk_genders_pupils_gender` (`gender`),
CONSTRAINT `fk_genders_pupils_gender` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_pupil_status_pupils_status` (`status`),
CONSTRAINT `fk_pupil_status_pupils_status` FOREIGN KEY (`status`) REFERENCES `pupil_status` (`status`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_classes_pupils_class_id` (`class_id`),
CONSTRAINT `fk_classes_pupils_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO pupils (class_id, first_name, last_name,gender,date_of_birth,status)
VALUES
(1,'Firstname101', 'Lastname101', 'Male','2021-10-05','Active'),
(1,'Firstname102', 'Lastname102', 'Female','2021-10-05','Active'),
(1,'Firstname103', 'Lastname103', 'Male','2021-10-05','Active'),
(1,'Firstname104', 'Lastname104', 'Male','2021-10-05','Active'),
(1,'Firstname105', 'Lastname105', 'Female','2021-10-05','Active'),
(1,'Firstname106', 'Lastname106', 'FeMale','2021-10-05','Active'),
(1,'Firstname107', 'Lastname107', 'Male','2021-10-05','Active'),
(1,'Firstname108', 'Lastname108', 'Female','2021-10-05','Active'),
(1,'Firstname109', 'Lastname109', 'Male','2021-10-05','Active'),
(1,'Firstname1010', 'Lastnamed1010','Male','2021-10-05','Active'),
(1,'Firstname1011', 'Lastname1011','Female','2021-10-05','Active'),
(2,'Firstname201', 'Lastname201', 'Male','2021-10-05','Active'),
(2,'Firstname202', 'Lastname202', 'Female','2021-10-05','Active'),
(2,'Firstname203', 'Lastname203', 'Male','2021-10-05','Active'),
(2,'Firstname204', 'Lastname204', 'Male','2021-10-05','Active'),
(2,'Firstname205', 'Lastname205', 'Female','2021-10-05','Active'),
(2,'Firstname206', 'Lastname206', 'FeMale','2021-10-05','Active'),
(2,'Firstname207', 'Lastname207', 'Male','2021-10-05','Active'),
(2,'Firstname208', 'Lastname208', 'Female','2021-10-05','Active'),
(2,'Firstname209', 'Lastname209', 'Male','2021-10-05','Active'),
(2,'Firstname2010', 'Lastname2010','Male','2021-10-05','Active'),
(2,'Firstname2011', 'Lastname2011','Female','2021-10-05','Active');


DROP TABLE IF EXISTS `pupil_parent`;

CREATE TABLE `pupil_parent` (
`pupil_parent_id` 			bigint 			NOT NULL AUTO_INCREMENT,
`pupil_id` 		bigint  			NOT NULL,
`parent_id` 		bigint  			NOT NULL,
`description`	varchar(50) 	 NULL,
`date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`pupil_parent_id`),

KEY `index_pupil_parent_date_created`(`date_created`),
KEY `index_pupil_parent_date_modified`(`date_modified`),

UNIQUE KEY `uindex_pupil_parent_pupil_id_parent_id` (`pupil_id`,`parent_id`),

KEY `fk_pupils_pupil_parent_pupil_id` (`pupil_id`),
CONSTRAINT `fk_pupils_pupil_parent_pupil_id` FOREIGN KEY (`pupil_id`) REFERENCES `pupils` (`pupil_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_parents_pupil_parent_parent_id` (`parent_id`),
CONSTRAINT `fk_parents_pupil_parent_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

INSERT INTO pupil_parent (pupil_id, parent_id,description)
VALUES
(1, 1, 'description1'),
(1, 2, 'description2'),
(2, 3,'description3'),
(3, 4,'description4'),
(3, 5,'description5'),
(4, 6,'description6');


DROP TABLE IF EXISTS `terms`;

CREATE TABLE `terms` (
`term_id`	bigint	 		NOT NULL AUTO_INCREMENT,
`term_name` 	varchar(30) 	NOT NULL,
`term_description` 	varchar(30) 	NOT NULL,
`date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`term_id`),

KEY `index_terms_date_created`(`date_created`),
KEY `index_terms_date_modified`(`date_modified`),

UNIQUE KEY `uindex_terms_term_name` (`term_name`)
);

INSERT INTO terms (term_name, term_description)
VALUES 
	('Term12021','04January2021-15April2021'),
    ('Term22021','04May2021-15August2021'),
    ('Term32021','04September2021-15November2021');


DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
`exam_id` 			bigint 			NOT NULL AUTO_INCREMENT,
`teacher_id` 		bigint  			NOT NULL,
`subject_name` 		varchar(30) 	NOT NULL,
`class_id` 		bigint  			NOT NULL,
`term_name` 		varchar(30)  			NOT NULL,
`exam_title`	varchar(50) 	NOT NULL,
`exam_date`	date 	NOT NULL,
`exam_duration`	time 	NOT NULL,
`total_questions`	varchar(50) 	NOT NULL,
`date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`exam_id`),

KEY `index_exams_date_created`(`date_created`),
KEY `index_exams_date_modified`(`date_modified`),

KEY `fk_teachers_exams_teacher_id` (`teacher_id`),
CONSTRAINT `fk_teachers_exams_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_subjects_exams_subject_name` (`subject_name`),
CONSTRAINT `fk_subjects_exams_subject_name` FOREIGN KEY (`subject_name`) REFERENCES `subjects` (`subject_name`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_classes_exams_class_id` (`class_id`),
CONSTRAINT `fk_classes_exams_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_terms_exams_term_name` (`term_name`),
CONSTRAINT `fk_terms_exams_term_name` FOREIGN KEY (`term_name`) REFERENCES `terms` (`term_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

INSERT INTO exams (teacher_id, subject_name, class_id, term_name, exam_title, exam_date, exam_duration, total_questions)
VALUES 
	(1,'Maths',1,'Term12021','exam_title1','2021-10-05',' 03:00:00',25),
  (2,'Maths',2,'Term12021','exam_title2','2021-10-05',' 03:00:00',25),
  (3,'Maths',3,'Term12021','exam_title3','2021-10-05',' 03:00:00',25),
  (5,'Maths',4,'Term12021','exam_title4','2021-10-05',' 03:00:00',25),
  (6,'Maths',5,'Term12021','exam_title','2021-10-05',' 03:00:00',25);


DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
`question_id` 			bigint 			NOT NULL AUTO_INCREMENT,
`exam_id` 		bigint  			NOT NULL,
`question_description`	varchar(50) 	NOT NULL,
`marks`	varchar(50) 	NOT NULL,
`date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`question_id`),

KEY `index_questions_date_created`(`date_created`),
KEY `index_questions_date_modified`(`date_modified`),

KEY `fk_exams_questions_exam_id` (`exam_id`),
CONSTRAINT `fk_exams_questions_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

 
DROP PROCEDURE IF EXISTS generate_questions;
DELIMITER $$
CREATE PROCEDURE generate_questions()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i < 26 DO
    INSERT INTO `questions` (`exam_id`,`question_description`,`marks`) 
		VALUES (
        1,concat('question_description - ',i ),2
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
CALL generate_questions();


DROP TABLE IF EXISTS `choices`;

    CREATE TABLE `choices` (
`choice_id` 			bigint 			NOT NULL AUTO_INCREMENT,
`question_id` 		bigint  			NOT NULL,
`choice_label`	varchar(50) 	NOT NULL,
`remark`	ENUM	('Wrong','Correct'),
`date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`choice_id`),

KEY `index_choices_date_created`(`date_created`),
KEY `index_choices_date_modified`(`date_modified`),

UNIQUE KEY `uindex_choice_question_id_choice_label`(`question_id`,`choice_label`),

KEY `fk_questions_choices_question_id` (`question_id`),
CONSTRAINT `fk_questions_choices_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

DROP PROCEDURE IF EXISTS generate_choices;
DELIMITER $$
CREATE PROCEDURE generate_choices()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i < 26 DO
    INSERT INTO `choices` (`question_id`,`choice_label`,`remark`) 
		VALUES 
        (i,'A','Wrong'),
        (i,'B','Wrong'),
        (i,'C','Correct'),
        (i,'D','Wrong');
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
CALL generate_choices();


DROP TABLE IF EXISTS `answers`;

    CREATE TABLE `answers` (
`answer_id` 			bigint 			NOT NULL AUTO_INCREMENT,
`pupil_id` 		bigint  			NOT NULL,
`question_id` 		bigint  			NOT NULL,
`choice_id` 		bigint  			NOT NULL,
`date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
`date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (`answer_id`),

KEY `index_answers_date_created`(`date_created`),
KEY `index_answers_date_modified`(`date_modified`),

KEY `fk_pupils_answers_pupil_id` (`pupil_id`),
CONSTRAINT `fk_pupils_answers_pupil_id` FOREIGN KEY (`pupil_id`) REFERENCES `pupils` (`pupil_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_questions_answers_question_id` (`question_id`),
CONSTRAINT `fk_questions_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE RESTRICT ON UPDATE CASCADE,

KEY `fk_choices_answers_choice_id` (`choice_id`),
CONSTRAINT `fk_choices_answers_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `choices` (`choice_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ;	

DROP PROCEDURE IF EXISTS generate_answers;
DELIMITER $$
CREATE PROCEDURE generate_answers()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i < 23 DO
	INSERT INTO `answers` (`pupil_id`,`question_id`,`choice_id`)
			VALUES
				(i,1,CAST((RAND()*(4-1)+1) AS SIGNED)),
				(i,2,CAST((RAND()*(8-(4+1))+(4+1)) AS SIGNED)),
				(i,3,CAST((RAND()*(12-(8+1))+(8+1)) AS SIGNED)),
				(i,4,CAST((RAND()*(16-(12+1))+(12+1)) AS SIGNED)),
				(i,5,CAST((RAND()*(20-(16+1))+(16+1)) AS SIGNED)),
				(i,6,CAST((RAND()*(24-(20+1))+(20+1)) AS SIGNED)),
				(i,7,CAST((RAND()*(28-(24+1))+(24+1)) AS SIGNED)),
				(i,8,CAST((RAND()*(32-(28+1))+(28+1)) AS SIGNED)),
				(i,9,CAST((RAND()*(36-(32+1))+(32+1)) AS SIGNED)),
				(i,10,CAST((RAND()*(40-(36+1))+(36+1)) AS SIGNED)),
				(i,11,CAST((RAND()*(44-(40+1))+(40+1)) AS SIGNED)),
				(i,12,CAST((RAND()*(48-(44+1))+(44+1)) AS SIGNED)),
				(i,13,CAST((RAND()*(52-(48+1))+(48+1)) AS SIGNED)),
				(i,14,CAST((RAND()*(56-(52+1))+(52+1)) AS SIGNED)),
				(i,15,CAST((RAND()*(60-(56+1))+(56+1)) AS SIGNED)),
				(i,16,CAST((RAND()*(64-(60+1))+(60+1)) AS SIGNED)),
				(i,17,CAST((RAND()*(68-(64+1))+(64+1)) AS SIGNED)),
				(i,18,CAST((RAND()*(72-(68+1))+(68+1)) AS SIGNED)),
				(i,19,CAST((RAND()*(76-(72+1))+(72+1)) AS SIGNED)),
				(i,20,CAST((RAND()*(80-(76+1))+(76+1)) AS SIGNED)),
				(i,21,CAST((RAND()*(84-(80+1))+(80+1)) AS SIGNED)),
				(i,22,CAST((RAND()*(88-(84+1))+(84+1)) AS SIGNED)),
				(i,23,CAST((RAND()*(92-(88+1))+(88+1)) AS SIGNED)),
				(i,24,CAST((RAND()*(96-(92+1))+(92+1)) AS SIGNED)),
				(i,25,CAST((RAND()*(100-(96+1))+(96+1)) AS SIGNED));
			SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;
CALL generate_answers();

