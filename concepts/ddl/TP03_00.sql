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
    Publisher_ID    INTEGER             NULL,
    BookType_ID     INTEGER             NULL,
    BookSize_ID     INTEGER             NULL,
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
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book7", 1000000007, "2022-10-09", 51,    2,      1);
INSERT INTO Books  (ID, Title, ISBN, Published_Date, Publisher_ID, BookType_ID, BookSize_ID)    VALUES (NULL, "Book8", 1000000008, now(),        NULL,  NULL,   NULL);

-- SELECT * FROM Books;


-- --------------------------------------------------------------------------
-- INNER JOIN                                                              --
-- --------------------------------------------------------------------------
-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- INNER JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID;


-- --------------------------------------------------------------------------
-- LEFT JOIN                                                               --
-- --------------------------------------------------------------------------
-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- LEFT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID;


-- --------------------------------------------------------------------------
-- RIGHT JOIN                                                              --
-- --------------------------------------------------------------------------
-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- RIGHT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID;


-- --------------------------------------------------------------------------
-- UNION                                                                   --
-- --------------------------------------------------------------------------
-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- LEFT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID
-- UNION
-- SELECT Books.Title, Publishers.Name 
-- FROM Books
-- RIGHT JOIN Publishers
-- ON Books.Publisher_ID = Publishers.ID;




SELECT Books.Title as Title, Publishers.Name as Pub, BookSize.Title as Size, BookTypes.title as Type
FROM Books
LEFT JOIN Publishers
ON Books.Publisher_ID = Publishers.ID
LEFT JOIN BookTypes
ON Books.BookType_ID = BookTypes.ID
LEFT JOIN BookSize
ON Books.BookSize_ID = BookSize.ID;


-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
-- NEW COURCE
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------


-- --------------------------------------------------------------------------
-- PROCEDURE                                                               --
-- --------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS count_books;
CREATE PROCEDURE count_books () 
BEGIN
    SELECT count(*)
    FROM BookSize;
END;
-- CALL count_books();


DROP PROCEDURE IF EXISTS get_book_by_id;
CREATE PROCEDURE get_book_by_id (IN book_id INT) 
BEGIN
    IF book_id >3 THEN
        SELECT Title
        FROM Books
        WHERE ID=book_id;
    ELSE
        SELECT Title
        FROM BookSize
        WHERE ID=book_id;
    END IF;
END;
-- CALL get_book_by_id(1);
-- CALL get_book_by_id(4);


DROP PROCEDURE IF EXISTS check_books_count;
CREATE PROCEDURE check_books_count (IN max_count INT) 
BEGIN
    DECLARE MY_COUNT INT DEFAULT 0;

    SELECT count(*) INTO MY_COUNT
    FROM Books;

    IF MY_COUNT>max_count THEN
        SELECT * FROM Books;
    ELSE
        SELECT * FROM BookSize;
    END IF;
END;
-- CALL check_books_count(2);


-- --------------------------------------------------------------------------
-- SELECT IN SELECT                                                        --
-- --------------------------------------------------------------------------
SELECT * FROM (SELECT * FROM Books) AS B;

SELECT Title FROM (SELECT * FROM Books) AS B;

SELECT Title FROM (SELECT * FROM Books) AS B WHERE ID<4;

SELECT Title FROM (SELECT * FROM Books) AS B WHERE ID IN (SELECT ID FROM Books WHERE Publisher_ID=1);

SELECT B.Title FROM (SELECT * FROM Books) AS B WHERE ID IN (SELECT ID FROM Books WHERE Publisher_ID=1);

SELECT B.Title FROM (SELECT * FROM Books) AS B WHERE ID IN (SELECT ID FROM Books WHERE Publisher_ID IN (SELECT ID as Publisher_ID FROM Publishers WHERE Name='alireza'));

-- --------------------------------------------------------------------------
-- GROUP BY - HAVING                                                       --
-- --------------------------------------------------------------------------
SELECT Published_Date FROM Books GROUP BY Published_Date;

SELECT Publisher_ID FROM Books GROUP BY Publisher_ID;

SELECT count(*), Published_Date FROM Books GROUP BY Published_Date;

SELECT count(*) AS Published_Books, Published_Date FROM Books GROUP BY Published_Date HAVING Published_Books>=2;


-- --------------------------------------------------------------------------
-- CASE WHEN                                                               --
-- --------------------------------------------------------------------------
SELECT Title, BookSize_ID,
CASE
    WHEN BookSize_ID =1 THEN "SMALL BOOK"
    WHEN BookSize_ID<>1 THEN "NOT SMALL BOOK"
    ELSE "UNDEFINED"
END AS MY_BOOK_SIZE
FROM Books;