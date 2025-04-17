SELECT
    job_title_short,
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'local'
        ELSE 'Onsite'
    END AS location
FROM
    job_postings_fact

SELECT
    COUNT(job_id),
    CASE 
        WHEN salary_year_avg >= 500000 THEN 'high'
        WHEN salary_year_avg >= 100000 THEN 'standard'
        WHEN salary_year_avg IS NULL THEN 'no_salary'
        ELSE 'Low'
    END AS location
FROM
    job_postings_fact
WHERE
    job_title_short LIKE 'Data_Analyst'
GROUP BY
    location

