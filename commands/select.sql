-- Examples on how to use inserts

-- * Select all rows from a table
SELECT * FROM table_name;

-- * Select a row meeting certain criteria:
SELECT * FROM table_name WHERE table_row = desired_value

-- ? Regular
SELECT * FROM client WHERE client_id = 1;
-- +-----------+------------+--------------+---------------------+--------+--------+---------------------+---------------------+
-- | client_id | name       | email        | birthdate           | gender | active | created_at          | updated_at          |
-- +-----------+------------+--------------+---------------------+--------+--------+---------------------+---------------------+
-- |         1 | Phil Phish | phil@fez.com | 1989-09-01 00:00:00 | M      |      0 | 2020-04-01 20:03:06 | 2020-04-01 20:04:00 |
-- +-----------+------------+--------------+---------------------+--------+--------+---------------------+---------------------+

-- ? Pretty:
SELECT * FROM clients WHERE client_id = 1\G;
--  1. row 
--  client_id: 1
--       name: Phil Phish
--      email: phil@fez.com
--  birthdate: 1989-09-01 00:00:00
--     gender: M
--     active: 0
-- created_at: 2020-04-01 20:03:06
-- updated_at: 2020-04-01 20:04:00

-- * limit the number of results:
SELECT * FROM table_name LIMIT n;
-- SELECT * FROM clients LIMIT 10;
-- +-----------+---------------------+--------------------------------------+------------+--------+--------+---------------------+
-- | client_id | name                | email                                | birthdate  | gender | active | created_at          |
-- +-----------+---------------------+--------------------------------------+------------+--------+--------+---------------------+
-- |         1 | Maria Dolores Gomez | Maria Dolores.95983222J@random.names | 1971-06-06 | F      |      1 | 2018-04-09 16:51:30 |
-- |         2 | Adrian Fernandez    | Adrian.55818851J@random.names        | 1970-04-09 | M      |      1 | 2018-04-09 16:51:30 |
-- |         3 | Maria Luisa Marin   | Maria Luisa.83726282A@random.names   | 1957-07-30 | F      |      1 | 2018-04-09 16:51:30 |
-- |         4 | Pedro Sanchez       | Pedro.78522059J@random.names         | 1992-01-31 | M      |      1 | 2018-04-09 16:51:30 |
-- |         5 | Pablo Saavedra      | Pablo.93733268B@random.names         | 1960-07-21 | M      |      1 | 2018-04-09 16:51:30 |
-- |         6 | Marta Carrillo      | Marta.55741882W@random.names         | 1981-06-15 | F      |      1 | 2018-04-09 16:51:30 |
-- |         7 | Javier Barrio       | Javier.54966248C@random.names        | 1971-04-24 | M      |      1 | 2018-04-09 16:51:30 |
-- |         8 | Milagros Garcia     | Milagros.90074144A@random.names      | 1964-12-05 | F      |      1 | 2018-04-09 16:51:30 |
-- |         9 | Carlos Quiros       | Carlos.63291957M@random.names        | 1954-08-28 | M      |      1 | 2018-04-09 16:51:30 |
-- |        10 | Carmen De la Torre  | Carmen.57408761W@random.names        | 1966-05-14 | F      |      1 | 2018-04-09 16:51:30 |
-- +-----------+---------------------+--------------------------------------+------------+--------+--------+---------------------+

-- ! Advanced SELECT

-- * Retrieve specific data from a table
SELECT column1, column2, columnN FROM table_name
-- SELECT name, email, gender FROM clients LIMIT 10;
-- +---------------------+--------------------------------------+--------+
-- | name                | email                                | gender |
-- +---------------------+--------------------------------------+--------+
-- | Maria Dolores Gomez | Maria Dolores.95983222J@random.names | F      |
-- | Adrian Fernandez    | Adrian.55818851J@random.names        | M      |
-- | Maria Luisa Marin   | Maria Luisa.83726282A@random.names   | F      |
-- | Pedro Sanchez       | Pedro.78522059J@random.names         | M      |
-- | Pablo Saavedra      | Pablo.93733268B@random.names         | M      |
-- | Marta Carrillo      | Marta.55741882W@random.names         | F      |
-- | Javier Barrio       | Javier.54966248C@random.names        | M      |
-- | Milagros Garcia     | Milagros.90074144A@random.names      | F      |
-- | Carlos Quiros       | Carlos.63291957M@random.names        | M      |
-- | Carmen De la Torre  | Carmen.57408761W@random.names        | F      |
-- +---------------------+--------------------------------------+--------+

-- * Retrieve specific data from a table with condition
-- SELECT column1, column2, columnN FROM table_name where column = value;
SELECT name, email, gender FROM clients where gender = 'M' LIMIT 10;
-- +---------------------+------------------------------------+--------+
-- | name                | email                              | gender |
-- +---------------------+------------------------------------+--------+
-- | Adrian Fernandez    | Adrian.55818851J@random.names      | M      |
-- | Pedro Sanchez       | Pedro.78522059J@random.names       | M      |
-- | Pablo Saavedra      | Pablo.93733268B@random.names       | M      |
-- | Javier Barrio       | Javier.54966248C@random.names      | M      |
-- | Carlos Quiros       | Carlos.63291957M@random.names      | M      |
-- | Jose Maria Bermudez | Jose Maria.24963969E@random.names  | M      |
-- | Carlos Blanco       | Carlos.94783133H@random.names      | M      |
-- | Juan Carlos Jurado  | Juan Carlos.71650477A@random.names | M      |
-- | David Gonzalez      | David.54332034P@random.names       | M      |
-- | David Casals        | David.06746883V@random.names       | M      |
-- +---------------------+------------------------------------+--------+

SELECT * FROM authors WHERE author_id > 0 AND author_id <= 5;
-- +-----------+--------------------+-------------+
-- | author_id | name               | nationality |
-- +-----------+--------------------+-------------+
-- |         1 | Sam Altman         | USA         |
-- |         2 | Freddy Vega        | COL         |
-- |         3 | Arthur Conan Doyle | GBR         |
-- |         4 | Chuck Palahniuk    | USA         |
-- |         5 | Juan Rulfo         | MEX         |
-- +-----------+--------------------+-------------+

SELECT * FROM authors WHERE author_id BETWEEN 1 AND 5;
-- +-----------+--------------------+-------------+
-- | author_id | name               | nationality |
-- +-----------+--------------------+-------------+
-- |         1 | Sam Altman         | USA         |
-- |         2 | Freddy Vega        | COL         |
-- |         3 | Arthur Conan Doyle | GBR         |
-- |         4 | Chuck Palahniuk    | USA         |
-- |         5 | Juan Rulfo         | MEX         |
-- +-----------+--------------------+-------------+

-- * year function
SELECT year(birthdate) FROM clients LIMIT 10;
-- +-----------------+
-- | year(birthdate) |
-- +-----------------+
-- |            1971 |
-- |            1970 |
-- |            1957 |
-- |            1992 |
-- |            1960 |
-- |            1981 |
-- |            1971 |
-- |            1964 |
-- |            1954 |
-- |            1966 |
-- +-----------------+

-- * some operations
SELECT YEAR(NOW()) - YEAR(birthdate) from clients LIMIT 10;
-- +-------------------------------+
-- | YEAR(NOW()) - YEAR(birthdate) |
-- +-------------------------------+
-- |                            49 |
-- |                            50 |
-- |                            63 |
-- |                            28 |
-- |                            60 |
-- |                            39 |
-- |                            49 |
-- |                            56 |
-- |                            66 |
-- |                            54 |
-- +-------------------------------+

SELECT name, YEAR(NOW()) - YEAR(birthdate) from clients LIMIT 10;
-- +---------------------+-------------------------------+
-- | name                | YEAR(NOW()) - YEAR(birthdate) |
-- +---------------------+-------------------------------+
-- | Maria Dolores Gomez |                            49 |
-- | Adrian Fernandez    |                            50 |
-- | Maria Luisa Marin   |                            63 |
-- | Pedro Sanchez       |                            28 |
-- | Pablo Saavedra      |                            60 |
-- | Marta Carrillo      |                            39 |
-- | Javier Barrio       |                            49 |
-- | Milagros Garcia     |                            56 |
-- | Carlos Quiros       |                            66 |
-- | Carmen De la Torre  |                            54 |
-- +---------------------+-------------------------------+

-- * ALIAS
SELECT name, YEAR(NOW()) - YEAR(birthdate) AS age from clients LIMIT 10;
-- +---------------------+------+
-- | name                | age  |
-- +---------------------+------+
-- | Maria Dolores Gomez |   49 |
-- | Adrian Fernandez    |   50 |
-- | Maria Luisa Marin   |   63 |
-- | Pedro Sanchez       |   28 |
-- | Pablo Saavedra      |   60 |
-- | Marta Carrillo      |   39 |
-- | Javier Barrio       |   49 |
-- | Milagros Garcia     |   56 |
-- | Carlos Quiros       |   66 |
-- | Carmen De la Torre  |   54 |
-- +---------------------+------+


-- * LIKE
SELECT name FROM clients WHERE name LIKE '%lope%';
-- +-------------------+
-- | name              |
-- +-------------------+
-- | Juana Maria Lopez |
-- | Carmen Lopez      |
-- +-------------------+

-- *Combination of YEAR, ALIAS, CONDITIONS, LIKE AND LIMIT
SELECT name, YEAR(NOW()) - YEAR(birthdate) AS age FROM clients WHERE gender = 'F' AND name LIKE '%maria%' LIMIT 10;
-- +----------------------+------+
-- | name                 | age  |
-- +----------------------+------+
-- | Maria Dolores Gomez  |   49 |
-- | Maria Luisa Marin    |   63 |
-- | Maria Dolores Larrea |   30 |
-- | Maria Dolores Sanz   |   19 |
-- | Maria Moreno         |   23 |
-- | Maria angeles Alba   |   61 |
-- | Maria Carmen Gomez   |   52 |
-- | Maria Cruz Morillas  |   42 |
-- | Juana Maria Lopez    |   30 |
-- | Maria Carmen Ponce   |   36 |
-- +----------------------+------+

