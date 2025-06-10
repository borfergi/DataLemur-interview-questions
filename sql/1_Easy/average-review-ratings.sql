WITH reviews_with_month AS (
  SELECT 
    *,
    EXTRACT(MONTH FROM submit_date) AS mth
  FROM reviews
)

SELECT DISTINCT
  mth,
  product_id AS product,
  ROUND(AVG(stars) OVER (PARTITION BY mth, product_id), 2) AS avg_stars
FROM reviews_with_month
ORDER BY mth, product_id;