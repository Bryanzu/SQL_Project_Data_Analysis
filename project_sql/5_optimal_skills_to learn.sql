/*
    Question: What are the most optimal skills to learn (aka It's in high demand and a high-paying skill)?
    - Identify skills in high demand and associated with high average salaries for "Data Analyst".
    - Concentrate on remote positions with specified salaries
*/

SELECT 
    skills_dim.skills, 
    COUNT(*) AS demand_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    j.job_title_short = 'Data Analyst' 
    AND job_work_from_home = True
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skills
HAVING COUNT(*) > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
    
/*
    Insight:
    This query identifies the most optimal skills for Data Analysts by combining demand and salary data from remote roles.
    SQL, Excel, Python, and Tableau are the most in-demand, making them essential for job seekers.
    However, skills like Snowflake, Azure, AWS, Go, and Hadoop stand out with the highest average salaries ($108k–$115k), despite being less common.
    Conclusion: mastering high-demand core tools (like SQL and Python) ensures job opportunities, while learning high-paying niche skills (like Snowflake, Go, or cloud platforms) can significantly boost earning potential.

    [
  {
    "skills": "sql",
    "demand_count": "398",
    "avg_salary": "97237.16"
  },
  {
    "skills": "excel",
    "demand_count": "256",
    "avg_salary": "87288.21"
  },
  {
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397.22"
  },
  {
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99287.65"
  },
  {
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100498.77"
  },
  {
    "skills": "sas",
    "demand_count": "126",
    "avg_salary": "98902.37"
  },
  {
    "skills": "power bi",
    "demand_count": "110",
    "avg_salary": "97431.30"
  },
  {
    "skills": "powerpoint",
    "demand_count": "58",
    "avg_salary": "88701.09"
  },
  {
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795.30"
  },
  {
    "skills": "word",
    "demand_count": "48",
    "avg_salary": "82576.04"
  },
  {
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112947.97"
  },
  {
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104533.70"
  },
  {
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97785.73"
  },
  {
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225.10"
  },
  {
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317.30"
  },
  {
    "skills": "sheets",
    "demand_count": "32",
    "avg_salary": "86087.79"
  },
  {
    "skills": "flow",
    "demand_count": "28",
    "avg_salary": "97200.00"
  },
  {
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115319.89"
  },
  {
    "skills": "spss",
    "demand_count": "24",
    "avg_salary": "92169.68"
  },
  {
    "skills": "vba",
    "demand_count": "24",
    "avg_salary": "88783.29"
  },
  {
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113192.57"
  },
  {
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104917.90"
  },
  {
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587.00"
  },
  {
    "skills": "sharepoint",
    "demand_count": "18",
    "avg_salary": "81633.58"
  },
  {
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906.44"
  },
  {
    "skills": "alteryx",
    "demand_count": "17",
    "avg_salary": "94144.53"
  },
  {
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936.44"
  },
  {
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171.43"
  },
  {
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109653.85"
  },
  {
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101413.73"
  },
  {
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99630.81"
  },
  {
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99076.92"
  },
  {
    "skills": "outlook",
    "demand_count": "13",
    "avg_salary": "90077.42"
  },
  {
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683.33"
  },
  {
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114209.91"
  },
  {
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958.23"
  }
]
*/
