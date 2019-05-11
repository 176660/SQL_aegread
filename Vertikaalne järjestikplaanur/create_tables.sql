-- rra
CREATE TABLE rra
(
	ticker varchar(6) NOT NULL,
	step integer NOT NULL,
	size integer NOT NULL,
	width integer NOT NULL,
	latest timestamp without time zone NOT NULL
);

ALTER TABLE rra ADD CONSTRAINT PK_rra PRIMARY KEY (ticker);


-- rra_stocks

CREATE TABLE rra_stocks
(
	ticker varchar(6) NOT NULL,
	n integer NOT NULL,
	open numeric(10,2)[] NOT NULL,
	high numeric(10,2)[] NOT NULL,
	low numeric(10,2)[] NOT NULL,
	close numeric(10,2)[] NOT NULL,
	volume numeric(10,2)[] NOT NULL
);

ALTER TABLE rra_stocks ADD CONSTRAINT PK_rra_stocks
	PRIMARY KEY (ticker,n);

ALTER TABLE rra_stocks ADD CONSTRAINT FK_rra_stocks_rra
	FOREIGN KEY (ticker) REFERENCES rra (ticker) ON DELETE CASCADE ON UPDATE CASCADE;
