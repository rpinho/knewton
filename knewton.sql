/*
ALTER TABLE astudentData ADD INDEX (question_id);
ALTER TABLE astudentData ADD INDEX (user_id);
ALTER TABLE astudentData ADD INDEX (correct);
*/

/*
SELECT avg(t1.correct) score
FROM astudentData t1
    JOIN astudentData loo
    ON t1.user_id = loo.user_id
    AND loo.question_id = %(q_id)s
    AND loo.correct
    AND t1.question_id != %(q_id)s
*/

SELECT avg(t1.correct) score, loo.correct
FROM astudentData t1
    JOIN astudentData loo
    ON t1.user_id = loo.user_id
    AND loo.question_id = %(q_id)s
    AND t1.question_id != %(q_id)s
GROUP BY t1.user_id, loo.correct
