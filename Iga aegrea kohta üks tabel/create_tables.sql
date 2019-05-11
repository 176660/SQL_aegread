-- Stocks
CREATE TABLE stocks
(
	date timestamp without time zone NOT NULL,
	open numeric(10,2) NOT NULL,
	high numeric(10,2) NOT NULL,
	low numeric(10,2) NOT NULL,
	close numeric(10,2) NOT NULL,
	volume numeric(10,2) NOT NULL
);

-- Stock_GOOGL
CREATE TABLE stock_googl() INHERITS (stocks);

-- Stock_FB
CREATE TABLE stock_fb() INHERITS (stocks);

-- Stock_AMZN
CREATE TABLE stock_amzn() INHERITS (stocks);
