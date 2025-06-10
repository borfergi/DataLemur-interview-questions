WITH transactions_per_user_sorted AS(
  SELECT 
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS ROW_NUMB
  FROM transactions
)

SELECT 
  user_id,
  spend,
  transaction_date
FROM transactions_per_user_sorted
WHERE row_numb = 3
LIMIT 10;