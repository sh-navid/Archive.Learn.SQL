-- --------------------------------------------------------------------------
-- String Functions
-- --------------------------------------------------------------------------
DROP TABLE IF EXISTS Test;
CREATE TABLE Test(
    ID      INT PRIMARY KEY AUTO_INCREMENT,
    Val     VARCHAR(200),
    F       FLOAT
);
INSERT INTO Test VALUES(NULL,"Hello",14);
INSERT INTO Test VALUES(NULL,"Goodbye",25.00001);
INSERT INTO Test VALUES(NULL,"Hi",25.00001);

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


SELECT NOW(),ADDTIME(NOW(),"2"); -- 2 seconds
SELECT NOW(),ADDTIME(NOW(),"2:2:2"); -- 2 hours, 2 minutes, 2 seconds


SELECT DATE(NOW()), YEAR(NOW()), MONTH(NOW()), DAY(NOW());


SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());


SELECT DATEDIFF("2020-02-02","2020-03-02");


SELECT DATE_FORMAT(NOW(), "%Y (%y) - %M (%m) - %W (%w) - %p - %j");
SELECT TIME_FORMAT(NOW(), "%H");


SELECT NOW(),SUBDATE(NOW(),INTERVAL 10  DAY);


SELECT DAYNAME(NOW());


SELECT  DAYOFYEAR(NOW()), DAYOFMONTH(NOW()), DAYOFWEEK(NOW());


SELECT NOW(),EXTRACT(DAY FROM NOW());
SELECT NOW(),EXTRACT(YEAR FROM NOW());
SELECT NOW(),EXTRACT(MONTH FROM NOW());


SELECT LAST_DAY(NOW()), MONTHNAME(NOW());


SELECT TIME_TO_SEC("0:1:30");
SELECT SEC_TO_TIME(90);


SELECT TIMEDIFF("1:20:00","2:30:00");


-- --------------------------------------------------------------------------
-- Other Functions
-- --------------------------------------------------------------------------

SELECT BIN(10), HEX(10), OCT(10);

SELECT ASCII("A"), ORD("A");

SELECT CAST(NOW() AS TIME), CAST(NOW() AS DATE), CAST(NOW() AS CHAR);

SELECT CONV(1110,2,10),CONV(1110,2,16); -- Convert from base 2 to base 10 or 16

SELECT LAST_INSERT_ID() FROM Test LIMIT 1;