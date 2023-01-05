-- --------------------------------------------------------------------------
-- Recursive Category
-- --------------------------------------------------------------------------
DROP TABLE IF EXISTS Cat;
CREATE TABLE Cat(
    ID      INT PRIMARY KEY,
    Val     VARCHAR(200),
    CatID   INT,
    FOREIGN KEY (CatID) REFERENCES Cat(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ALTER TABLE Cat
--    ADD CONSTRAINT self_fk_ref 
--    FOREIGN KEY (CatID)
--    REFERENCES Cat(ID);

INSERT INTO Cat VALUES (1,"Hat",NULL);

INSERT INTO Cat VALUES (2,"Round Hat",NULL);
UPDATE Cat SET CatID=1 WHERE ID=2;

INSERT INTO Cat VALUES (3,"Cap Hat",NULL);
UPDATE Cat SET CatID=1 WHERE ID=3;

INSERT INTO Cat VALUES (4,"Shirt",NULL);

INSERT INTO Cat VALUES (5,"Bag",NULL);
UPDATE Cat SET CatID=4 WHERE ID=5;

INSERT INTO Cat VALUES (50,"DBag",NULL);
UPDATE Cat SET CatID=5 WHERE ID=50;

INSERT INTO Cat VALUES (6,"Crop",NULL);
UPDATE Cat SET CatID=4 WHERE ID=6;


SELECT * FROM Cat;
SELECT * FROM Cat WHERE CatID = 4 OR ID = 4;

-- DELETE FROM Cat WHERE ID = 4;
-- SELECT * FROM Cat;


-- --------------------------------------------------------------------------
-- Helper Link
-- Below code is based of these links
-- https://stackoverflow.com/questions/20215744/how-to-create-a-mysql-hierarchical-recursive-query
-- https://stackoverflow.com/a/33737203/2227070
WITH recursive cte (ID, Val, CatID) AS (
  select     ID,
             Val,
             CatID
  from       Cat
  where      CatID = 4
  union all
  select     p.ID,
             p.Val,
             p.CatID
  from       Cat p
  inner join cte
          on p.CatID = cte.ID
)
select * from cte;