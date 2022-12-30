-- --------------------------------------------------------------------------
-- Functions
-- --------------------------------------------------------------------------
DROP TABLE IF EXISTS Test;
CREATE TABLE Test(
    ID      INT,
    Val     VARCHAR(200),
    F       FLOAT
);
INSERT INTO Test VALUES(1,"Hello",14);
INSERT INTO Test VALUES(1,"Goodbye",25.00001);
INSERT INTO Test VALUES(1,"Hi",25.00001);

SELECT * FROM Test;

SELECT Val, CHAR_LENGTH(Val), LENGTH(Val) FROM Test; -- char len, byte len

SELECT Val, CONCAT(Val,Val) FROM Test;

SELECT Val, CONCAT_WS("---",Val,Val) FROM Test;

SELECT F,   Format(F,6) FROM Test;

SELECT Val, INSERT(Val,1,LENGTH("[]"),"[]") FROM Test;

SELECT Val, INSTR(Val,"e") FROM Test; -- Search for `e` in Val

SELECT Val, LEFT(Val,4) FROM Test; -- Extract 4 chars from left

SELECT Val, RIGHT(Val,4) FROM Test; -- Extract 4 chars from right