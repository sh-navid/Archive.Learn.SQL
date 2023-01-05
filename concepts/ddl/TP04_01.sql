-- --------------------------------------------------------
-- Drop/Create Database
-- --------------------------------------------------------
DROP DATABASE IF EXISTS Test;
CREATE DATABASE Test;

-- --------------------------------------------------------
-- Drop/Create Table
-- --------------------------------------------------------
DROP TABLE IF EXISTS Record;
CREATE TABLE Record(
    ID      INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    Value   VARCHAR(50)
);

-- --------------------------------------------------------
-- Insert data
-- --------------------------------------------------------
INSERT INTO Record VALUES(NULL,"Hello");
INSERT INTO Record VALUES(NULL,"Hello");

-- --------------------------------------------------------
-- Alter
-- --------------------------------------------------------
ALTER TABLE Record AUTO_INCREMENT=1000;
ALTER TABLE Record ADD Value2 VARCHAR(50);

ALTER TABLE Record ADD Value3 VARCHAR(50);
ALTER TABLE Record DROP COLUMN Value3;

-- --------------------------------------------------------
-- SELECT DISTINCT
-- --------------------------------------------------------
INSERT INTO Record VALUES(NULL,"Goodbye","");
SELECT * FROM Record;
SELECT DISTINCT(Value) FROM Record;

-- --------------------------------------------------------
-- Constraint (Create Index)
-- --------------------------------------------------------
-- ALTER TABLE Record DROP INDEX my_index_2;
-- CREATE UNIQUE INDEX my_index_2 ON Record(Value);
CREATE INDEX my_index_2 ON Record(Value);

-- --------------------------------------------------------
-- Composite Primary Key 
-- --------------------------------------------------------
DROP TABLE IF EXISTS Record;
CREATE TABLE Record(
    V1      VARCHAR(50),
    V2      VARCHAR(50),
    PRIMARY KEY(V1,V2)
);

-- ALTER TABLE Record ADD PRIMARY KEY (V1,V2);
DESCRIBE Record;

INSERT INTO Record VALUES ("H","H");
INSERT INTO Record VALUES ("H","H");
SELECT * FROM Record;