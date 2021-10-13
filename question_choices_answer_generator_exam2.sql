-- exam 2 questions***
DROP PROCEDURE IF EXISTS generate_questions_exam2;
DELIMITER $$
CREATE PROCEDURE generate_questions_exam2()
BEGIN
  DECLARE i INT DEFAULT 26;
  WHILE i < 51 DO
    INSERT INTO `questions` (`exam_id`,`question_description`,`marks`) 
		VALUES (
        2,concat('question_description - ',i ),2
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
CALL generate_questions_exam2();


-- exam 2 choices***
DROP PROCEDURE IF EXISTS generate_choices_exam2;
DELIMITER $$
CREATE PROCEDURE generate_choices_exam2()
BEGIN
  DECLARE i INT DEFAULT 26;
  WHILE i < 51 DO
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
CALL generate_choices_exam2();

-- exam 2 answers***

DROP PROCEDURE IF EXISTS generate_answers_exam2;
DELIMITER $$
CREATE PROCEDURE generate_answers_exam2()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i < 23 DO
	INSERT INTO `answers` (`pupil_id`,`question_id`,`choice_id`)
			VALUES
				(i,1,CAST((RAND()*(104-101)+1) AS SIGNED)),
				(i,2,CAST((RAND()*(108-(104+1))+(104+1)) AS SIGNED)),
				(i,3,CAST((RAND()*(112-(108+1))+(108+1)) AS SIGNED)),
				(i,4,CAST((RAND()*(116-(112+1))+(112+1)) AS SIGNED)),
				(i,5,CAST((RAND()*(120-(116+1))+(116+1)) AS SIGNED)),
				(i,6,CAST((RAND()*(124-(120+1))+(120+1)) AS SIGNED)),
				(i,7,CAST((RAND()*(128-(124+1))+(124+1)) AS SIGNED)),
				(i,8,CAST((RAND()*(132-(128+1))+(128+1)) AS SIGNED)),
				(i,9,CAST((RAND()*(136-(132+1))+(132+1)) AS SIGNED)),
				(i,10,CAST((RAND()*(140-(136+1))+(136+1)) AS SIGNED)),
				(i,11,CAST((RAND()*(144-(140+1))+(140+1)) AS SIGNED)),
				(i,12,CAST((RAND()*(148-(144+1))+(144+1)) AS SIGNED)),
				(i,13,CAST((RAND()*(152-(148+1))+(148+1)) AS SIGNED)),
				(i,14,CAST((RAND()*(156-(152+1))+(152+1)) AS SIGNED)),
				(i,15,CAST((RAND()*(160-(156+1))+(156+1)) AS SIGNED)),
				(i,16,CAST((RAND()*(164-(160+1))+(160+1)) AS SIGNED)),
				(i,17,CAST((RAND()*(168-(164+1))+(164+1)) AS SIGNED)),
				(i,18,CAST((RAND()*(172-(168+1))+(168+1)) AS SIGNED)),
				(i,19,CAST((RAND()*(176-(172+1))+(172+1)) AS SIGNED)),
				(i,20,CAST((RAND()*(180-(176+1))+(176+1)) AS SIGNED)),
				(i,21,CAST((RAND()*(184-(180+1))+(180+1)) AS SIGNED)),
				(i,22,CAST((RAND()*(188-(184+1))+(184+1)) AS SIGNED)),
				(i,23,CAST((RAND()*(192-(188+1))+(188+1)) AS SIGNED)),
				(i,24,CAST((RAND()*(196-(192+1))+(192+1)) AS SIGNED)),
				(i,25,CAST((RAND()*(200-(196+1))+(196+1)) AS SIGNED));
			SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;
CALL generate_answers_exam2();