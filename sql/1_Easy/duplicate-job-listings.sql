WITH duplicate_job_posts AS (
  SELECT 
    company_id,
    title, 
    description,
    COUNT(*)
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1
)

SELECT 
  COUNT(*) AS duplicate_companies
FROM duplicate_job_posts;