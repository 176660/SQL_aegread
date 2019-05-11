CREATE INDEX stock_amzn_date_idx
    ON stock_amzn USING btree
    (date DESC NULLS LAST);
