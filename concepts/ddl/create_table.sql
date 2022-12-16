-- --------------------------------------------------------------------------
-- DROP                                                                    --
-- --------------------------------------------------------------------------
-- DROP TABLE Books;
-- DROP DATABASE Test;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS BookTypes;
DROP TABLE IF EXISTS BookSize;


-- --------------------------------------------------------------------------
-- CREATE                                                                  --
-- --------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Publishers(
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Name            VARCHAR(100)    NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS BookTypes(
    ID              INTEGER         NOT NULL    UNIQUE,
    Title           VARCHAR(100)    NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS BookSize(
    ID              INTEGER         NOT NULL    UNIQUE,
    Title           VARCHAR(100)    NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Books(
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Title           VARCHAR(100)    NOT NULL,
    ISBN            INTEGER         NOT NULL    UNIQUE,
    Published_Date  DATE                NULL,
    Publisher_ID    INTEGER         NOT NULL,
    BookType_ID     INTEGER         NOT NULL,
    BookSize_ID     INTEGER         NOT NULL,
    Abstraction     VARCHAR(100)        NULL    DEFAULT     "No Value",

    PRIMARY KEY (ID),
    FOREIGN KEY (Publisher_ID)  REFERENCES  Publishers(ID), -- ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BookType_ID)   REFERENCES  BookTypes(ID),
    FOREIGN KEY (BookSize_ID)   REFERENCES  BookSize(ID)
);


-- --------------------------------------------------------------------------
-- SHOW                                                                    --
-- --------------------------------------------------------------------------
-- SHOW DATABASES;
-- SHOW TABLES;


-- --------------------------------------------------------------------------
-- INSERT                                                                  --
-- --------------------------------------------------------------------------
INSERT INTO Publishers (ID, Name)    VALUES (1,     "Alireza");
INSERT INTO Publishers (ID, Name)    VALUES (2,     "Saeed");
INSERT INTO Publishers               VALUES (50,    "Majid");


-- --------------------------------------------------------------------------
-- INSERT AUTO INCREMENT                                                   --
-- --------------------------------------------------------------------------
INSERT INTO Publishers               VALUES (null,  "David");


-- --------------------------------------------------------------------------
-- FILL THE DATABASE                                                       --
-- --------------------------------------------------------------------------
INSERT INTO BookTypes (ID, Title)    VALUES (1,     "Computer");
INSERT INTO BookTypes (ID, Title)    VALUES (2,     "History");
INSERT INTO BookTypes (ID, Title)    VALUES (3,     "Math");

INSERT INTO BookSize  (ID, Title)    VALUES (1,     "Small");
INSERT INTO BookSize  (ID, Title)    VALUES (2,     "Medium");
INSERT INTO BookSize  (ID, Title)    VALUES (3,     "Large");

INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book1", 1000000001, now(),        1,     1,      1);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book2", 1000000002, now(),        NULL,  1,      2);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book3", 1000000003, "2022-11-10", 2,     1,      3);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book4", 1000000004, "2022-10-09", NULL,  2,      3);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book5", 1000000005, now(),        1,     2,      2);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book6", 1000000006, now(),        50,    NULL,   3);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book7", 1000000007, NULL,         51,    2,      1);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book8", 1000000008, now(),        NULL,  NULL,   NULL);

-- SELECT * FROM Books;


-- --------------------------------------------------------------------------
-- INNER JOIN                                                              --
-- --------------------------------------------------------------------------

SELECT Books.Title, Publishers.Name 
FROM Books
INNER JOIN Publishers
ON Books.Publisher_ID = Publishers.ID;

-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- LEFT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID;

-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- RIGHT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID;



-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- LEFT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID
-- UNION
-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- RIGHT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID;