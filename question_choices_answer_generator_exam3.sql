-- exam 3 questions***
DROP PROCEDURE IF EXISTS generate_questions_exam3;
DELIMITER $$
CREATE PROCEDURE generate_questions_exam3()
BEGIN
  DECLARE i INT DEFAULT 51;
  WHILE i < 76 DO
    INSERT INTO `questions` (`exam_id`,`question_description`,`marks`) 
		VALUES (
        3,concat('question_description - ',i ),2
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
CALL generate_questions_exam3();

-- exam 3 choices***
DROP PROCEDURE IF EXISTS generate_choices_exam3;
DELIMITER $$
CREATE PROCEDURE generate_choices_exam3()
BEGIN
  DECLARE i INT DEFAULT 51;
  WHILE i < 76 DO
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
CALL generate_choices_exam3();

-- exam 3 answers***

DROP PROCEDURE IF EXISTS generate_answers_exam3;
DELIMITER $$
CREATE PROCEDURE generate_answers_exam3()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i < 23 DO
	INSERT INTO `answers` (`pupil_id`,`question_id`,`choice_id`)
			VALUES
				(i,51,CAST((RAND()*(204-201)+201) AS SIGNED)),
				(i,52,CAST((RAND()*(208-(204+1))+(204+1)) AS SIGNED)),
				(i,53,CAST((RAND()*(212-(208+1))+(208+1)) AS SIGNED)),
				(i,54,CAST((RAND()*(216-(212+1))+(212+1)) AS SIGNED)),
				(i,55,CAST((RAND()*(220-(216+1))+(216+1)) AS SIGNED)),
				(i,56,CAST((RAND()*(224-(220+1))+(220+1)) AS SIGNED)),
				(i,57,CAST((RAND()*(228-(224+1))+(224+1)) AS SIGNED)),
				(i,58,CAST((RAND()*(232-(228+1))+(228+1)) AS SIGNED)),
				(i,59,CAST((RAND()*(236-(232+1))+(232+1)) AS SIGNED)),
				(i,60,CAST((RAND()*(240-(236+1))+(236+1)) AS SIGNED)),
				(i,61,CAST((RAND()*(244-(240+1))+(240+1)) AS SIGNED)),
				(i,62,CAST((RAND()*(248-(244+1))+(244+1)) AS SIGNED)),
				(i,63,CAST((RAND()*(252-(248+1))+(248+1)) AS SIGNED)),
				(i,64,CAST((RAND()*(256-(252+1))+(252+1)) AS SIGNED)),
				(i,65,CAST((RAND()*(260-(256+1))+(256+1)) AS SIGNED)),
				(i,66,CAST((RAND()*(264-(260+1))+(260+1)) AS SIGNED)),
				(i,67,CAST((RAND()*(268-(264+1))+(264+1)) AS SIGNED)),
				(i,68,CAST((RAND()*(272-(268+1))+(268+1)) AS SIGNED)),
				(i,69,CAST((RAND()*(276-(272+1))+(272+1)) AS SIGNED)),
				(i,70,CAST((RAND()*(280-(276+1))+(276+1)) AS SIGNED)),
				(i,71,CAST((RAND()*(284-(280+1))+(280+1)) AS SIGNED)),
				(i,72,CAST((RAND()*(288-(284+1))+(284+1)) AS SIGNED)),
				(i,73,CAST((RAND()*(292-(288+1))+(288+1)) AS SIGNED)),
				(i,74,CAST((RAND()*(296-(292+1))+(292+1)) AS SIGNED)),
				(i,75,CAST((RAND()*(300-(296+1))+(296+1)) AS SIGNED));
			SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;
CALL generate_answers_exam3();