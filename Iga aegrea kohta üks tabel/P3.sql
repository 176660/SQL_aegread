BEGIN;
EXPLAIN ANALYZE
WITH insert1 AS (
  INSERT INTO
    stock_a
  SELECT
    date,
    open,
    high,
    low,
    close,
    volume
  FROM data_for_inserts
  WHERE ticker = 'A'
  ORDER BY
    date ASC
), insert2 as (
  INSERT INTO
	  stock_aap
  SELECT
    date,
    open,
    high,
    low,
    close,
    volume
  FROM data_for_inserts
  WHERE ticker = 'AAP'
  ORDER BY
    date ASC
)
-- for every table
INSERT INTO
	stock_ads
SELECT
  date,
  open,
  high,
  low,
  close,
  volume
FROM data_for_inserts
WHERE ticker = 'ADS'
ORDER BY
  date ASC;
ROLLBACK;
