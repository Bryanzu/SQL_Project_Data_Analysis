/*
    Find the count of the number of remote job postings per skill
        - Display the Top 5 skills by their demand in remote jobs.
        - Include skill ID, name, count of postings requiring the skils
*/

WITH remote_postings AS(
    SELECT 
        sd.skill_id,
        COUNT(*) AS count_of_posting
    FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sd
        ON jpf.job_id = sd.job_id
    WHERE jpf.job_work_from_home = True
    GROUP BY sd.skill_id
)

SELECT 
    sd.skill_id,
    sd.skills,
    rp.count_of_posting
FROM remote_postings AS rp
INNER JOIN skills_dim AS sd 
    ON rp.skill_id = sd.skill_id
ORDER BY count_of_posting DESC
LIMIT 5



