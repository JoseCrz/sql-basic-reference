-- * Select a database to work with:
USE name_of_database;

-- * See all databases in the server:
SHOW DATABASES;

-- * See database currently working with:
SELECT DATABASE();

-- * See tables  in the current database:
SHOW TABLES;

-- * See table structure:
DESCRIBE table_name;
DESC table_name;

-- ? Example ~ DESC books;
-- +-------------+--------------+------+-----+---------+----------------+
-- | Field       | Type         | Null | Key | Default | Extra          |
-- +-------------+--------------+------+-----+---------+----------------+
-- | book_id     | int unsigned | NO   | PRI | NULL    | auto_increment |
-- | author_id   | int unsigned | YES  |     | NULL    |                |
-- | title       | varchar(100) | NO   |     | NULL    |                |
-- | year        | int unsigned | NO   |     | 1900    |                |
-- | language    | varchar(2)   | NO   |     | es      |                |
-- | cover_url   | varchar(500) | YES  |     | NULL    |                |
-- | price       | double(6,2)  | NO   |     | 10.00   |                |
-- | sellable    | tinyint(1)   | YES  |     | 1       |                |
-- | copies      | int          | NO   |     | 1       |                |
-- | description | text         | YES  |     | NULL    |                |
-- +-------------+--------------+------+-----+---------+----------------+

-- * See more detailed structure of a table (comments included)
SHOW FULL COLUMNS FROM table_name;

-- ? Example ~ SHOW FULL COLUMNS FROM books;
-- +-------------+--------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
-- | Field       | Type         | Collation          | Null | Key | Default | Extra          | Privileges                      | Comment            |
-- +-------------+--------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+
-- | book_id     | int unsigned | NULL               | NO   | PRI | NULL    | auto_increment | select,insert,update,references |                    |
-- | author_id   | int unsigned | NULL               | YES  |     | NULL    |                | select,insert,update,references |                    |
-- | title       | varchar(100) | utf8mb4_0900_ai_ci | NO   |     | NULL    |                | select,insert,update,references |                    |
-- | year        | int unsigned | NULL               | NO   |     | 1900    |                | select,insert,update,references |                    |
-- | language    | varchar(2)   | utf8mb4_0900_ai_ci | NO   |     | es      |                | select,insert,update,references | ISO 639-1 Language |
-- | cover_url   | varchar(500) | utf8mb4_0900_ai_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
-- | price       | double(6,2)  | NULL               | NO   |     | 10.00   |                | select,insert,update,references |                    |
-- | sellable    | tinyint(1)   | NULL               | YES  |     | 1       |                | select,insert,update,references |                    |
-- | copies      | int          | NULL               | NO   |     | 1       |                | select,insert,update,references |                    |
-- | description | text         | utf8mb4_0900_ai_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
-- +-------------+--------------+--------------------+------+-----+---------+----------------+---------------------------------+--------------------+