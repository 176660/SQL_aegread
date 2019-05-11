CREATE VIEW stocks_view AS
SELECT first_date,
    first_date + '00:01:00'::interval * i AS date,
    ticker,
    open[i] AS open,
    high[i] AS high,
    low[i] AS low,
    close[i] AS close,
    volume[i] AS volume
FROM stocks,
     generate_series(0, 59) gs(i)
WHERE open[i] IS NOT NULL;
