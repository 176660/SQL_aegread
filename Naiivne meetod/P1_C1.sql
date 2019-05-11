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
   (array_agg(open ORDER BY date ASC))[1] AS open,
   MAX(high) AS high,
   MIN(low) AS low,
   (array_agg(close ORDER BY date DESC))[1] AS close,
   SUM(volume) AS volume
FROM
   intervals
JOIN
   stocks AS nm
   ON nm.ticker = 'AMZN'
   AND nm.date > intervals.start
   AND nm.date <= intervals.end
GROUP BY ticker, intervals.end
ORDER BY
   intervals.end;
