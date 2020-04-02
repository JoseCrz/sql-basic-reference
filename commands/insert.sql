-- Examples on how to use INSERT
INSERT INTO table_name(column1, column2, column3) VALUES(value1, value2, value3);

-- Examples
-- 1 by 1
INSERT INTO authors(name, nationality) VALUES('Juan Rulfo', 'MEX');

-- Multiple
INSERT INTO authors(name, nationality) VALUES('Octavio Paz', "MEX"), ('Julio Cortázar', 'ARG');