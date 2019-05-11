BEGIN;
EXPLAIN ANALYZE
INSERT INTO
  stocks_timeseries (date, open, high, low, close, volume)
SELECT
  date,
  array_agg(open) as open,
  array_agg(high) as high,
  array_agg(low) as low,
  array_agg(close) as close,
  array_agg(volume) as volume
FROM
  data_for_inserts
GROUP BY
  date
ORDER BY
  date;
ROLLBACK;
