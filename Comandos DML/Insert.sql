USE vendas_sucos;

INSERT INTO PRODUTOS(CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1040107','Light - 350 ml - Melância','Melância','350 ml','Lata',4.56);

SELECT * FROM PRODUTOS;

INSERT INTO PRODUTOS(CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1040108','Light - 350 ml - Graviola','Graviola','350 ml','Lata',4.00);

INSERT INTO PRODUTOS
VALUES ('1040109','Light - 350 ml - Açai','Açai','350 ml','Lata',5.60);

INSERT INTO PRODUTOS
VALUES ('1040110','Light - 350 ml - Jaca','Jaca','350 ml','Lata',6.00),
('1040111','Light - 350 ml - Manga','Manga','350 ml','Lata',3.50);

INSERT INTO CLIENTES
VALUES
("1471156710","Érica Carvalho","R. Iriquitia","Jardins","São Paulo","SP","80012212","1990-09-01",27,"F",170000,24500,False),
("19290992743","Fernando Cavalcante","R. Dois de Fevereiro","Água Santa","Rio de Janeiro","RJ","22000000","2000-02-12",18,"M",100000,20000,True),
("2600586709","César Teixeira","Rua Conde de Bonfim","Tijuca","Rio de Janeiro","RJ","22020001","2000-03-12",18,"M",120000,22000,False);

SELECT * FROM CLIENTES;

SELECT * FROM sucos.tabela_de_produtos;

SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR,
EMBALAGEM,TAMANHO,SABOR, PRECO_DE_LISTA AS PRECO_LISTA 
FROM sucos.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM produtos);

SELECT * FROM produtos;

INSERT INTO produtos
SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR,
SABOR,TAMANHO, EMBALAGEM, PRECO_DE_LISTA AS PRECO_LISTA 
FROM sucos.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM produtos);

SELECT * FROM VENDEDORES;

SELECT * FROM sucos.tabela_de_clientes;

INSERT INTO CLIENTES
SELECT CPF,NOME,CONCAT(ENDERECO_1," ",ENDERECO_2) AS ENDERECO, BAIRRO, CIDADE, ESTADO,CEP,DATA_DE_NASCIMENTO,IDADE,SEXO,
LIMITE_DE_CREDITO AS LIMITE_CREDITO,VOLUME_DE_COMPRA AS VOLUME_COMPRA,PRIMEIRA_COMPRA FROM sucos.tabela_de_clientes
WHERE CPF NOT IN (SELECT CPF FROM clientes);