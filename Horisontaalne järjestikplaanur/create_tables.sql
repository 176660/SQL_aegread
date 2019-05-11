-- rra_bundles

CREATE TABLE rra_bundles
(
	rra_bundle_id serial NOT NULL,
	step integer NOT NULL,
	size integer NOT NULL,
	latest timestamp without time zone NOT NULL
);

ALTER TABLE rra_bundles ADD CONSTRAINT PK_rra_bundles PRIMARY KEY (rra_bundle_id);

-- rra

CREATE TABLE rra
(
	rra_bundle_id integer NOT NULL,
	array_pos integer NOT NULL,
	ticker varchar(6) NOT NULL
);

ALTER TABLE rra ADD CONSTRAINT PK_rra
	PRIMARY KEY (rra_bundle_id,array_pos);

ALTER TABLE rra ADD CONSTRAINT FK_rra_rra_bundles
	FOREIGN KEY (rra_bundle_id) REFERENCES rra_bundles (rra_bundle_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- rra_stocks

CREATE TABLE rra_stocks
(
	rra_bundle_id integer NOT NULL,
	i integer NOT NULL,
	open numeric(10,2)[] NOT NULL,
	high numeric(10,2)[] NOT NULL,
	low numeric(10,2)[] NOT NULL,
	close numeric(10,2)[] NOT NULL,
	volume numeric(10,2)[] NOT NULL
);

CREATE INDEX IXFK_rra_stocks_rra_bundles ON rra_stocks (rra_bundle_id ASC);

ALTER TABLE rra_stocks ADD CONSTRAINT FK_rra_stocks_rra_bundles
	FOREIGN KEY (rra_bundle_id) REFERENCES rra_bundles (rra_bundle_id) ON DELETE CASCADE ON UPDATE CASCADE;
