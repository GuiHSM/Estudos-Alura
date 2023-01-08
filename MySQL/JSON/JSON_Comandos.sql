SELECT * FROM countryinfo;
select JSON_PRETTY(doc) FROM countryinfo WHERE _ID="USA";

select JSON_KEYS(doc) FROM countryinfo WHERE _ID="USA";
select JSON_KEYS(doc, "$.geography") FROM countryinfo WHERE _ID="USA";

SELECT JSON_EXTRACT(DOC,"$.government") FROM countryinfo WHERE _ID="USA";
SELECT JSON_EXTRACT(DOC,"$.IndepYear") FROM countryinfo WHERE _ID="USA";

SELECT JSON_EXTRACT(DOC,"$.government.HeadOfState") FROM countryinfo WHERE _ID="USA";
SELECT JSON_EXTRACT(DOC,"$.government.HeadOfState") AS HeadOfState FROM countryinfo;
SELECT JSON_EXTRACT(DOC,"$.government.HeadOfState")  AS HeadOfState,
JSON_EXTRACT(DOC,"$.IndepYear") Ano_Independencia FROM countryinfo;

SELECT JSON_EXTRACT(doc, "$.GNP") AS GNP,
JSON_EXTRACT(doc, "$.Code") AS Code,
JSON_EXTRACT(doc, "$.Name") AS Name,
JSON_EXTRACT(doc, "$.IndepYear") AS IndepYear,
JSON_EXTRACT(doc, "$.geography.Region") AS Region,
JSON_EXTRACT(doc, "$.geography.Continent") AS Continent,
JSON_EXTRACT(doc, "$.geography.SurfaceArea") AS SurfaceArea,
JSON_EXTRACT(doc, "$.government.HeadOfState") AS HeadOfState,
JSON_EXTRACT(doc, "$.government.GovernmentForm") AS GovernmentForm,
JSON_EXTRACT(doc, "$.demographics.Population") AS Population,
JSON_EXTRACT(doc, "$.demographics.LifeExpectancy") AS LifeExpectancy
FROM countryinfo;

SELECT JSON_EXTRACT(doc, "$.Code") AS Code, REPLACE(JSON_EXTRACT(doc, "$.Code"),'"','')
AS Code2 FROM countryinfo;

SELECT JSON_EXTRACT(doc, "$.geography.Continent") AS Continent,
SUM(JSON_EXTRACT(doc, "$.demographics.Population")) AS Population,
AVG(JSON_EXTRACT(doc,"$.demographics.LifeExpectancy"))  FROM countryinfo
WHERE JSON_EXTRACT(doc, "$.government.GovernmentForm") like "%Monarchy%"
AND JSON_EXTRACT(doc, "$.demographics.Population")>10000000
GROUP BY JSON_EXTRACT(doc, "$.geography.Continent")
ORDER BY 2;

CREATE TABLE X (Y JSON);
INSERT INTO X VALUES ('{"nome":"Joao","telefone":"2292-3343"}');
INSERT INTO X VALUES ('{"nome":"Jonas"}');

SELECT JSON_CONTAINS_PATH(Y, "ONE", "$.telefone") FROM X; 
INSERT INTO X VALUES ('{"nome":"Joao","endereco":"Rua X numero Y"}');
SELECT JSON_CONTAINS_PATH(Y, "ONE", "$.telefone") FROM X; 

SELECT JSON_CONTAINS_PATH(Y, "ONE", "$.telefone","$.endereco") FROM X; 
INSERT INTO X VALUES ('{"nome":"Joao","endereco":"Rua X numero Y","telefone":"2292-3343"}');
SELECT JSON_CONTAINS_PATH(Y, "ONE", "$.telefone","$.endereco") FROM X; 
SELECT JSON_CONTAINS_PATH(Y, "ALL", "$.telefone","$.endereco") FROM X; 

SELECT JSON_EXTRACT(Y, "$.telefone") FROM X;
SELECT JSON_CONTAINS(Y,'"2293-3343"', "$.telefone") FROM X;
SELECT * FROM X WHERE JSON_CONTAINS(Y,'\"2292-3343\"', "$.telefone") = 1;
SELECT * FROM X WHERE JSON_EXTRACT(Y, "$.telefone") = "2292-3343";
SELECT JSON_SEARCH(Y,"ONE", "2292-3343"), Y FROM X;
INSERT INTO X VALUES ('{"nome":"Joao","endereco":"Rua X numero Y","telefone":"2292-3343","telefone2":"2292-3343"}');
SELECT JSON_SEARCH(Y,"ONE", "2292-3343"), Y FROM X;
SELECT JSON_SEARCH(Y,"ALL", "2292-3343"), Y FROM X;

