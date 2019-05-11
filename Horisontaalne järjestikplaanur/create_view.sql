CREATE VIEW stocks_view AS
SELECT
   ticker,
   rra_bundle.latest - INTERVAL '1 SECOND' * rra_bundle.step * MOD(rra_bundle.size + MOD(EXTRACT(epoch FROM rra_bundle.latest)::BIGINT / (rra_bundle.step), rra_bundle.size) - i, rra_bundle.size) AS date,
   open[array_pos] AS open,
   high[array_pos] AS high,
   low[array_pos] AS low,
   close[array_pos] AS close,
   volume[array_pos] AS volume
FROM
   rra
   JOIN
      rra_bundle
      ON rra_bundle.rra_bundle_id = rra.rra_bundle_id
   JOIN
      rra_stocks AS ts
      ON ts.rra_bundle_id = rra_bundle.rra_bundle_id;
