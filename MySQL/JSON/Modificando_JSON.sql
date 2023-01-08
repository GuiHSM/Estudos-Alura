CREATE DATABASE testejson;
USE testejson;

-- ["A","B","C"]
-- $[0] = "A", $[1] = "B", $[2] = "C"

CREATE TABLE X (Y JSON);
INSERT INTO X VALUES('["A","B","C"]');
SELECT * FROM X;
DELETE FROM X;
INSERT X VALUE(JSON_ARRAY("A","B","C"));
SELECT * FROM X;

UPDATE X SET Y = JSON_ARRAY_APPEND(Y,"$[0]","A1");
SELECT * FROM X;
UPDATE X SET Y = JSON_ARRAY_APPEND(Y,"$[1]","B1","$[2]","C1");
SELECT * FROM X;
UPDATE X SET Y = JSON_ARRAY_APPEND(Y,"$","D");
SELECT * FROM X;

UPDATE X SET Y = JSON_ARRAY_INSERT(Y,"$[3]","E");
SELECT * FROM X;
UPDATE X SET Y = JSON_ARRAY_INSERT(Y,"$[0]","AX");
SELECT * FROM X;
UPDATE X SET Y = JSON_ARRAY_INSERT(Y,"$[1][1]","K");
SELECT * FROM X;

TRUNCATE X;
INSERT INTO X VALUES('{"key1":"value1"}');
SELECT Y FROM X;

UPDATE X SET Y = JSON_INSERT (Y,"$.key2","value2");
SELECT Y FROM X;
UPDATE X SET Y = JSON_INSERT (Y,"$.key3","value3","$.key4","value4");
SELECT Y FROM X;
UPDATE X SET Y = JSON_INSERT (Y,"$.key1","value1x","$.key5","value5");
SELECT Y FROM X;
UPDATE X SET Y = JSON_REPLACE (Y,"$.key1","value1x");
SELECT Y FROM X;
UPDATE X SET Y = JSON_REPLACE (Y,"$.key2","value2x","$.key6","value6");
SELECT Y FROM X;
UPDATE X SET Y = JSON_REMOVE(Y,"$.key1");
SELECT Y FROM X;
UPDATE X SET Y = JSON_REMOVE(Y,"$.key7");
SELECT Y FROM X;
UPDATE X SET Y = JSON_REMOVE(Y,"$.key2","$.key3");
SELECT Y FROM X;
UPDATE X SET Y = JSON_INSERT (Y,"$.key1","value1");
UPDATE X SET Y = JSON_SET(Y,"$.key1","$.key1y","$.key3","$.key3");
SELECT Y FROM X;

USE world_x;

SELECT JSON_MERGE_PRESERVE('[1,2]','[true,false]');
SELECT JSON_MERGE_PRESERVE('[1,2]','[2,3]');
SELECT JSON_MERGE_PRESERVE('{"nome":"James","sobrenome":"Bond"}','{"nome":"Maxell","sobrenome":"Smart"}');
SELECT JSON_MERGE_PRESERVE('{"nome":"James","sobrenome":"Bond","id":"007"}'
,'{"nome":"Maxell","sobrenome":"Smart","salario":10000}'
,'{"nome":"Maxell","cidade":"Rio de Janeiro"}');

-- JSON_MERGE_PATCH --
-- A propriedade que existir no primeiro e não existir no segundo
-- A propriedade que existir no segundo e não existir no primeiro
-- Propriedades em comem = propriedade do segundo
SELECT JSON_MERGE_PATCH('{"nome":"James","sobrenome":"Bond"}','{"salario":10000,"cidade":"Rio de Janeiro"}');
SELECT JSON_MERGE_PATCH('{"nome":"James","sobrenome":"Bond"}','{"nome":"Maxwell","cidade":"Rio de Janeiro"}');

SELECT JSON_MERGE_PATCH('{"nome":"James","sobrenome":"Bond"}','{"salario":10000,"cidade":"Rio de Janeiro"}'),
JSON_MERGE_PRESERVE('{"nome":"James","sobrenome":"Bond"}','{"salario":10000,"cidade":"Rio de Janeiro"}');
SELECT JSON_MERGE_PATCH('{"nome":"James","sobrenome":"Bond"}','{"nome":"Maxwell","cidade":"Rio de Janeiro"}'),
JSON_MERGE_PRESERVE('{"nome":"James","sobrenome":"Bond"}','{"nome":"Maxwell","cidade":"Rio de Janeiro"}');

SELECT JSON_MERGE_PATCH('[1,2]','[true, false]');
SELECT JSON_MERGE_PATCH('{"array1":[1,2]}','{"array2":[true, false]}');
SELECT JSON_MERGE_PATCH('{"array2":[1,2]}','{"array2":[true, false]}');