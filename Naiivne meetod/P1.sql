-- CTE + Window

EXPLAIN ANALYZE
WITH intervals AS
(
   SELECT
      start::TIMESTAMP,
      start::TIMESTAMP + INTERVAL '15min' AS end
   FROM
      generate_series('2018-12-21 00:00:00', '2018-12-28 00:00:00', INTERVAL '15min') AS start
)
SELECT DISTINCT
   ticker,
   intervals.end AS date,
   FIRST_VALUE(open) OVER w AS open,
   MAX(high) OVER w AS high,
   MIN(low) OVER w AS low,
   LAST_VALUE(close) OVER w AS close,
   SUM(volume) OVER w AS volume
FROM
   intervals
JOIN
   stocks AS nm
   ON nm.ticker = 'AMZN'
   AND nm.date > intervals.start
   AND nm.date <= intervals.end
   WINDOW w AS
   (
      PARTITION BY
         intervals.end
      ORDER BY
         nm.date ASC
      ROWS BETWEEN unbounded preceding AND unbounded following
   )
ORDER BY
   intervals.end;
