USE  online_exam;

SELECT 
full_name(p.first_name,p.last_name) AS fullnames,
a.pupil_id,
c.remark,
q.question_id,
e.exam_title

FROM answers AS a
LEFT JOIN choices AS c ON a.choice_id = c.choice_id
LEFT JOIN questions AS q ON a.question_id = q.question_id
LEFT JOIN pupils AS p ON a.pupil_id = p.pupil_id
LEFT JOIN exams AS e ON q.exam_id = e.exam_id

WHERE p.pupil_id= 1 AND e.exam_id = 2
;