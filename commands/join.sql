-- some examples on how to use JOIN

-- ! INNER JOIN 

-- * two tables joins
SELECT b.book_id, a.name, a.nationality, b.title
    FROM books as b
    JOIN authors as a
        on a.author_id = b.author_id
        WHERE a.author_id BETWEEN 1 AND 5;

-- +---------+--------------------+-------------+---------------------------------------+
-- | book_id | name               | nationality | title                                 |
-- +---------+--------------------+-------------+---------------------------------------+
-- |       1 | Sam Altman         | USA         | The Startup Playbook                  |
-- |       2 | Sam Altman         | USA         | The Startup Playbook                  |
-- |       3 | Arthur Conan Doyle | GBR         | Estudio en escarlata                  |
-- |      12 | Juan Rulfo         | MEX         | El llano en llamas                    |
-- |      41 | Arthur Conan Doyle | GBR         | The - Vol I Complete Sherlock Holmes  |
-- |      42 | Arthur Conan Doyle | GBR         | The - Vol II Complete Sherlock Holmes |
-- +---------+--------------------+-------------+---------------------------------------+

-- * three table JOIN
SELECT c.name, b.title, t.type 
    FROM transactions AS t
    JOIN books AS b
        ON t.book_id = b.book_id
    JOIN clients AS c
        ON t.client_id = c.client_id;
-- +---------------------+--------------------------------------+------+
-- | name                | title                                | type |
-- +---------------------+--------------------------------------+------+
-- | Pedro Sanchez       | The - Vol I Complete Sherlock Holmes | lend |
-- | Pedro Sanchez       | The Tao of Physics                   | lend |
-- | Adrian Fernandez    | The Tao of Physics                   | lend |
-- | Maria Dolores Gomez | Estudio en escarlata                 | lend |
-- | Maria Luisa Marin   | Fundamentals of Wavelets             | lend |
-- +---------------------+--------------------------------------+------+

-- * four table JOIN
SELECT c.name AS client, b.title, a.name AS author, t.type 
    FROM transactions AS t
    JOIN books AS b
        ON t.book_id = b.book_id
    JOIN clients AS c
        ON t.client_id = c.client_id
    JOIN authors as a
        ON a.author_id = b.author_id;

-- +---------------------+--------------------------------------+--------------------+------+
-- | client              | title                                | author             | type |
-- +---------------------+--------------------------------------+--------------------+------+
-- | Pedro Sanchez       | The - Vol I Complete Sherlock Holmes | Arthur Conan Doyle | lend |
-- | Pedro Sanchez       | The Tao of Physics                   | Fritjof Capra      | lend |
-- | Adrian Fernandez    | The Tao of Physics                   | Fritjof Capra      | lend |
-- | Maria Dolores Gomez | Estudio en escarlata                 | Arthur Conan Doyle | lend |
-- | Maria Luisa Marin   | Fundamentals of Wavelets             | Jaideva Goswami    | lend |
-- +---------------------+--------------------------------------+--------------------+------+

-- ! LEFT JOIN
-- * Basic left join
SELECT a.author_id, a.name, a.nationality, b.title
FROM authors as a
LEFT JOIN books as b
    ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5;

-- +-----------+--------------------+-------------+---------------------------------------+
-- | author_id | name               | nationality | title                                 |
-- +-----------+--------------------+-------------+---------------------------------------+
-- |         1 | Sam Altman         | USA         | The Startup Playbook                  |
-- |         1 | Sam Altman         | USA         | The Startup Playbook                  |
-- |         3 | Arthur Conan Doyle | GBR         | Estudio en escarlata                  |
-- |         5 | Juan Rulfo         | MEX         | El llano en llamas                    |
-- |         3 | Arthur Conan Doyle | GBR         | The - Vol I Complete Sherlock Holmes  |
-- |         3 | Arthur Conan Doyle | GBR         | The - Vol II Complete Sherlock Holmes |
-- |         2 | Freddy Vega        | COL         | NULL                                  |
-- |         4 | Chuck Palahniuk    | USA         | NULL                                  |
-- +-----------+--------------------+-------------+---------------------------------------+

-- * LEFT JOIN with GROUP BY and ORDER BY
SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id) AS number_of_books
FROM authors as a
LEFT JOIN books as b
    ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id ASC;

-- -- +-----------+--------------------+-------------+-----------------+
-- | author_id | name               | nationality | number_of_books |
-- +-----------+--------------------+-------------+-----------------+
-- |         1 | Sam Altman         | USA         |               2 |
-- |         2 | Freddy Vega        | COL         |               0 |
-- |         3 | Arthur Conan Doyle | GBR         |               3 |
-- |         4 | Chuck Palahniuk    | USA         |               0 |
-- |         5 | Juan Rulfo         | MEX         |               1 |
-- +-----------+--------------------+-------------+-----------------+

SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id) AS number_of_books
FROM authors as a
RIGHT JOIN books as b
    ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id ASC;