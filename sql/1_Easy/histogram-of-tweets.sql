WITH tweets_per_user AS (
  SELECT 
    user_id, 
    COUNT(*) AS tweet_bucket
  FROM tweets
  WHERE DATE_PART('year', tweet_date) = 2022
  GROUP BY user_id
)

SELECT 
  tweet_bucket,
  COUNT(user_id) AS users_num
FROM tweets_per_user
GROUP BY tweet_bucket;