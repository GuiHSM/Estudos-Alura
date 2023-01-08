/*
JSON_PRETTY(X)
JSON_KEYS(doc)
JSON_KEYS(doc, "$.geography")
JSON_EXTRACT(DOC,"$.government.HeadOfState")
JSON_CONTAINS_PATH(Y, "ONE", "$.telefone")
JSON_CONTAINS_PATH(Y, "ALL", "$.telefone","$.endereco")
JSON_SEARCH(Y,"ONE, "2292-3343")
JSON_SEARCH(Y,"ALL", "2292-3343")
JSON_ARRAY("A","B","C")
JSON_ARRAY_APPEND(Y,"$[0]","A1");
JSON_ARRAY_INSERT(Y,"$[3]","E");
JSON_REPLACE (Y,"$.key1","value1x")
JSON_SET(Y,"$.key1","$.key1y","$.key3","$.key3")
JSON_MERGE_PRESERVE('[1,2]','[true,false]');
JSON_MERGE_PATCH()
JSON_DEPTH(doc)
JSON_LENGTH(doc)
JSON_TYPE(JSON_EXTRACT('{"a":[10,true]}',"$.a[0]"))
JSON_VALID('{"a":[10,tru]}')
JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Primeiro_Nome")),
JSON_TABLE (JSON_EXTRACT (Y,"$.HOBBY"), "$[*]" COLUMNS (NOME VARCHAR(10) PATH "$.nome", LOCAL VARCHAR(10) PATH "$.local")) T2





*/