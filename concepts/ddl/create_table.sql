-- DROP TABLE Books;

CREATE TABLE Books(
    ID      INTEGER         NOT NULL    UNIQUE,
    TITLE   VARCHAR(100)    NOT NULL,

    PRIMARY KEY (ID)
);

SHOW TABLES;