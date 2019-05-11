-- LEFT JOIN (887.089 + 0.295) ms

EXPLAIN ANALYZE
SELECT
  p1.ticker,
  p1.date,
  p1.close
FROM
  stocks p1
LEFT JOIN
  stocks p2
  ON (p1.ticker = p2.ticker
    AND p1.date < p2.date)
WHERE
  p2.date IS NULL;