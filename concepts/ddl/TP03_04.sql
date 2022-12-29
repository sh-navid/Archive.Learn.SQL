-- --------------------------------------------------------------------------
-- Normalization (https://www.techtarget.com/searchdatamanagement/definition/normalization)
-- || Database normalization is the process of organizing data into tables.

-- --------------------------------------------------------------------------
-- First normal form (1NF): (https://www.geeksforgeeks.org/first-normal-form-1nf/)
-- -- 1 -> There are only single-valued Attributes.
-- -- 2 -> Attribute Domain does not change.
-- -- 3 -> There is a unique name for every Attribute/Column.
-- -- 4 -> The order in which data is stored does not matter.

-- Books (Without Normalization)
-- ID      Name       Author
-- 01      Book1      Author1, Author2, Author3  <- [Multi-Valued]

-- Books (1NF)
-- ID      Name       Author
-- 01      Book1      Author1  
-- 02      Book1      Author2  
-- 02      Book1      Author3  

-- --------------------------------
-- Books
-- ID      Name       AuthorID
-- 01      Book1      01  
-- 02      Book1      02
-- 02      Book1      03

-- Authors
-- ID      Name
-- 01      Author1       
-- 02      Author2    
-- 02      Author3    
 
-- --------------------------------------------------------------------------
-- Second normal form (2NF): (https://www.tutorialspoint.com/Second-Normal-Form-2NF)
-- -- 1 -> A table is in 2NF, only if a relation is in 1NF and meet all the rules
-- -- 2 -> And every non-key attribute is fully dependent on primary key.

-- Books
-- ID      Name     Desc      AuthorID
-- 01      Book1    Desc1     01  
-- 02      Book1    Desc1     02
-- 02      Book1    Desc1     03

-- Authors
-- ID      Name
-- 01      Author1       
-- 02      Author2    
-- 02      Author3  

-- --------------------------------
-- Books
-- ID      Name     Desc
-- 01      Book1    Desc1 

-- Authors
-- ID      Name
-- 01      Author1       
-- 02      Author2    
-- 02      Author3  

-- BooksAuthors
-- BookID   AuthorID
-- 01       01
-- 01       02
-- 01       03

-- Third normal form (3NF):
-- Boyce-Codd normal form (BCNF):
-- Fourth normal form (4NF):
-- Fifth normal form (5NF):
-- --------------------------------------------------------------------------