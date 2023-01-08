CREATE DATABASE IF NOT EXISTS json_cursos;
USE json_cursos;

CREATE TABLE bar (
our_data JSON);

INSERT INTO bar VALUES('{"first":"James","name":"Bond","ID":"007"}');

SELECT * FROM bar;

#INSERT INTO bar VALUES('{"first":"Maxwell","name":"Smart","ID":"086"'); #esta verificando

INSERT INTO bar VALUES('{"first":"Maxwell","name":"Smart","ID":"086"}');

SELECT JSON_PRETTY(our_data) FROM bar;