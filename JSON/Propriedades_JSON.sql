
SELECT JSON_DEPTH('{}');##Nível 1
SELECT JSON_DEPTH('{"nome":"Joao"}'); ##Nível 2
SELECT JSON_DEPTH('{"nome":"Joao","filho":{}}'); ##Nível 2, {} não adiciona um novo nível;
SELECT JSON_DEPTH('{"nome":"Joao","filho":{"nome":"Pedro"}}'); ##Nível 3, agora vai para 3;
SELECT JSON_DEPTH('{"nome":"Joao","filho":{"nome":"Pedro","neto":{"nome":"Julio"}}}'); ##Nível 4;
USE world_x;
SELECT doc from countryinfo;
SELECT JSON_DEPTH(doc) FROM countryinfo;
SELECT doc FROM countryinfo WHERE JSON_DEPTH(doc)<>3;#Todos os campos tem a mesma profundidade

SELECT JSON_LENGTH('{}');

SELECT JSON_LENGTH('{"nome":"Joao"}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado"}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado","hobby":["praia"]}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado","hobby":["praia","volei"]}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado","hobby":["praia","volei"],"filho":{"nome":"carlos"}}');
SELECT JSON_LENGTH('["Praia","Volei","Futebol"]');
SELECT JSON_LENGTH('{"hobby":["Praia","Volei","Futebol"]}');
SELECT JSON_LENGTH(doc) FROM countryinfo;
SELECT doc FROM countryinfo WHERE JSON_LENGTH(doc)<>8;

SELECT JSON_TYPE('{"a":[10,true]}');
SELECT JSON_EXTRACT('{"a":[10,true]}',"$.a");
SELECT JSON_TYPE(JSON_EXTRACT('{"a":[10,true]}',"$.a"));
SELECT JSON_TYPE(JSON_EXTRACT('{"a":[10,true]}',"$.a[0]"));

SELECT JSON_VALID('{"a":[10,true]}');
SELECT JSON_VALID('{"a":[10,tru]}');