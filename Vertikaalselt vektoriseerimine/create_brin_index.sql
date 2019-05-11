CREATE INDEX "IX_Stocks_ticker_date"
    ON stocks USING brin
    (ticker, first_date);