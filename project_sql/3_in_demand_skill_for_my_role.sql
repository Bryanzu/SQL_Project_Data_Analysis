/*
    Question: What are the most in-demand skills for  my role?
    - Join job postings to inner join table similar to query 2.
    - Identify the top 5 in-demand skills for a data analyst.
    - Focus on all job postings
    - Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT skills_dim.skills, COUNT(*) AS demand_count
FROM job_postings_fact AS j
INNER JOIN skills_job_dim ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE j.job_title_short = 'Data Scientist' 
GROUP BY skills_dim.skills
ORDER BY demand_count DESC
LIMIT 5

/*
    Insight:
    This query identifies the top 5 most in-demand skills for Data Scientists across all job postings.
    Python tops the list, followed by SQL and R, highlighting the need for strong programming and data manipulation skills.
    SAS and Tableau also appear, showing continued demand for statistical tools and data visualization.
    These results suggest that job seekers aiming for data science roles should prioritize mastering Python, SQL, and R, while also gaining familiarity with tools like SAS and Tableau for a competitive edge.


    [
  {
    "skills": "python",
    "demand_count": "114016"
  },
  {
    "skills": "sql",
    "demand_count": "79174"
  },
  {
    "skills": "r",
    "demand_count": "59754"
  },
  {
    "skills": "sas",
    "demand_count": "29642"
  },
  {
    "skills": "tableau",
    "demand_count": "29513"
  }
]
*/
