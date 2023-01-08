SELECT * FROM tbcliente;

SELECT CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA FROM tbcliente;

SELECT CPF,NOME FROM tbcliente;

SELECT CPF,NOME FROM tbcLiente LIMIT 5;

SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;

SELECT NOME, CPF, SEXO, IDADE, DATA_NASCIMENTO FROM tbcliente;

SELECT NOME,MATRICULA FROM TABELA_DE_VENDEDORES;

SELECT * FROM tbproduto WHERE PRODUTO = '544931';

SELECT * FROM tbcliente WHERE CIDADE = "Rio de Janeiro";

SELECT * FROM tbproduto WHERE SABOR = 'Limão';

UPDATE tbproduto SET SABOR="Cítricos" WHERE SABOR="Limão";

SELECT * FROM TABELA_DE_VENDEDORES WHERE NOME="Claudia Morais";

SELECT * FROM tbcliente WHERE IDADE=22;
SELECT * FROM tbcliente WHERE IDADE>22;
SELECT * FROM tbcliente WHERE IDADE<22;
SELECT * FROM tbcliente WHERE IDADE>=22;
SELECT * FROM tbcliente WHERE IDADE<=22;
SELECT * FROM tbcliente WHERE IDADE<>22;

SELECT * FROM tbcliente WHERE NOME > "Fernando Cavalcante";
SELECT * FROM tbcliente WHERE NOME <> "Fernando Cavalcante";
SELECT * FROM tbcliente WHERE NOME >= "Fernando Cavalcante";

SELECT * FROM tbproduto WHERE PRECO_LISTA=16.008;
SELECT * FROM tbproduto WHERE PRECO_LISTA<16.008;
SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

SELECT * FROM TABELA_DE_VENDEDORES WHERE COMISSAO>10;

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO = '1995-01-13';
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO > '1995-01-13';
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO < '1995-01-13';
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO >= '1995-01-13';
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO <= '1995-01-13';
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO <> '1995-01-13';

SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) = '1995';
SELECT * FROM tbcliente WHERE MONTH(DATA_NASCIMENTO) = '10';

SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

SELECT * FROM tbproduto WHERE PRECO_LISTA>=16.007 AND PRECO_LISTA<=16.009;

SELECT * FROM tbcliente WHERE IDADE>= 18 AND IDADE <= 22;
SELECT * FROM tbcliente WHERE IDADE BETWEEN 18 AND 22;

SELECT * FROM tbcliente WHERE IDADE>= 18 AND IDADE <= 22 AND SEXO='M';

SELECT * FROM tbcliente WHERE cidade = 'Rio de Janeiro' OR BAIRRO = 'Jardins';

SELECT * FROM tbcliente WHERE (IDADE>= 18 AND IDADE <= 22 AND SEXO='M') AND (cidade = 'Rio de Janeiro' OR BAIRRO = 'Jardins');
SELECT * FROM tbcliente WHERE NOT(IDADE>= 18 AND IDADE <= 22 AND SEXO='M') AND (cidade = 'Rio de Janeiro' OR BAIRRO = 'Jardins');