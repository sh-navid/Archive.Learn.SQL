source ./Desktop/GitRepo/SQL-Instructor/sql-instructor/concepts/ddl/create_table.sql
-- --------------------------------------------------------------------------
-- View -> Virtual Table
--      -> Shows always updated data
-- --------------------------------------------------------------------------
DROP VIEW IF EXISTS BooksView;
CREATE VIEW BooksView AS
SELECT Title FROM Books; 


DROP VIEW IF EXISTS BooksView2;
CREATE VIEW BooksView2 AS
SELECT Books.Title AS BookTitle, BookTypes.Title AS BookType FROM Books
LEFT JOIN BookTypes
ON Books.BookType_ID = BookTypes.ID; 


SELECT * FROM BooksView;
SELECT * FROM BooksView2;


-- Update/Change VIEW
CREATE OR REPLACE VIEW BooksView2 AS
SELECT Books.ID, Books.Title AS BookTitle, BookTypes.Title AS BookType FROM Books
LEFT JOIN BookTypes
ON Books.BookType_ID = BookTypes.ID; 


SELECT * FROM BooksView2;