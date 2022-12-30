-- --------------------------------------------------------------------------
-- Constraints - Primary Key
-- --------------------------------------------------------------------------

DROP   TABLE IF EXISTS Users;
CREATE TABLE Users( 
    ID          INTEGER unsigned    PRIMARY KEY auto_increment, 
    First       VARCHAR(30)         NOT NULL, 
    Last        VARCHAR(30)         NOT NULL, 

    CONSTRAINT  user_uq UNIQUE (First, Last)
);

INSERT INTO Users VALUES(NULL,"Ali","Alizad");
INSERT INTO Users VALUES(NULL,"Ali","Alizade");
INSERT INTO Users VALUES(NULL,"Ali","Alizade");
SELECT * FROM Users;


-- --------------------------------------------------------------------------
-- Constraints - Default
-- --------------------------------------------------------------------------

DROP   TABLE IF EXISTS Users;
CREATE TABLE Users( 
    ID          INTEGER unsigned    PRIMARY KEY auto_increment, 
    First       VARCHAR(30)         NOT NULL    default "NOT SET", 
    Last        VARCHAR(30)         NOT NULL    default "NOT SET"
);

INSERT INTO Users VALUES(NULL,"Ali",DEFAULT);
INSERT INTO Users VALUES(NULL,DEFAULT ,DEFAULT);
INSERT INTO Users VALUES(NULL,"Ali","Alizade");
INSERT INTO Users VALUES();
INSERT INTO Users VALUES();
INSERT INTO Users VALUES();
INSERT INTO Users VALUES(NULL,"A","A"),(NULL,"B","B"),(NULL,"C","C"); -- To insert multiple values
SELECT * FROM Users;