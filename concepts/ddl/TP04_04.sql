DROP TABLE IF EXISTS Author;
CREATE TABLE IF NOT EXISTS Author(
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Name            VARCHAR(100)    NOT NULL,
    PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS Counter;
CREATE TABLE IF NOT EXISTS Counter(
    ID              INTEGER         NOT NULL    UNIQUE      AUTO_INCREMENT,
    Value           INTEGER         NOT NULL,
    PRIMARY KEY (ID)
);
INSERT INTO Counter VALUES(1,0);



-- --------------------------------------------------------------------------
-- TRIGGER - AFTER INSERT                                                  --
-- --------------------------------------------------------------------------
DROP TRIGGER IF EXISTS my_trigger;
DELIMITER //
CREATE DEFINER = CURRENT_USER TRIGGER my_trigger AFTER INSERT 
ON Author FOR EACH ROW
BEGIN
	UPDATE Counter SET Value = Value+1;
END//
DELIMITER ;




INSERT INTO Author VALUES(NULL,"Hello");
INSERT INTO Author VALUES(NULL,"Bye");
INSERT INTO Author VALUES(NULL,"ByeBye");
INSERT INTO Author VALUES(NULL,"Foot");

SELECT * FROM Counter;