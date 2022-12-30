-- --------------------------------------------------------------------------
-- String Functions
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

SELECT Val, LOCATE("o",Val) FROM Test;

SELECT Val, LPAD(Val,30,"[]") FROM Test;

SELECT Val, MID(Val,2,4) FROM Test; -- Substring -> (String, from, len) === SUBSTR()

SELECT Val, REPEAT(Val,5) FROM Test;

SELECT Val, REPLACE(Val,"o","[O]") FROM Test;

SELECT Val, REVERSE(Val) FROM Test;

SELECT Val, STRCMP(Val,Val) FROM Test; -- Compare 2 strings

SELECT Val, STRCMP(Val,"Hello") FROM Test; -- Compare 2 strings

SELECT Val, STRCMP(Val,"Bye") FROM Test; -- Compare 2 strings


-- --------------------------------------------------------------------------
-- Math Functions
-- --------------------------------------------------------------------------

SELECT ABS(-12);

SELECT COUNT(*) FROM Test;

SELECT MIN(F), AVG(F), MAX(F), SUM(F) FROM Test;

SELECT R, FLOOR(R), CEIL(R), POW(R,2), SQRT(R) FROM (SELECT RAND()+10 AS R) AS MySelect;

SELECT PI();

SELECT SIGN(0), SIGN(1000), SIGN(-5);

SELECT TRUNCATE(N,1), TRUNCATE(N,2), TRUNCATE(N,3) FROM (SELECT 12.4561 AS N) AS T;


-- --------------------------------------------------------------------------
-- Date Functions
-- --------------------------------------------------------------------------
DROP    TABLE IF EXISTS TimeTable;
CREATE  TABLE TimeTable(
    d            DATE,
    dt           DATETIME,
    ts           TIMESTAMP,
    t            TIME,
    y            YEAR
);
INSERT INTO TimeTable VALUES (NOW(),NOW(),NOW(),NOW(),NOW());
SELECT * FROM TimeTable;


SELECT CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP, NOW();

SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  DAY);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  SECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  MICROSECOND)
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  MINUTE);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  HOUR);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  DAY);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  WEEK);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  MONTH);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  QUARTER);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  YEAR);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  SECOND_MICROSECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  MINUTE_MICROSECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  MINUTE_SECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  HOUR_MICROSECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  HOUR_SECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  HOUR_MINUTE);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  DAY_MICROSECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  DAY_SECOND);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  DAY_MINUTE);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  DAY_HOUR);
SELECT NOW(),ADDDATE(NOW(),INTERVAL 10  YEAR_MONTH);
