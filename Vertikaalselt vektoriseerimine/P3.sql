BEGIN;
EXPLAIN ANALYZE
INSERT INTO
  stocks (first_date, ticker, open, high, low, close, volume)
SELECT
  date,
  ticker,
  open,
  high,
  low,
  close,
  volume
FROM
  data_for_inserts
ORDER BY
  date ASC,
  ticker ASC;
ROLLBACK;
