-- Examples on how to use INSERT
-- ? Basic syntaxis:
INSERT INTO table_name(column1, column2, column3) VALUES(value1, value2, value3);


-- * 1 by 1
INSERT INTO authors(name, nationality) VALUES('Juan Rulfo', 'MEX');

-- *  Multiple
INSERT INTO authors(name, nationality) VALUES('Octavio Paz', "MEX"), ('Julio Cortázar', 'ARG');

-- * Insert row when unique value already in table, sets old value to new one
INSERT INTO clients(name, email, birthdate, gender, active) VALUES('Phil Phish', 'phil@fez.com', '1989-09-01','M',0)
ON DUPLICATE KEY UPDATE active = VALUES(active);