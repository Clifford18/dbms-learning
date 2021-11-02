USE  online_exam;

SELECT
full_name(p.first_name,p.last_name) AS fullnames,
r.pupil_id,
CAST((AVG(r.percentage_score)) AS SIGNED ) AS averange_score

FROM results r

LEFT JOIN pupils p ON r.pupil_id = p.pupil_id


GROUP BY r.pupil_id

ORDER BY averange_score DESC

;