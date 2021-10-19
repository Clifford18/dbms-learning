USE  online_exam;

SELECT 
full_name(p.first_name,p.last_name) AS fullnames,
a.pupil_id,
q.question_id,
q.marks AS question_marks,
c.remark,

e.exam_title

FROM answers a
RIGHT JOIN choices c ON a.choice_id = c.choice_id
RIGHT JOIN questions q ON a.question_id = q.question_id
RIGHT JOIN pupils p ON a.pupil_id = p.pupil_id
LEFT JOIN exams e ON q.exam_id = e.exam_id

WHERE p.pupil_id= 1 AND e.exam_id = 2
;