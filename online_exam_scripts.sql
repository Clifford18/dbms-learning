
DROP DATABASE IF EXISTS `online_exam`;
CREATE DATABASE `online_exam`; 
USE `online_exam`;

-- -- --entities

-- stream*
-- classes*

-- subjects*
-- teachers*
-- -- teacher_class*

-- parents*
-- pupils*
-- --parent_pupil*

-- terms*
-- exams*
-- questions*
-- choices
-- answers
DROP TABLE IF EXISTS `streams`;

CREATE TABLE `streams` (
   `stream_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `stream_name` 	varchar(30) 	NOT NULL,
   `stream_description` 	varchar(30) 	DEFAULT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`stream_id`),
   
   UNIQUE KEY `uindex_streams_stream_name` (`stream_name`)
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
   
   PRIMARY KEY (`class_id`)
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
   `subject_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `subject_name` 	varchar(30) 	NOT NULL,
   `subject_description` 	varchar(30) 	DEFAULT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`subject_id`),
   
   UNIQUE KEY `uindex_subjects_subject_name` (`subject_name`)
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
 
DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
   `teacher_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `first_name` 	varchar(30) 	NOT NULL,
   `last_name` 	varchar(30) 	NOT NULL,
   `designation` 	varchar(30) 	DEFAULT NULL,
   `gender` 	varchar(30) 	NOT NULL,
   `id_number` 	varchar(30) 	NOT NULL,
   `phone_number` 	varchar(30) 	NOT NULL,
   `email_address` 	varchar(30) 	NOT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`teacher_id`),
   
   UNIQUE KEY `uindex_teachers_id_number` (`id_number`)
 );
 
INSERT INTO teachers (first_name, last_name, designation,gender,id_number,phone_number,email_address)
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
   `subject_id` 		bigint  			NOT NULL,
   `description`	varchar(50) 	NOT NULL,
   `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`teacher_class_id`),
   
   KEY `classes_teacher_class_fk` (`class_id`),
   CONSTRAINT `fk_classes_teacher_class_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   
   KEY `teachers_teacher_class_fk` (`teacher_id`),
   CONSTRAINT `fk_teachers_teacher_class_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   
   KEY `subjects_teacher_class_fk` (`subject_id`),
   CONSTRAINT `fk_subjects_teacher_class_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
   
 ) ;
 
DROP TABLE IF EXISTS `parents`;

CREATE TABLE `parents` (
   `parent_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `first_name` 	varchar(30) 	NOT NULL,
   `last_name` 	varchar(30) 	NOT NULL,
   `gender` 	varchar(30) 	NOT NULL,
   `id_number` 	varchar(30) 	NOT NULL,
   `phone_number` 	varchar(30) 	NOT NULL,
   `email_address` 	varchar(30) 	NOT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`parent_id`),
   
   UNIQUE KEY `uindex_parents_id_number` (`id_number`)
 );
 
DROP TABLE IF EXISTS `pupils`;

CREATE TABLE `pupils` (
   `pupil_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `class_id` 		bigint  			NOT NULL,
   `first_name` 	varchar(30) 	NOT NULL,
   `last_name` 	varchar(30) 	NOT NULL,
   `gender` 	varchar(30) 	NOT NULL,
   `date_of birth` 	time	NOT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`pupil_id`),
    
   KEY `classes_pupils_fk` (`class_id`),
   CONSTRAINT `fk_classes_pupils` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
 );
 
 DROP TABLE IF EXISTS `pupil_parent`;
            
CREATE TABLE `pupil_parent` (
   `pupil_parent_id` 			bigint 			NOT NULL AUTO_INCREMENT,
   `pupil_id` 		bigint  			NOT NULL,
   `parent_id` 		bigint  			NOT NULL,
   `description`	varchar(50) 	NOT NULL,
   `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`pupil_parent_id`),
   
   KEY `pupils_pupil_parent_fk` (`pupil_id`),
   CONSTRAINT `fk_pupils_pupil_parent_pupil_id` FOREIGN KEY (`pupil_id`) REFERENCES `pupils` (`pupil_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   
   KEY `parents_pupil_parent_fk` (`parent_id`),
   CONSTRAINT `fk_parents_pupil_parent_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE
 ) ;
 
 DROP TABLE IF EXISTS `terms`;
 
 CREATE TABLE `terms` (
   `term_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `term_name` 	varchar(30) 	NOT NULL,
   `term_description` 	varchar(30) 	NOT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`term_id`),
   
   UNIQUE KEY `uindex_terms_term_name` (`term_name`)
 );
 
INSERT INTO terms (term_name, term_description) 
	VALUES ('Term12021','04January2021-15April2021');
 
DROP TABLE IF EXISTS `exams`;
  
 CREATE TABLE `exams` (
   `exam_id` 			bigint 			NOT NULL AUTO_INCREMENT,
   `teacher_id` 		bigint  			NOT NULL,
   `subject_id` 		bigint  			NOT NULL,
   `class_id` 		bigint  			NOT NULL,
   `term_name` 		varchar(30)  			NOT NULL,
   `exam_title`	varchar(50) 	NOT NULL,
   `exam_date`	varchar(50) 	NOT NULL,
   `exam_duration`	varchar(50) 	NOT NULL,
   `total_marks`	varchar(50) 	NOT NULL,
   `total_questions`	varchar(50) 	NOT NULL,
   `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`exam_id`),
   
   KEY `teachers_exams_fk` (`teacher_id`),
   CONSTRAINT `fk_teachers_exams_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   
   KEY `subjects_exams_fk` (`subject_id`),
   CONSTRAINT `fk_subjects_exams_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   
   KEY `classes_exams_fk` (`class_id`),
   CONSTRAINT `fk_classes_exams_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   
   KEY `terms_exams_fk` (`term_name`),
   CONSTRAINT `fk_terms_exams_term_name` FOREIGN KEY (`term_name`) REFERENCES `terms` (`term_name`) ON DELETE CASCADE ON UPDATE CASCADE
   ) ;
 
DROP TABLE IF EXISTS `questions`;
  
 CREATE TABLE `questions` (
   `question_id` 			bigint 			NOT NULL AUTO_INCREMENT,
   `exam_id` 		bigint  			NOT NULL,
   `question_description`	varchar(50) 	NOT NULL,
   `marks`	varchar(50) 	NOT NULL,
   `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`question_id`),
   
   KEY `exams_questions_fk` (`exam_id`),
   CONSTRAINT `fk_exams_questions_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE
   ) ;				
