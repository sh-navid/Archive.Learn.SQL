# Sql Instructor
- RDBMS <sub>Relational Database Management System</sub>
## Headings
- SQL <sub>Structured Query Language</sub> Command Categories
  - DQL <sub>Data Query Language</sub>
      - `SELECT`
        - `*`, `COLUMN`
  - DML <sub>Data Manipulation Language</sub>
    - `INSERT`
    - `UPDATE`
    - `DELETE`
    - `LOCK`
    - `CALL`
  - DDL <sub>Data Definition Language</sub>
    - `CREATE`
      - `TABLE`
      - `DATABASE`
    - `DROP`
      - `TABLE`
      - `DATABASE`
    - `ALTER`
      - `TABLE`
        - `ADD`
          - `COLUMN`
          - `CONSTRAINT`
        - `REMOVE`
          - `COLUMN`
          - `CONSTRAINT`
        - `MODIFY`
          - `DATATYPE`
          - `DATATYPE Length`
    - `TRUNCATE`
      - `TABLE`
    - `VIEW`
      - `VIEW`
      - `TABLE`
      - `DATABASE`
    - `COMMENT`
    - `RENAME`
  - DCL <sub>Data Control Language</sub>
    - `GRANT`
    - `REVOKE`
  - TCL <sub>Transaction Control Language</sub>
    - `COMMIT`
    - `ROLLBACK`
    - `SAVEPOINT`
  ---
  - Alias
    - `AS`
  - Group By
    - `COLUMN`
    - `HAVING`
  - Order By
    - `COLUMN`
      - `ASC`
      - `DESC`
  - Join
    - `INNER`
    - `LEFT`
    - `RIGHT`
    - `FULL`
  - Where
    - `>, <, =, <=, >=, <>`
    - `EXISTS`
    - `IN`
    - `ANY`
    - `ALL`
    - `LIKE`
    - `BETWEEN`
    - `AND`
    - `OR`
    - `NOT`
    - `NULL`
  - IF
  - EXISTS
  - DISTINCT
  - LIMIT
  - Functions
    - Math
      - `min`, `avg`, `max`, `count`, `sum`, `mod`, `ceil`, `round`, `abs`, `floor`, `sign`
    - String
      - `concat`, `trim`, `upper`, `lower`, `length`
    - Other
      - `least`, `greatest`
    - Date
      - `date_trunc`, `extract`
    - Window
      - `lag`, `lead`, `ntile`, `rank`, `dense_rank`, `row_number`, `over`
---
- DataTypes
- Keys
    - Primary Key
    - Super Key
    - Candidate Key
    - Alternate Key
    - Foreign Key
    - Composite Key
    - Unique Key
- Constraints
  - `Unique`
  - `Not Null`
  - `Primary Key`
  - `Foreign Key`
  - `Check`
  - `Default`
---
- Normalization
  - NF
  - 2NF
  - 3NF
  - BCNF
