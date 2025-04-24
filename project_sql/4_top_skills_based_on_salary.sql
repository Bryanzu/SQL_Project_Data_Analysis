/*
    Question: What are the top skill based on salary for my role?
*/

SELECT 
    skills_dim.skills,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE j.job_title_short = 'Data Analyst' AND J.salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
    

/*
Top-Level Trends
1. DevOps & Infrastructure Tools Dominate High Pay
    - Examples: svn ($400K), terraform, ansible, puppet, gitlab, vmware, airflow

    - Why? These tools manage cloud infrastructure, deployment, and automation. Companies pay a premium for DevOps skills that ensure systems scale smoothly and stay reliable.

2. AI/ML & Deep Learning is Hot
    - Examples: datarobot, keras, pytorch, tensorflow, hugging face, mxnet

    - Why? These are core to building predictive models and generative AI. Specialized frameworks in deep learning are in demand—especially those for NLP (Hugging Face) and DL (Keras/PyTorch).

3. Blockchain & Smart Contracts Rising
    - Example: solidity ($179K)

    - Why? Solidity is used in Ethereum smart contracts. As Web3, crypto, and DeFi evolve, developers who can build secure contracts are highly valued.

4. Programming Languages Still Powerhouse
    - Examples: golang, scala, perl, python (implied via PyTorch, TensorFlow)

    - Why? Efficient, scalable backend code is needed for both ML pipelines and high-performance systems.

5. Cloud & Big Data Tools
    - Examples: kafka, cassandra, airflow

    - Why? Handling large-scale, real-time data is a major need. Skills here support pipelines and data engineering for analysts and scientists.

    [
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
]
*/