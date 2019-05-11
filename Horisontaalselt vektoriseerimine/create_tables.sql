-- stocks

CREATE TABLE stocks
(
    stock_id integer NOT NULL,
    ticker character varying(6) NOT NULL,
    CONSTRAINT pk_stocks PRIMARY KEY (stock_id)
);

ALTER TABLE stocks ADD CONSTRAINT UQ_stocks_ticker
UNIQUE (ticker);


-- stocks_timeseries

CREATE TABLE stocks_timeseries
(
    date timestamp without time zone NOT NULL,
    open numeric(10,2)[] NOT NULL,
    high numeric(10,2)[] NOT NULL,
    low numeric(10,2)[] NOT NULL,
    close numeric(10,2)[] NOT NULL,
    volume numeric(10,2)[] NOT NULL
);
