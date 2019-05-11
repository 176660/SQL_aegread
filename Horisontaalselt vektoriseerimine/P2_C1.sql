EXPLAIN ANALYZE
SELECT
  p1.ticker,
  p1.date,
  p1.close
FROM
  stocks_view p1
LEFT JOIN
  stocks_view p2
  ON (p1.ticker = p2.ticker
    AND p1.date < p2.date)
WHERE
  p2.date IS NULL;