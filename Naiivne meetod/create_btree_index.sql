CREATE INDEX stocks_ticker_date_idx
    ON stocks USING btree
    (ticker ASC NULLS LAST, date DESC NULLS LAST);
