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
-- Constraints - Default, Not Null
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


-- --------------------------------------------------------------------------
-- Constraints - Check
-- --------------------------------------------------------------------------

DROP   TABLE IF EXISTS Users;
CREATE TABLE Users( 
    ID          INTEGER unsigned    PRIMARY KEY auto_increment, 
    First       VARCHAR(30),
    Last        VARCHAR(30),
    CONSTRAINT check_name_len CHECK (LENGTH(First)>2 AND LENGTH(Last)>2)     
);

INSERT INTO Users VALUES(NULL, "Ali", "Ali");
INSERT INTO Users VALUES(NULL, "Al", "Al");
SELECT * FROM Users;


-- --------------------------------------------------------------------------
-- Constraints - FOREIGN Key
-- --------------------------------------------------------------------------
DROP   TABLE IF EXISTS Orders;
DROP   TABLE IF EXISTS Gender;
DROP   TABLE IF EXISTS Users;

DROP   TABLE IF EXISTS Gender;
CREATE TABLE Gender( 
    ID          INTEGER unsigned    PRIMARY KEY, 
    Value       VARCHAR(30)
);

DROP   TABLE IF EXISTS Users;
CREATE TABLE Users( 
    ID          INTEGER unsigned    PRIMARY KEY auto_increment, 
    First       VARCHAR(30),
    Last        VARCHAR(30),
    GenderID    INTEGER unsigned,
    FOREIGN KEY (GenderID) REFERENCES Gender(ID) 
);

DROP   TABLE IF EXISTS Orders;
CREATE TABLE Orders( 
    ID          INTEGER unsigned    PRIMARY KEY auto_increment, 
    Value       VARCHAR(30),
    UserID      INTEGER unsigned,
    -- --------------------------------------------------------------------------
);

INSERT INTO Gender VALUES(1, "M");
INSERT INTO Gender VALUES(2, "F");

INSERT INTO Users VALUES(NULL, "Ali", "Ali",1);
INSERT INTO Users VALUES(NULL, "Lale", "Lale",2);

INSERT INTO Orders VALUES(NULL, "Cake", 2);
INSERT INTO Orders VALUES(NULL, "Flower", 2);
INSERT INTO Orders VALUES(NULL, "Soda", 1);
INSERT INTO Orders VALUES(NULL, "Phone", 1);

SELECT * FROM Users;
SELECT * FROM Orders;
DELETE FROM Users WHERE ID=1;
SELECT * FROM Users;
SELECT * FROM Orders;

-- --------------------------------------------------------------------------
-- Constraints - Create Index
-- --------------------------------------------------------------------------