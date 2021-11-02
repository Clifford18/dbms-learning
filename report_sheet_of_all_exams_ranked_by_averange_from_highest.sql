USE online_exam;

SELECT full_name(p.first_name, p.last_name)      AS fullnames,
       r.pupil_id,
       r1.percentage_score                       AS exam1_score,
       r2.percentage_score                       AS exam2_score,
       r3.percentage_score                       AS exam3_score,
       ROUND((AVG(r.percentage_score)),2) AS averange_score

FROM results r

         LEFT JOIN pupils p ON r.pupil_id = p.pupil_id
         LEFT JOIN results r1 ON r1.pupil_id = r.pupil_id AND r1.exam_id = 1
         LEFT JOIN results r2 ON r2.pupil_id = r.pupil_id AND r2.exam_id = 2
         LEFT JOIN results r3 ON r3.pupil_id = r.pupil_id AND r3.exam_id = 3


GROUP BY r.pupil_id

ORDER BY averange_score DESC
;