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
				(i,26,CAST((RAND()*(104-101)+1) AS SIGNED)),
				(i,27,CAST((RAND()*(108-(104+1))+(104+1)) AS SIGNED)),
				(i,28,CAST((RAND()*(112-(108+1))+(108+1)) AS SIGNED)),
				(i,29,CAST((RAND()*(116-(112+1))+(112+1)) AS SIGNED)),
				(i,30,CAST((RAND()*(120-(116+1))+(116+1)) AS SIGNED)),
				(i,31,CAST((RAND()*(124-(120+1))+(120+1)) AS SIGNED)),
				(i,32,CAST((RAND()*(128-(124+1))+(124+1)) AS SIGNED)),
				(i,33,CAST((RAND()*(132-(128+1))+(128+1)) AS SIGNED)),
				(i,34,CAST((RAND()*(136-(132+1))+(132+1)) AS SIGNED)),
				(i,35,CAST((RAND()*(140-(136+1))+(136+1)) AS SIGNED)),
				(i,36,CAST((RAND()*(144-(140+1))+(140+1)) AS SIGNED)),
				(i,37,CAST((RAND()*(148-(144+1))+(144+1)) AS SIGNED)),
				(i,38,CAST((RAND()*(152-(148+1))+(148+1)) AS SIGNED)),
				(i,39,CAST((RAND()*(156-(152+1))+(152+1)) AS SIGNED)),
				(i,40,CAST((RAND()*(160-(156+1))+(156+1)) AS SIGNED)),
				(i,41,CAST((RAND()*(164-(160+1))+(160+1)) AS SIGNED)),
				(i,42,CAST((RAND()*(168-(164+1))+(164+1)) AS SIGNED)),
				(i,43,CAST((RAND()*(172-(168+1))+(168+1)) AS SIGNED)),
				(i,44,CAST((RAND()*(176-(172+1))+(172+1)) AS SIGNED)),
				(i,45,CAST((RAND()*(180-(176+1))+(176+1)) AS SIGNED)),
				(i,46,CAST((RAND()*(184-(180+1))+(180+1)) AS SIGNED)),
				(i,47,CAST((RAND()*(188-(184+1))+(184+1)) AS SIGNED)),
				(i,48,CAST((RAND()*(192-(188+1))+(188+1)) AS SIGNED)),
				(i,49,CAST((RAND()*(196-(192+1))+(192+1)) AS SIGNED)),
				(i,50,CAST((RAND()*(200-(196+1))+(196+1)) AS SIGNED));
			SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;
CALL generate_answers_exam2();