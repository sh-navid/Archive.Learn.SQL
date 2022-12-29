-- --------------------------------------------------------------------------
-- Constraints
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