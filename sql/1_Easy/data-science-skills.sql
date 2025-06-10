WITH skilled_candidate AS (
  SELECT
    candidate_id, 
    COUNT(*)
  FROM candidates
  WHERE skill = 'Python' OR skill = 'Tableau' OR skill = 'PostgreSQL'
  GROUP BY candidate_id
  HAVING COUNT(*) = 3
)

SELECT 
  candidate_id 
FROM skilled_candidate;