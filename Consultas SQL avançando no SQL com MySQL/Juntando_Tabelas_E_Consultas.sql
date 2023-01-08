USE sucos;

SELECT * FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA=B.MATRICULA;

SELECT A.MATRICULA, A.NOME, COUNT(*) FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA=B.MATRICULA
GROUP BY A.MATRICULA;

SELECT A.MATRICULA, A.NOME, COUNT(*) 
FROM tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA=B.MATRICULA
GROUP BY A.MATRICULA;

SELECT YEAR(A.DATA_VENDA),(SUM(B.QUANTIDADE*B.PRECO)) FROM notas_fiscais A
INNER JOIN itens_notas_fiscais B
ON A.NUMERO=B.NUMERO
GROUP BY YEAR(A.DATA_VENDA);

SELECT COUNT(*) FROM tabela_de_clientes;#15

SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;#14

SELECT distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
INNER JOIN notas_fiscais B ON A.CPF = B.CPF;#14

SELECT distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL;#ACHAMOS, CPF="95939180787"

SELECT distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA)=2015;

SELECT distinct A.CPF, A.NOME, B.CPF FROM  notas_fiscais B
RIGHT JOIN tabela_de_clientes A ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA)=2015;

SELECT * FROM tabela_de_vendedores
INNER JOIN tabela_de_clientes
ON tabela_de_clientes.BAIRRO=tabela_de_vendedores.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME 
FROM tabela_de_vendedores
INNER JOIN tabela_de_clientes
ON tabela_de_clientes.BAIRRO=tabela_de_vendedores.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME 
FROM tabela_de_vendedores
LEFT JOIN tabela_de_clientes
ON tabela_de_clientes.BAIRRO=tabela_de_vendedores.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME 
FROM tabela_de_vendedores
RIGHT JOIN tabela_de_clientes
ON tabela_de_clientes.BAIRRO=tabela_de_vendedores.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME 
FROM tabela_de_vendedores,  tabela_de_clientes;

SELECT DISTINCT BAIRRO FROM tabela_de_clientes;
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO,NOME, 'Cliente' AS TIPO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO,NOME, 'Vendedor' AS TIPO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO,NOME, 'Cliente' AS TIPO_CLIENTE FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO,NOME, 'Vendedor' AS TIPO_VENDEDOR FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO,NOME, 'Cliente' AS TIPO_CLIENTE, CPF FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO,NOME, 'Vendedor' AS TIPO_VENDEDOR, MATRICULA FROM tabela_de_vendedores;

#FULL JOIN
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME 
FROM tabela_de_vendedores
LEFT JOIN tabela_de_clientes
ON tabela_de_clientes.BAIRRO=tabela_de_vendedores.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME 
FROM tabela_de_vendedores
RIGHT JOIN tabela_de_clientes
ON tabela_de_clientes.BAIRRO=tabela_de_vendedores.BAIRRO;

SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes WHERE BAIRRO IN ("Tijuca","Jardins","Copacabana","Santo Amaro");

SELECT * FROM tabela_de_clientes WHERE BAIRRO 
IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >=10;

SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000;
  
  SELECT X.CPF, X.QUANTIDADE FROM (SELECT CPF, COUNT(*) AS QUANTIDADE FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF) AS X
  WHERE X.QUANTIDADE > 2000;
  
CREATE VIEW `VW_MAIORES_EMBALAGENS` AS SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
vw_maiores_embalagens X WHERE X.PRECO_MAXIMO >=10;

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.PRECO_MAXIMO, 
((A.PRECO_DE_LISTA/X.PRECO_MAXIMO)-1)*100 FROM tabela_de_produtos A 
INNER JOIN vw_maiores_embalagens X ON X.EMBALAGEM=A.EMBALAGEM 