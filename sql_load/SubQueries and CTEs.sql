SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1

) AS january_jobs


SELECT
    company_id,
    name
FROM 
    company_dim
WHERE company_id IN (

    SELECT
        company_id
    FROM    
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id 
)


WITH company_count AS (

    
    SELECT 
        COUNT(j.company_id),
        c.name
    FROM company_dim AS c
    LEFT JOIN job_postings_fact AS j ON 
        c.company_id = j.company_id 
    GROUP BY c.name



)

SELECT *
FROM company_count
ORDER BY count desc


WITH company_count AS (

    
    SELECT 
        company_id,
        COUNT(*) AS total_count
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)

SELECT cd.name, cc.total_count
FROM company_dim as cd 
LEFT JOIN company_count AS cc ON
    cd.company_id = cc.company_id
ORDER BY
    total_count DESC

-- IDENTIFYING TOP 5 SKILLS
SELECT 
    sd.skills,
    total_skill_count.skill_count
FROM
    (SELECT skill_id,COUNT(*) AS skill_count
       FROM skills_job_dim
    GROUP BY skill_id) AS total_skill_count
LEFT JOIN skills_dim AS sd
    ON total_skill_count.skill_id = sd.skill_id
ORDER BY total_skill_count.skill_count DESC
LIMIT 5


SELECT *
FROM skills_job_dim
LIMIT 5



SELECT 
    cd.company_id,
    cd.name AS company_name,
    CASE
        WHEN total_company_count < 10 THEN 'small'
        WHEN total_company_count BETWEEN 10 AND 50 THEN 'medium'
        WHEN total_company_count > 50 THEN 'large'
    END AS company_post_category
FROM (
    SELECT company_id, COUNT(*) AS total_company_count
    FROM job_postings_fact
    GROUP BY company_id
) AS cc
LEFT JOIN company_dim AS cd
    ON cc.company_id = cd.company_id
LIMIT 20



