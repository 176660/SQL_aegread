-- Stocks
CREATE TABLE stocks
(
	ticker varchar(6) NOT NULL,
	date timestamp without time zone NOT NULL,
	open numeric(10,2) NOT NULL,
	high numeric(10,2) NOT NULL,
	low numeric(10,2) NOT NULL,
	close numeric(10,2) NOT NULL,
	volume numeric(10,2) NOT NULL
);
