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
WHERE j.job_title_short = 'Data Analyst' 
GROUP BY skills_dim.skills
ORDER BY demand_count DESC
LIMIT 5

/*
    Insight:
    This query identifies the top 5 most in-demand skills for Data Analyst across all job postings.
    SQL tops the list, followed by Excel and Python, highlighting the need for strong programming and data manipulation skills.
    Power BI and Tableau also appear, showing continued demand for statistical tools and data visualization.
    These results suggest that job seekers aiming for data analyst roles should prioritize mastering SQL,Excel and Python, while also gaining familiarity with tools like Power BI and Tableau for a competitive edge.


[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }

]
*/
