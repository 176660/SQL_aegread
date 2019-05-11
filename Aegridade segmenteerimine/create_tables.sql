-- Stocks_description

CREATE TABLE stocks_description
(
	ts_id varchar(20) NOT NULL,
	start_date date NOT NULL,
	end_date date NULL,
	frequency integer NOT NULL,
	ticker varchar(6) NOT NULL
);

ALTER TABLE stocks_description ADD CONSTRAINT
PK_stocks_description PRIMARY KEY (ts_id);



-- Stocks_values

CREATE TABLE stocks_values
(
	ts_id varchar(20) NOT NULL,
	multiv varchar(10) NOT NULL,
	seg integer NOT NULL,
	v1 numeric(10,2) NULL,
	v2 numeric(10,2) NULL,
	v3 numeric(10,2) NULL,
	v4 numeric(10,2) NULL,
	v5 numeric(10,2) NULL
);

ALTER TABLE stocks_values ADD CONSTRAINT
PK_stocks_values PRIMARY KEY (ts_id, multiv, seg);

ALTER TABLE stocks_values ADD CONSTRAINT FK_stocks_values_stocks_description FOREIGN KEY (ts_id) REFERENCES stocks_description (ts_id)
ON DELETE CASCADE ON UPDATE CASCADE;



-- Stocks_status

CREATE TABLE stocks_status
(
	ts_id varchar(20) NOT NULL,
	seg integer NOT NULL,
	s1 boolean NOT NULL   DEFAULT FALSE,
	s2 boolean NOT NULL   DEFAULT FALSE,
	s3 boolean NOT NULL   DEFAULT FALSE,
	s4 boolean NOT NULL   DEFAULT FALSE,
	s5 boolean NOT NULL   DEFAULT FALSE
);
ALTER TABLE stocks_status ADD CONSTRAINT
PK_stocks_status PRIMARY KEY (ts_id, seg);

ALTER TABLE stocks_status ADD CONSTRAINT
FK_stocks_status_stocks_description FOREIGN KEY (ts_id)
REFERENCES stocks_description (ts_id)
ON DELETE CASCADE ON UPDATE CASCADE;

