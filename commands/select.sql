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