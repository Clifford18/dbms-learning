USE  online_exam;

SET @TotalMarks = (SELECT
SUM(q.marks)
FROM questions AS q
LEFT JOIN exams AS e ON q.exam_id = e.exam_id
WHERE e.exam_id = 1
);

SELECT 
p.first_name,
p.last_name,
a.pupil_id,
count(c.remark) AS correctly_asnswered,
(count(c.remark)*q.marks) AS total_marks,
ROUND(((SUM(q.marks)/@TotalMarks)*100),1) AS Percentage_Score ,
e.exam_title

FROM answers a
RIGHT JOIN choices c ON a.choice_id = c.choice_id
RIGHT JOIN questions q ON a.question_id = q.question_id
RIGHT JOIN pupils p ON a.pupil_id = p.pupil_id
LEFT JOIN exams e ON q.exam_id = e.exam_id

WHERE c.remark= 'Correct'

GROUP BY p.pupil_id

ORDER BY p.pupil_id;