BEGIN;
EXPLAIN ANALYZE
INSERT INTO
  stocks (date, ticker, open, high, low, close, volume)
SELECT
  date,
  ticker,
  open,
  high,
  low,
  close,
  volume
FROM
  data_for_inserts AS df
ORDER BY
  df.date ASC,
  ticker ASC;
ROLLBACK;
