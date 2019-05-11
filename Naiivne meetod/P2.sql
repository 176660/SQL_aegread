-- CTE (362.407 + 0.326) ms
EXPLAIN ANALYZE
WITH max_date AS
(
   SELECT
      ticker,
      MAX(date) AS date
   FROM
      stocks
   GROUP BY
      ticker
)
SELECT
   nm.ticker,
   nm.date,
   nm.close as price
FROM
   max_date
INNER JOIN
   stocks AS nm
   ON nm.ticker = max_date.ticker
   AND nm.date = max_date.date;
