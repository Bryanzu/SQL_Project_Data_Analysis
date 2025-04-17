/* Create Tables from other tables
    Question
        - Create 3 tables:
            * Jan 2023 Jobs
            * Feb 2023 Jobs
            * Mar 2023 Jobs
        - Hints:
            * Use 'CREATE TABLE table_name AS' syntax to create the table
            * Look at a way to filter out only specific months (EXTRACT)
*/

-- CREATE TABLES
CREATE TABLE IF NOT EXISTS jan_2023_jobs AS
    SELECT *
    FROM job_postings_fact
    -- WHERE EXTRACT(MONTH FROM job_posted_date) BETWEEN 1 AND 3
        WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE IF NOT EXISTS feb_2023_jobs AS
    SELECT *
    FROM job_postings_fact
    -- WHERE EXTRACT(MONTH FROM job_posted_date) BETWEEN 1 AND 3
        WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE IF NOT EXISTS mar_2023_jobs AS
SELECT *
FROM job_postings_fact
-- WHERE EXTRACT(MONTH FROM job_posted_date) BETWEEN 1 AND 3
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
FROM jan_2023_jobs
LIMIT 5;