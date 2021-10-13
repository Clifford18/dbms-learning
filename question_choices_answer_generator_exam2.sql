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
