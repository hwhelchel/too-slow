
# Original "+ 1" query in n + 1 problem
SELECT  "users".*
FROM "users"
INNER JOIN "karma_points"
ON "karma_points"."user_id" = "users"."id"
GROUP BY users.id
ORDER BY SUM(karma_points.value) DESC LIMIT 50

# One of the "n" queries in n + 1 problem
SELECT SUM("karma_points"."value")
AS sum_id
FROM "karma_points"
WHERE "karma_points"."user_id" = $1  [["user_id", 94465]]

SELECT first_name, last_name, username, email
FROM users
LIMIT 10;

# KarmaSummary view table
CREATE OR REPLACE VIEW karma_summaries AS
SELECT
  u.id,
  u.first_name,
  u.last_name,
  u.username,
  u.email,
  SUM(k.value) AS total_karma
FROM users u
INNER JOIN karma_points k
ON u.id=k.user_id
GROUP BY u.id,
  u.first_name,
  u.last_name,
  u.username,
  u.email
ORDER BY total_karma DESC;

# Seeding of counter cache data
UPDATE
  users
SET total_karma_points = s.total_karma
FROM karma_summaries s
WHERE s.id=users.id
AND users.total_karma_points IS NULL;
