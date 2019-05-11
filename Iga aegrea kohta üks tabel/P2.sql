EXPLAIN ANALYZE
WITH max_date AS
(
   SELECT
      stocks.tableoid AS table_id,
      MAX(date) AS date
   FROM
      stocks
   GROUP BY
      table_id
)
SELECT
   UPPER(SUBSTRING(relname FROM '_(.*?)_')) AS ticker,
   s.date,
   s.close as price
FROM
   max_date
INNER JOIN
   stocks AS s
   ON x.tableoid = max_date.table_id
   AND x.DATE = max_date.date
LEFT JOIN
   pg_class AS pg
   ON pg.oid = max_date.table_id;
