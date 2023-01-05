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
ALTER TABLE Record MODIFY Value2 VARCHAR(60);

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
    V3      VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY(V1,V2)
);

-- ALTER TABLE Record ADD PRIMARY KEY (V1,V2);
DESCRIBE Record;

INSERT INTO Record VALUES ("H","H",NULL);
INSERT INTO Record VALUES ("H","H",NULL);
SELECT * FROM Record;

-- --------------------------------------------------------
-- Where
-- --------------------------------------------------------
INSERT INTO Record VALUES ("Hi","Hello",DEFAULT);
INSERT INTO Record VALUES ("Hi","Hey",DEFAULT);
INSERT INTO Record VALUES ("Bye","GoodBye","DDD");
INSERT INTO Record VALUES ("Bye","ByeBye",DEFAULT);
INSERT INTO Record VALUES ("Bye","BB","ABC");

SELECT * FROM Record WHERE V1 LIKE "_i" OR V2 LIKE "H*"; -- IN, LIKE, BETWEEN, =, <>, AND, OR, NOT

SELECT * FROM Record WHERE 1=1 ORDER BY V2 ASC; -- ASC|DESC

-- --------------------------------------------------------
-- Null
-- --------------------------------------------------------
SELECT * FROM Record WHERE V3 IS NULL;
SELECT * FROM Record WHERE V3 IS NOT NULL;

-- --------------------------------------------------------
-- Update/Delete
-- --------------------------------------------------------