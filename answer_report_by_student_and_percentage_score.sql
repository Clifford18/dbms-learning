USE  online_exam;

SELECT 
pupils.first_name,
pupils.last_name,
answers.pupil_id,
count(choices.remark) AS correctly_asnswered,
(count(choices.remark)*questions.marks) AS total_marks,
(((count(choices.remark)*questions.marks)/exams.total_marks)*100) AS percentage,

exams.exam_title

FROM answers
RIGHT JOIN choices ON answers.choice_id = choices.choice_id
RIGHT JOIN questions ON answers.question_id = questions.question_id
RIGHT JOIN pupils ON answers.pupil_id = pupils.pupil_id
LEFT JOIN exams ON questions.exam_id = exams.exam_id

WHERE remark= 'Correct'

GROUP BY pupil_id

ORDER BY pupil_id;