SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos WHERE SABOR = 'Laranja';
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos;

SELECT DISTINCT CIDADE FROM tabela_de_clientes;

SELECT * FROM tabela_de_produtos LIMIT 5;
SELECT * FROM tabela_de_produtos LIMIT 3,4;

SELECT * FROM notas_fiscais WHERE DATA_VENDA="2017-01-01" LIMIT 10;

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC;
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM, NOME_DO_PRODUTO;
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

SELECT * FROM itens_notas_fiscais 
WHERE CODIGO_DO_PRODUTO=(
SELECT CODIGO_DO_PRODUTO FROM tabela_de_produtos 
WHERE NOME_DO_PRODUTO="Linha Refrescante - 1 Litro - Morango/Limão") 
AND QUANTIDADE=(
SELECT QUANTIDADE FROM itens_notas_fiscais 
WHERE CODIGO_DO_PRODUTO=(
SELECT CODIGO_DO_PRODUTO FROM tabela_de_produtos 
WHERE NOME_DO_PRODUTO="Linha Refrescante - 1 Litro - Morango/Limão") 
ORDER BY QUANTIDADE DESC LIMIT 1);

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM tabela_de_clientes 
GROUP BY ESTADO;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos 
GROUP BY EMBALAGEM;

SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos 
GROUP BY EMBALAGEM;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE="Rio De Janeiro" 
GROUP BY BAIRRO;
SELECT ESTADO,BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
GROUP BY ESTADO,BAIRRO;
SELECT ESTADO,BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE="Rio De Janeiro" 
GROUP BY ESTADO,BAIRRO;
SELECT ESTADO,BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE="Rio De Janeiro" 
GROUP BY ESTADO,BAIRRO ORDER BY BAIRRO;

SELECT QUANTIDADE, COUNT(*) FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO="1101035" 
GROUP BY QUANTIDADE ORDER BY QUANTIDADE DESC LIMIT 1;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes 
GROUP BY ESTADO HAVING SOMA_LIMITE>900000;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos 
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA)<= 80 AND MAIOR_PRECO>=5;

SELECT CPF FROM notas_fiscais 
WHERE YEAR(DATA_VENDA)=2016
GROUP BY CPF HAVING COUNT(*)>2000;

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE WHEN PRECO_DE_LISTA>= 12 THEN 'CARO'
	WHEN PRECO_DE_LISTA>= 7 AND PRECO_DE_LISTA<12 THEN 'EM CONTA'
	ELSE 'BARATO' 
END AS STATUS_PRECO
FROM tabela_de_produtos ORDER BY STATUS_PRECO; 

SELECT EMBALAGEM,
CASE WHEN PRECO_DE_LISTA>= 12 THEN 'CARO'
	WHEN PRECO_DE_LISTA>= 7 AND PRECO_DE_LISTA<12 THEN 'EM CONTA'
	ELSE 'BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos 
GROUP BY EMBALAGEM, STATUS_PRECO ORDER BY EMBALAGEM; 
SELECT EMBALAGEM,
CASE WHEN PRECO_DE_LISTA>= 12 THEN 'CARO'
	WHEN PRECO_DE_LISTA>= 7 AND PRECO_DE_LISTA<12 THEN 'EM CONTA'
	ELSE 'BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos WHERE SABOR="Manga"
GROUP BY EMBALAGEM, STATUS_PRECO ORDER BY EMBALAGEM; 

SELECT NOME,
CASE WHEN YEAR(DATA_DE_NASCIMENTO)<1990 THEN "Velhos"
	WHEN YEAR(DATA_DE_NASCIMENTO) BETWEEN 1990 AND 1995 THEN "Jovens"
    ELSE "Criança"
END AS STATUS_IDADE 
FROM tabela_de_clientes