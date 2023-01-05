-- --------------------------------------------------------------------------
-- Constraints - Create Index
-- --------------------------------------------------------------------------
DROP TABLE IF EXISTS Test;
CREATE TABLE Test(
    ID      INT PRIMARY KEY AUTO_INCREMENT,
    Val     VARCHAR(200),
    F       FLOAT
);

CREATE INDEX val_idx ON Test(Val);

ALTER TABLE Test DROP INDEX val_idx;

CREATE UNIQUE INDEX val_idx ON Test(Val);


-- --------------------------------------------------------------------------
-- About Indexes
-- --------------------------------------------------------------------------
-- Indexes let search for data faster
-- However indexes themselves need to update
-- So just put index on needed columns for performance