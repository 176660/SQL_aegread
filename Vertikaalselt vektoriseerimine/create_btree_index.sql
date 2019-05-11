CREATE INDEX "IX_Stocks_ticker_date"
    ON stocks USING btree
    (ticker ASC NULLS LAST, first_date DESC NULLS LAST);
