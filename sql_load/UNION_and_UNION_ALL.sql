

WITH jobs AS (
    SELECT *
    FROM (
        SELECT *
        FROM jan_2023_jobs

        UNION

        SELECT *
        FROM feb_2023_jobs

        UNION

        SELECT *
        FROM mar_2023_jobs
    ) AS q1_job_postings

    LEFT JOIN skills_job_dim AS sjd
        ON sjd.job_id = q1_job_postings.job_id
)

SELECT jobs.job_posted_date, sd.skills, sd.type
FROM jobs
LEFT JOIN skills_dim as sd 
    ON sd.skill_id = jobs.skill_id
WHERE jobs.salary_year_avg > 70000
ORDER BY jobs.salary_year_avg
LIMIT 1000



SELECT *
FROM job_postings_fact
LIMIT 5


SELECT *
    FROM (
        SELECT *
        FROM jan_2023_jobs

        UNION ALL

        SELECT *
        FROM feb_2023_jobs

        UNION ALL

        SELECT *
        FROM mar_2023_jobs
    ) AS q1_job_postings
WHERE 
    salary_year_avg > 70000