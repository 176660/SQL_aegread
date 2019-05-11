-- INNER JOIN (366.097 + 0.332) ms

EXPLAIN ANALYZE
SELECT
  DISTINCT ON (p1.ticker)
  p1.ticker,
  p1.date,
  p1.close
FROM
  stocks p1
INNER JOIN (
  SELECT
   pi.ticker,
   MAX(pi.date) AS max_date
  FROM
    stocks pi
  GROUP BY
    pi.ticker
  ) p2
ON (p1.date = p2.max_date
  AND p1.ticker = p2.ticker);