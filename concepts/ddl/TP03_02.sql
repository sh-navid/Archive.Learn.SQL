-- --------------------------------------------------------------------------
-- Datatypes
-- --------------------------------------------------------------------------
DROP    TABLE IF EXISTS StringA;
CREATE  TABLE StringA(
    c           CHAR(1),            -- Max is 255
    b           BINARY(1)           -- Max is 255, Just like CHAR but stores BINARY
);

INSERT INTO StringA VALUES ("A","A");
SELECT * FROM StringA;




DROP    TABLE IF EXISTS StringB;
CREATE  TABLE StringB(
    vc          VARCHAR(3000),      -- Max is 65536
    vb          VARBINARY(3000)     -- Max is 65536, Just like CHAR but stores BINARY
);

INSERT INTO StringB VALUES ("A","A");
SELECT * FROM StringB;




DROP    TABLE IF EXISTS BlobTypes;
CREATE  TABLE BlobTypes(
    b1          TINYBLOB,          -- Max is 255            bytes of data - Binary Large Objects 
    b2          BLOB(400),         -- Max is 65535          bytes of data     
    b3          MEDIUMBLOB,        -- Max is 16,777,215     bytes of data   
    b4          LONGBLOB           -- Max is 4,294,967,295  bytes of data  
);

INSERT INTO BlobTypes VALUES ("A","A","A","A");
SELECT * FROM BlobTypes;




DROP    TABLE IF EXISTS TextTypes;
CREATE  TABLE TextTypes(
    t1          TINYTEXT,          -- Max is 255            length of text
    t2          TEXT(400),         -- Max is 65535          length of text   
    t3          MEDIUMTEXT,        -- Max is 16,777,215     length of text
    t4          LONGTEXT           -- Max is 4,294,967,295  length of text
);

INSERT INTO TextTypes VALUES ("A","A","A","A");
SELECT * FROM TextTypes;