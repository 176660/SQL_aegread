CREATE VIEW stocks_view AS
SELECT
	ts.date,
	s.ticker,
	ts.open[s.stock_id] AS open,
	ts.high[s.stock_id] AS high,
	ts.low[s.stock_id] AS low,
	ts.close[s.stock_id] AS close,
	ts.volume[s.stock_id] AS volume
FROM
	stocks_timeseries ts,
	stocks s;