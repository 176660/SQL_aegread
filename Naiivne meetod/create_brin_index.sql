CREATE INDEX stocks_ticker_date_idx
    ON stocks USING brin
    (ticker, date);
