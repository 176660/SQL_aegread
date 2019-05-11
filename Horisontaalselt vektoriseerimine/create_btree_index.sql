CREATE INDEX "IX_Stocks_timeseries_date"
    ON stocks_timeseries USING btree
    (date DESC NULLS LAST);
