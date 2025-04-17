-- SELECT 
--     COUNT(job_id) AS job_count,
--     EXTRACT (MONTH FROM job_posted_date) AS date_month

-- FROM 
--     job_postings_fact
-- WHERE 
--     job_title_short = 'Data Analyst'
-- GROUP BY
--     date_month
-- ORDER BY
--     job_count DESC;

-- SELECT 
--     job_schedule_type, 
--     AVG(salary_hour_avg), 
--     AVG(salary_year_avg) 
-- FROM job_postings_fact
-- WHERE job_posted_date > '2023-06-01'
-- GROUP BY job_schedule_type

-- SELECT 
--     count(*),
--     EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month

-- FROM job_postings_fact
-- WHERE EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
-- GROUP BY EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')
-- ORDER BY month

SELECT j.job_id,j.company_id, j.job_health_insurance,
         c.name
FROM job_postings_fact AS j
LEFT JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE
    EXTRACT(QUARTER FROM j.job_posted_date) = 2
    AND EXTRACT(YEAR FROM j.job_posted_date) = 2023