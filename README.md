
# 📘 Introduction
In today’s fast-growing tech landscape, the demand for Data Analysts continues to rise 📈 — but not all roles are created equal. This project explores remote, top-paying data analyst positions using SQL to answer essential career-focused questions like:

- 💰 Which companies are offering the highest salaries?

- 🛠️ What specific skills are required for those top-paying roles?

- 📊 Which skills are most in-demand across the industry?

- 🎯 What are the top skills based on salary for my role?

- 🚀 What are the most optimal skills to learn (high demand + high pay)?


By working directly with a structured job postings dataset, I performed a series of queries to uncover salary trends 💵, required tools 🧰, and the most marketable skills for aspiring or advancing data professionals 🔍.

You can find the full SQL queries used for this analysis [here](/project_sql/).


# 📝 Background
Driven by a desire to deepen my understanding of SQL, I embarked on a learning journey under the guidance of YouTuber [Luke Barousse 📹](https://www.youtube.com/@LukeBarousse/videos). His tutorials helped me build a solid foundation in SQL, which eventually led me to work on this project.

This project not only solidified my SQL skills 💪 but also provided valuable insights into the world of data analysis roles. By analyzing job postings, I gained a deeper understanding of the types of positions available, the skills required, and what companies are offering in terms of salary and benefits for top-tier data analysts 🧑‍💻.

# 🛠️ Tools I Used
In this project, I leveraged several tools to help with both development and analysis:

- **VS Code**: My primary text editor for writing and editing SQL queries 📝.

- **Git & GitHub**: For version control and collaboration, allowing me to track changes and manage the project effectively 🔄.

- **SQL**: The core language I used to query and manipulate the job postings dataset 📊.

- **PostgreSQL**: The database management system where I stored and queried the job postings data 🗄️.

- **ChatGPT**: Assisted with refining queries, providing explanations, and offering guidance throughout the project 🤖.

# 📊 The Analysis
### 1. What are the Top Paying Jobs?
To answer this question, I queried a dataset of job postings to identify the highest-paying Data Analyst roles available remotely. I filtered out any posts without a specified salary, ensuring the results are focused on concrete salary figures. By analyzing the dataset, I discovered the top 10 highest-paying Data Analyst jobs in 2023, including companies like Meta, Pinterest, and AT&T, and their respective salary averages.

Some of the highest-paying roles include:

- **Meta** – Director of Analytics: $336,500/year

- **AT&T** – Associate Director of Data Insights: $255,829/year

- **Pinterest** – Data Analyst (Marketing): $232,423/year

- **UCLA Health** – Data Analyst (Hybrid/Remote): $217,000/year

These findings provide insight into the types of roles that offer the most competitive compensation in the field of data analysis, especially for remote opportunities 🌍💼.

[SQL Query for this Analysis:](/project_sql/1_top_paying_jobs.sql)

```sql
SELECT 
    j.job_id,
    c.name  AS company_name,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date :: DATE
FROM 
    job_postings_fact AS j
LEFT JOIN company_dim AS c 
    ON j.company_id = c.company_id
WHERE 
    j.job_work_from_home = true 
    AND j.salary_year_avg IS NOT NULL 
    AND j.job_title_short = 'Data Analyst'
ORDER BY 
    j.salary_year_avg DESC
LIMIT 10
```
![Top Paying Jobs](/Assets/Top%2010%20Paying%20Jobs.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts; chatGPT generated this graph for my SQL query results*


### 2. What are the skills required for these top-paying roles?
To identify what skills are required in the highest-paying Data Analyst jobs, I:

- Queried the top 10 highest-paid data analyst roles from the dataset 📈

- Extracted the specific skills attached to those job postings 🛠️

- Counted how often each skill appeared across these top roles 🔢

This gives clear insight into which technical abilities are most valued where the money is high, helping job seekers align their skillset with top-paying opportunities.

[SQL Query for this Analysis:](/project_sql/2_top_paying_job_skills.sql)
```sql
WITH top_paying_roles AS (
    SELECT 
        j.job_id,
        c.name  AS company_name,
        j.job_title,
        j.salary_year_avg
    FROM 
        job_postings_fact AS j
    LEFT JOIN company_dim AS c 
        ON j.company_id = c.company_id
    WHERE 
        j.job_work_from_home = true 
        AND j.salary_year_avg IS NOT NULL 
        AND j.job_title_short = 'Data Analyst'
    ORDER BY 
        j.salary_year_avg DESC
    LIMIT 10

)

SELECT 
    top_paying_roles.*,
    skills_table.skills,
    skills_table.type
FROM top_paying_roles
INNER JOIN (
    SELECT 
        sjd.job_id,
        sd.*
    FROM skills_job_dim AS sjd
    INNER JOIN skills_dim AS sd 
        ON sd.skill_id = sjd.skill_id
) AS skills_table
    ON top_paying_roles.job_id = skills_table.job_id
ORDER BY salary_year_avg
```

**📊 Top 10 Skills Frequency Table**
| 💡 Skill       | 🔢 Frequency        |
|---------------|---------------------|
| sql           | 10                  |
| python        | 8                   |
| tableau       | 6                   |
| r             | 4                   |
| excel         | 3                   |
| pandas        | 3                   |
| aws           | 2                   |
| azure         | 2                   |
| jira          | 2                   |
| confluence    | 2                   |


### 3. What are the most in-demand skills for my role?
To determine the most sought-after skills for a Data Analyst:

- I joined all job postings with their listed skills using SQL joins 🔗

- Focused on job listings with the title Data Analyst

- Counted the number of times each skill appeared across all postings 📊

- Then selected the Top 5 most frequently mentioned skills 🎯

This helps highlight the most valuable and marketable skills job seekers should focus on developing to stay competitive in the data science job market.

[SQL Query for this Analysis:](/project_sql/3_in_demand_skill_for_my_role.sql)
```sql
SELECT 
    skills_dim.skills, 
    COUNT(*) AS demand_count
FROM 
    job_postings_fact AS j
INNER JOIN skills_job_dim 
    ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    j.job_title_short = 'Data Analyst' 
GROUP BY 
    skills_dim.skills
ORDER BY 
    demand_count DESC
LIMIT 5
```
| 💡 Skill | 🔢 Demand Count |
|----------|-----------------|
| python   | 114,016         |
| sql      | 79,174          |
| r        | 59,754          |
| sas      | 29,642          |
| tableau  | 29,513          |

![In-demand skill for my role](/Assets/In-demand%20skills%20for%20Data%20Analysis%20Role.png)
*Bar graph visualizing the Top 5 in-demand skills for data analysts; chatGPT generated this graph for my SQL query results*


### 4. What are the top skills based on salary for my role?
To identify the top skills based on salary for the Data Analyst role, I:

- Queried the dataset to retrieve the skills associated with Data Analyst roles 🛠️

- Calculated the average salary for each skill, filtering out records with missing salary data 📊

- Sorted the skills based on their average salary to identify which skills are most lucrative for Data Analysts 💡

This analysis helps job seekers focus on skills that are linked to the highest-paying opportunities within the Data Analyst field.
[SQL Query for this Analysis:](/project_sql/4_top_skills_based_on_salary.sql)
```sql
SELECT 
    skills_dim.skills,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact AS j
INNER JOIN skills_job_dim 
    ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    j.job_title_short = 'Data Analyst' 
    AND J.salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
```
*Here is the bar chart that visually represents only the top 10 average salary of each skill.The full result includes more skills beyond the top 10 shown below, but these are the most top skills :*

![Top Skill Based on Salary](/Assets/Top%2010%20skill%20based%20on%20salary.png)


**Insights:**
- **High Salary Skills:** The skills svn, solidity, and couchbase show a high salary, especially svn with an average salary of $400,000, indicating that rare and highly specialized skills tend to command top salaries.

- **Trending Skills in Data Science:** Skills like datarobot, tensorflow, pytorch, and mxnet reflect the growing emphasis on machine learning and AI tools, with salaries ranging between $120,000 and $155,000.

- **Cloud and Infrastructure Skills:** Tools such as terraform, ansible, and kafka are associated with strong salaries, highlighting the increasing importance of cloud infrastructure and automation in Data Analyst roles.

- **Strategic Skill Focus:** For those aiming to maximize their earnings, focusing on high-demand skills like svn, solidity, and couchbase can provide the most lucrative opportunities.

### 5.  What are the most optimal skills to learn (high demand and high-paying skills)?
To identify the most optimal skills to learn for Data Analysts (i.e., those that are in high demand and associated with high salaries), I:

- Queried the dataset to find the skills associated with remote Data Analyst positions 🛠️

- Focused on job postings with specified salaries and where the job offered remote work 📊

- Aggregated the data to calculate both the demand (how often the skill appears) and the average salary for each skill 💡

This analysis helps job seekers focus on the skills that are both in high demand and linked to higher-paying opportunities, particularly in remote roles.

[SQL Query for this Analysis:](/project_sql/5_optimal_skills_to%20learn.sql)
```sql
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
```
*Here are the top skills with the highest demand and salaries for remote Data Analyst positions. The full result includes more skills beyond the top 10 shown below, but these are the most in-demand and high-paying:*

| Skill       | Demand Count | Average Salary   |
|-------------|--------------|------------------|
| sql         | 398          | $97,237.16       |
| excel       | 256          | $87,288.21       |
| python      | 236          | $101,397.22      |
| tableau     | 230          | $99,287.65       |
| r           | 148          | $100,498.77      |
| sas         | 126          | $98,902.37       |
| power bi    | 110          | $97,431.30       |
| powerpoint  | 58           | $88,701.09       |
| looker      | 49           | $103,795.30      |
| word        | 48           | $82,576.04       |

**Insights:**
- Top Skills in Demand and High Paying: SQL and Python are the top skills in demand, with Python leading in terms of salary at $101,397.22.

- Highly Valued Business Tools: Skills like Excel and Power BI are essential for Data Analysts and remain in high demand, with solid salaries.

- Specialized Tools with High Salary: Looker stands out with a higher average salary, showing that niche tools can also command premium pay.

- Strategic Skill Focus: For Data Analysts aiming for remote roles with high salaries, focusing on Python, SQL, and Looker provides the most lucrative opportunities.

This analysis reveals the most optimal skills for Data Analysts to focus on, particularly those in high demand and associated with high salaries for remote positions. The full dataset includes additional skills beyond the top 10 mentioned here.

# What I Learned
Working on this project was a rewarding experience! Here are some of the key things I gained:

- 🧠 **Advanced SQL Skills**: I learned how to write complex SQL queries using WITH clauses, joins, grouping, ordering, and more to extract meaningful insights from the database.

- 🧮 **Data Analysis with SQL**: I realized that SQL alone can be a powerful tool for analyzing trends, identifying top-paying skills, and making data-driven conclusions.

- 🐘 **Hands-On with PostgreSQL**: I got comfortable using PostgreSQL, learning how to set up, query, and navigate a relational database efficiently.

- 🤖 **Prompt Engineering with ChatGPT**: I used ChatGPT effectively for summarizing insights, explaining SQL concepts, and even turning raw results into visualizations and clean markdown explanations.

This project not only solidified my SQL foundations but also improved how I communicate data findings clearly and effectively.



# Conclusions
This project was more than just writing SQL queries — it was a journey into real-world data analysis. By exploring job data, I was able to:

✅ Identify high-paying roles and the most in-demand skills for a Data Analyst.

✅ Understand which skills offer both high salary potential and market demand.

✅ Strengthen my technical skills in SQL, PostgreSQL, Git/GitHub, and prompt-based analysis using ChatGPT.

✅ Learn how to communicate insights clearly using markdown and visual aids.

With this foundation, I feel more prepared to take on larger data projects and continue growing towards my goal of becoming an AI and Machine Learning expert. 🚀