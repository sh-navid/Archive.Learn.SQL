-- --------------------------------------------------------------------------
-- AUTO_INCREMENT from another value
-- --------------------------------------------------------------------------
DROP TABLE IF EXISTS Test;
CREATE TABLE Test(
    ID      INT PRIMARY KEY AUTO_INCREMENT,
    Val     VARCHAR(200),
    F       FLOAT
);

ALTER TABLE Test AUTO_INCREMENT=2000; 

INSERT INTO Test VALUES(NULL,"Hello",14);
INSERT INTO Test VALUES(NULL,"Goodbye",25.00001);
INSERT INTO Test VALUES(NULL,"Hi",25.00001);

SELECT * FROM Test;