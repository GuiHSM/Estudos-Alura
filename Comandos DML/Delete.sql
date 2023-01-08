USE vendas_sucos;

SELECT * FROM PRODUTOS WHERE SUBSTRING(DESCRITOR,1,15)='Sabor dos Alpes';

DELETE FROM PRODUTOS WHERE CODIGO = '1001000';

DELETE FROM PRODUTOS WHERE TAMANHO = "1 Litro" AND SUBSTRING(DESCRITOR,1,15)='Sabor dos Alpes';

SELECT CODIGO_DO_PRODUTO FROM SUCOS.TABELA_DE_PRODUTOS;

SELECT CODIGO FROM PRODUTOS WHERE
CODIGO NOT IN (
SELECT CODIGO_DO_PRODUTO FROM SUCOS.TABELA_DE_PRODUTOS);

DELETE FROM PRODUTOS WHERE CODIGO NOT IN (
SELECT CODIGO_DO_PRODUTO FROM SUCOS.TABELA_DE_PRODUTOS);

SELECT A.NUMERO FROM NOTAS A
INNER JOIN CLIENTES B ON A.CPF = B.CPF
WHERE B.IDADE <= 18;

DELETE FROM NOTAS WHERE CPF IN (SELECT CPF FROM CLIENTES 
WHERE IDADE <= 18);