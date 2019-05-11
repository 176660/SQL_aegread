EXPLAIN ANALYZE
WITH max_date AS
(
   SELECT
      ticker,
      MAX(first_date) AS date
   FROM
      stocks_view
   GROUP BY
      ticker
)
SELECT DISTINCT
   sv.ticker,
   FIRST_VALUE(sv.date) OVER w AS date,
   FIRST_VALUE(sv.close) OVER w AS price
FROM
   max_date AS md
LEFT JOIN
   stocksview AS sv
   ON sv.ticker = md.ticker
   AND sv.first_date = md.date
   WINDOW w AS
      (
         PARTITION BY
      sv.ticker,
             sv.first_date
      	   ORDER BY
         	sv.date DESC
   ROWS BETWEEN unbounded preceding AND unbounded following
      );
