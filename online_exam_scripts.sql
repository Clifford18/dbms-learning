
DROP DATABASE IF EXISTS `online_exam`;
CREATE DATABASE `online_exam`; 
USE `online_exam`;

-- -- --entities

-- stream*
-- classes*

-- subjects
-- teachers
-- -- teacher_class

-- parents
-- pupils
-- --parent_pupil

-- terms
-- exams 
-- questions
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
 
DROP TABLE IF EXISTS `terms`;

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
   `class_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `class_name` 	varchar(30) 	NOT NULL,
   `stream_name` 	varchar(30) 	DEFAULT NULL,
   `class_description` 	varchar(30) 	DEFAULT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`term_id`)
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