DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;

-- --------------------------------------------------------------------------
-- CREATE                                                                  --
-- --------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Author(
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Name            VARCHAR(100)    NOT NULL,

    PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Book(
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Title           VARCHAR(100)    NOT NULL,
    Author_ID    INTEGER             NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Author_ID)  REFERENCES  Author(ID), -- ON DELETE CASCADE ON UPDATE CASCADE,
);



INSERT INTO Author    VALUES (1,     "Alireza");
INSERT INTO Author    VALUES (2,     "Saeed");
INSERT INTO Author    VALUES (50,    "Majid");

INSERT INTO Book      VALUES (NULL, "Book1", 1);
INSERT INTO Book      VALUES (NULL, "Book2", 1);
INSERT INTO Book      VALUES (NULL, "Book3", 2);
INSERT INTO Book      VALUES (NULL, "Book4", 2);
INSERT INTO Book      VALUES (NULL, "Book5", NULL);


-- --------------------------------------------------------
-- Left JOIN
-- --------------------------------------------------------