-- --------------------------------------------------------------------------
-- Datatypes - STRINGS
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




DROP    TABLE IF EXISTS EnumType;
CREATE  TABLE EnumType(
    e          ENUM('RED','GREEN','BLUE')          -- Select one from 65535 defined items
);
INSERT INTO EnumType VALUES ("RED");
INSERT INTO EnumType VALUES ("YELLOW");
INSERT INTO EnumType VALUES ("BLUE");
INSERT INTO EnumType VALUES ("BLUE");
INSERT INTO EnumType VALUES ("BLUE");
SELECT * FROM EnumType;
SELECT DISTINCT * FROM EnumType;
SELECT * FROM EnumType WHERE e = 'RED';




DROP    TABLE IF EXISTS SetType;
CREATE  TABLE SetType(
    s          SET('RED','GREEN','BLUE')          -- Select up to 64 items - IS CSV ??
);
INSERT INTO SetType VALUES ('RED');
INSERT INTO SetType VALUES ('RED,BLUE');
SELECT * FROM SetType;
SELECT * FROM SetType WHERE FIND_IN_SET( 'BLUE', s ) > 0;



-- --------------------------------------------------------------------------
-- Datatypes - Numeric
-- --------------------------------------------------------------------------
DROP    TABLE IF EXISTS BitType;
CREATE  TABLE BitType(
    bi           BIT,            -- Max is 64
    bo           BOOLEAN
);
INSERT INTO BitType VALUES (0,False);
INSERT INTO BitType VALUES (1,True);
SELECT * FROM BitType;
SELECT HEX(bi),bo FROM BitType;

SELECT ORD(bi),bo,
CASE
    WHEN bo =1 THEN "TRUE"
    WHEN bo<>1 THEN "FALSE"
    ELSE "UNDEFINED"
END AS B
FROM BitType;



DROP    TABLE IF EXISTS IntTypes;
CREATE  TABLE IntTypes(
    i1          TINYINT,                -- -128, 127
    i1u         TINYINT     UNSIGNED,   --  0,   255
    i2          INTEGER,                -- -2147483648, 2147483647
    i2u         INTEGER     UNSIGNED,   --  0,          4294967295
    i3          SMALLINT,               -- -32768, 32767
    i3u         SMALLINT    UNSIGNED,   --  0,     65535
    i4          MEDIUMINT,              -- -8388608, 8388607
    i4u         MEDIUMINT   UNSIGNED,   --  0,       16777215
    i5          BIGINT,                 -- -9223372036854775808, 9223372036854775807
    i5u         BIGINT      UNSIGNED    --  0,                   18446744073709551615
);
-- INSERT INTO IntTypes VALUES ("A","A","A","A");
SELECT * FROM IntTypes;