-- Stocks
CREATE TABLE stocks
(
    ticker character varying(6) NOT NULL,
    first_date timestamp without time zone NOT NULL,
    open numeric(10,2)[] NOT NULL,
    high numeric(10,2)[] NOT NULL,
    low numeric(10,2)[] NOT NULL,
    close numeric(10,2)[] NOT NULL,
    volume numeric(10,2)[] NOT NULL
);

