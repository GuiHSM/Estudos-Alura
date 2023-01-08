SELECT JSON_PRETTY(JSON) FROM tb_object_funcionario;

SELECT 
REPLACE(JSON_EXTRACT(JSON,"$.Primeiro_Nome"),'"',""),
JSON_EXTRACT(JSON,"$.Data_Nascimento"),
JSON_EXTRACT(JSON,"$.Salario")
FROM tb_object_funcionario;
SELECT 
JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Primeiro_Nome")),
JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Data_Nascimento")),
JSON_EXTRACT(JSON,"$.Salario")
FROM tb_object_funcionario;

SELECT 
JSON_TYPE(JSON_EXTRACT(JSON,"$.Primeiro_Nome")),
JSON_TYPE(JSON_EXTRACT(JSON,"$.Data_Nascimento")),
JSON_TYPE(JSON_EXTRACT(JSON,"$.Salario"))
FROM tb_object_funcionario;##Data de nascimento não é Datetime

SELECT 
JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Primeiro_Nome")),
JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Data_Nascimento")),
JSON_EXTRACT(JSON,"$.Salario")
FROM tb_object_funcionario
WHERE YEAR(JSON_EXTRACT(JSON,"$.Data_Nascimento"))>1980;##Porém funciona como um


SELECT '["PRAIA","FUTEBOL","CINEMA"]';
SELECT JSON_EXTRACT('["PRAIA","FUTEBOL","CINEMA"]',"$[1]");
SELECT '{"HOBBY":["PRAIA","FUTEBOL","CINEMA"]}';
SELECT JSON_EXTRACT('{"HOBBY":["PRAIA","FUTEBOL","CINEMA"]}',"$.HOBBY[1]");
SELECT '{"HOBBY":[{"nome":"PRAIA","local":"Ar Livre"},{"nome":"FUTEBOL","local":"Ar Livre"},{"nome":"CINEMA","local":"Fechado"}]}';
SELECT JSON_EXTRACT('{"HOBBY":[{"nome":"PRAIA","local":"Ar Livre"},{"nome":"FUTEBOL","local":"Ar Livre"},{"nome":"CINEMA","local":"Fechado"}]}','$.HOBBY[1].nome');

SELECT JSON_EXTRACT('{"HOBBY":[{"nome":"PRAIA","local":"Ar Livre"},{"nome":"FUTEBOL","local":"Ar Livre"},{"nome":"CINEMA","local":"Fechado"}]}','$.HOBBY[0].nome')
UNION
SELECT JSON_EXTRACT('{"HOBBY":[{"nome":"PRAIA","local":"Ar Livre"},{"nome":"FUTEBOL","local":"Ar Livre"},{"nome":"CINEMA","local":"Fechado"}]}','$.HOBBY[1].nome')
UNION
SELECT JSON_EXTRACT('{"HOBBY":[{"nome":"PRAIA","local":"Ar Livre"},{"nome":"FUTEBOL","local":"Ar Livre"},{"nome":"CINEMA","local":"Fechado"}]}','$.HOBBY[2].nome');

CREATE TABLE X (Y JSON);
INSERT INTO X VALUES ('{"HOBBY":[{"nome":"PRAIA","local":"Ar Livre"},{"nome":"FUTEBOL","local":"Ar Livre"},{"nome":"CINEMA","local":"Fechado"}]}');
SELECT Y FROM X;

SELECT JSON_EXTRACT(Y,'$.HOBBY[0].nome') AS NOME, JSON_EXTRACT(Y,"$.HOBBY[0].local") AS LOCAL FROM X
UNION
SELECT JSON_EXTRACT(Y,'$.HOBBY[1].nome') AS NOME, JSON_EXTRACT(Y,"$.HOBBY[1].local") AS LOCAL  FROM X
UNION
SELECT JSON_EXTRACT(Y,'$.HOBBY[2].nome') AS NOME, JSON_EXTRACT(Y,"$.HOBBY[2].local") AS LOCAL  FROM X;

UPDATE X SET Y = '{"HOBBY":[{"nome":"PRAIA","local":"Ar Livre"},{"nome":"FUTEBOL","local":"Ar Livre"},{"nome":"CINEMA","local":"Fechado"},{"nome":"PISCINA","local":"Ar Livre"}]}';

SELECT JSON_EXTRACT(Y,'$.HOBBY[0].nome') AS NOME, JSON_EXTRACT(Y,"$.HOBBY[0].local") AS LOCAL FROM X
UNION
SELECT JSON_EXTRACT(Y,'$.HOBBY[1].nome') AS NOME, JSON_EXTRACT(Y,"$.HOBBY[1].local") AS LOCAL  FROM X
UNION
SELECT JSON_EXTRACT(Y,'$.HOBBY[2].nome') AS NOME, JSON_EXTRACT(Y,"$.HOBBY[2].local") AS LOCAL  FROM X
UNION
SELECT JSON_EXTRACT(Y,'$.HOBBY[3].nome') AS NOME, JSON_EXTRACT(Y,"$.HOBBY[3].local") AS LOCAL  FROM X;

SELECT T2.NOME,T2.LOCAL FROM X
CROSS JOIN
JSON_TABLE (JSON_EXTRACT (Y,"$.HOBBY"), "$[*]"
COLUMNS (NOME VARCHAR(10) PATH "$.nome", LOCAL VARCHAR(10) PATH "$.local")) T2;

SELECT
JSON_UNQUOTE(JSON_EXTRACT(JSON, "$.Cpf"))AS CPF,
JSON_UNQUOTE(JSON_EXTRACT(JSON, "$.Primeiro_Nome")) AS PRIMEIRO_NOME,
JSON_UNQUOTE(JSON_EXTRACT(JSON, "$.Nome_Meio")) AS NOME_MEIO,
JSON_UNQUOTE(JSON_EXTRACT(JSON, "$.Ultimo_Nome")) AS ULTIMO_NOME, 
TD.NOME_DEPARTAMENTO AS NOME_DEPARTAMENTO,
T1.NOME_DEPENDENTE,T1.SEXO,T1.PARENTESCO,T1.DATA_NASCIMENTO FROM tb_object_funcionario
CROSS JOIN
JSON_TABLE (JSON_EXTRACT (JSON,"$.Dependentes"), "$[*]"
COLUMNS (SEXO CHAR PATH "$.Sexo", PARENTESCO VARCHAR(10) PATH "$.Parentesco",
DATA_NASCIMENTO DATETIME PATH "$.Data_Nascimento",
NOME_DEPENDENTE VARCHAR(10) PATH "$.Nome_Dependente")) T1
INNER JOIN tb_departamento TD ON
TD.NUMERO_DEPARTAMENTO=JSON_EXTRACT(JSON,"$.Numero_Departamento");