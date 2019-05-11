CREATE INDEX stock_amzn_date_idx
    ON stock_amzn USING brin
    (date);
