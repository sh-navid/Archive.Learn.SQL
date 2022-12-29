-- --------------------------------------------------------------------------
-- Datatypes

-- --------------------------------------------------------------------------

DROP    TABLE IF EXISTS StringA;
CREATE  TABLE StringA(
    c           CHAR(1),          -- Max is 255
    b           BINARY(1)         -- Max is 255, Just like CHAR but stores BINARY
);

INSERT INTO StringA VALUES ("A","A");
SELECT * FROM StringA;



DROP    TABLE IF EXISTS StringB;
CREATE  TABLE StringB(
    vc           VARCHAR(3000),          -- Max is 65536
    vb           VARBINARY(3000)         -- Max is 65536, Just like CHAR but stores BINARY
);

INSERT INTO StringB VALUES ("A","A");
SELECT * FROM StringB;