-- --------------------------------------------------------------------------
-- SELECT/INSERT INTO                                                      --
-- --------------------------------------------------------------------------

DROP DATABASE IF EXISTS Test;
CREATE DATABASE Test;
USE Test;

DROP TABLE IF EXISTS Author;
CREATE TABLE IF NOT EXISTS Author(
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Name            VARCHAR(100)    NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO Author VALUES(NULL,"Hello");
INSERT INTO Author VALUES(NULL,"Bye");
INSERT INTO Author VALUES(NULL,"ByeBye");
INSERT INTO Author VALUES(NULL,"Foot");

SHOW TABLES;

CREATE TABLE AuthorCopy LIKE Author; 
INSERT INTO AuthorCopy SELECT * FROM Author;

SHOW TABLES;
SELECT * FROM AuthorCopy;