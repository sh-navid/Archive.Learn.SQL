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
    Author_ID       INTEGER             NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Author_ID)  REFERENCES  Author(ID) -- ON DELETE CASCADE ON UPDATE CASCADE,
                                                    -- CASCADE, RESTRICT, SET NULL, NO ACTION
);





INSERT INTO Author    VALUES (1,    "Alireza");
INSERT INTO Author    VALUES (2,    "Saeed");
INSERT INTO Author    VALUES (50,   "Majid");
INSERT INTO Author    VALUES (60,   NULL);

INSERT INTO Book      VALUES (NULL, "Book1", 1);
INSERT INTO Book      VALUES (NULL, "Book2", 1);
INSERT INTO Book      VALUES (NULL, "Book3", 2);
INSERT INTO Book      VALUES (NULL, "Book4", 2);
INSERT INTO Book      VALUES (NULL, "Book5", NULL);


-- --------------------------------------------------------
-- INNER JOIN
-- --------------------------------------------------------
SELECT Book.Title, Author.Name 
FROM Book
INNER JOIN Author
ON Book.Author_ID = Author.ID;

-- --------------------------------------------------------
-- LEFT JOIN
-- --------------------------------------------------------
SELECT Book.Title, Author.Name 
FROM Book
LEFT JOIN Author
ON Book.Author_ID = Author.ID;

-- --------------------------------------------------------
-- RIGHT JOIN
-- --------------------------------------------------------
SELECT Book.Title, Author.Name 
FROM Book
RIGHT JOIN Author
ON Book.Author_ID = Author.ID;

-- --------------------------------------------------------
-- FULL OUTER JOIN
-- --------------------------------------------------------
SELECT Book.Title, Author.Name 
FROM Book
LEFT JOIN Author
ON Book.Author_ID = Author.ID
UNION
SELECT Book.Title, Author.Name 
FROM Book
RIGHT JOIN Author
ON Book.Author_ID = Author.ID;

-- --------------------------------------------------------
-- CROSS JOIN - All Records From All Tables
-- --------------------------------------------------------
SELECT Book.Title, Author.Name 
FROM Book
CROSS JOIN Author
ON Book.Author_ID = Author.ID;


-- --------------------------------------------------------
-- CROSS JOIN - All Records From All Tables
-- --------------------------------------------------------
SELECT Book.Title, Author.Name 
FROM Book
CROSS JOIN Author
ON Book.Author_ID = Author.ID;


-- --------------------------------------------------------
-- SELF JOIN - NOT A GOOD EXAMPLE
-- --------------------------------------------------------
DROP TABLE IF EXISTS T;
CREATE TABLE IF NOT EXISTS T( -- WARNING A COMPLETE BAD PRACTICE
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Student         VARCHAR(100)    DEFAULT NULL,
    Teacher         VARCHAR(100)    DEFAULT NULL,
    PRIMARY KEY (ID)
);
INSERT INTO T VALUES(NULL,"S1","T1");
INSERT INTO T VALUES(NULL,"S2","T1");
INSERT INTO T VALUES(NULL,"S3","T1");
INSERT INTO T VALUES(NULL,"S1","T2");
INSERT INTO T VALUES(NULL,"S2","T2");
INSERT INTO T VALUES(NULL,"S4",DEFAULT);
INSERT INTO T VALUES(NULL,DEFAULT,"T3");

-- SELECT DISTINCT T1.Student, T2.Teacher
-- FROM T AS T1
-- LEFT JOIN T AS T2
-- ON T1.ID = T2.ID
-- ORDER BY T1.Student, T2.Teacher;

SELECT DISTINCT T1.Student, T2.Teacher
FROM T AS T1, T AS T2
WHERE T1.ID <> T2.ID
ORDER BY T1.Student, T2.Teacher;