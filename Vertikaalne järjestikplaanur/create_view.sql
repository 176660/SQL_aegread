CREATE VIEW stocks_view AS
SELECT
   rra.ticker AS ticker,
   latest - INTERVAL '1 SECOND' * rra.step * MOD(rra.size + MOD(EXTRACT(epoch FROM rra.latest)::BIGINT / (rra.step), size) + 1 - (generate_subscripts(open, 1) + n * width), rra.size) AS date,
   UNNEST(open) AS open,
   UNNEST(high) AS high,
   UNNEST(low) AS low,
   UNNEST(close) AS close,
   UNNEST(volume) AS volume
FROM
   rra
INNER JOIN
   rra_stocks AS ts
   ON ts.ticker = rra.ticker;