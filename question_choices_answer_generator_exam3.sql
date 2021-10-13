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
