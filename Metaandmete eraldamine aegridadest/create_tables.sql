-- Currencies

CREATE TABLE currencies
(
	currency_code varchar(3) NOT NULL,
	currency_name varchar(50) NOT NULL,
	symbol varchar(3) NOT NULL
);

ALTER TABLE currencies ADD CONSTRAINT PK_currencies
	PRIMARY KEY (currency_code);


-- Stocks
CREATE TABLE stocks
(
	ticker varchar(6) NOT NULL,
	currency varchar(3) NOT NULL
);

ALTER TABLE stocks ADD CONSTRAINT PK_stocks
	PRIMARY KEY (ticker);

CREATE INDEX IXFK_stocks_currencies ON stocks (currency_code ASC);

ALTER TABLE stocks ADD CONSTRAINT FK_stocks_currencies
	FOREIGN KEY (currency_code) REFERENCES currencies (currency_code) ON DELETE No Action ON UPDATE CASCADE;


-- Stocks_timeseries
CREATE TABLE stocks_timeseries
(
	ticker varchar(6) NOT NULL,
	date timestamp without time zone NOT NULL,
	open numeric(10,2) NOT NULL,
	high numeric(10,2) NOT NULL,
	low numeric(10,2) NOT NULL,
	close numeric(10,2) NOT NULL,
	volume numeric(10,2) NOT NULL
);

ALTER TABLE stocks_timeseries ADD CONSTRAINT PK_Stocks_timeseries
	PRIMARY KEY (ticker, date);

ALTER TABLE stocks_timeseries ADD CONSTRAINT FK_stocks_timeseries_stocks
	FOREIGN KEY (ticker) REFERENCES stocks (ticker) ON DELETE CASCADE ON UPDATE CASCADE;
