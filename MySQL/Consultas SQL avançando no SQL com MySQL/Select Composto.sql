SELECT * FROM tabela_de_produtos WHERE SABOR= 'Manga' OR TAMANHO='470 ml';
SELECT * FROM tabela_de_produtos WHERE SABOR= 'Manga' AND TAMANHO='470 ml';
SELECT * FROM tabela_de_produtos WHERE NOT(SABOR= 'Manga' AND TAMANHO='470 ml');
SELECT * FROM tabela_de_produtos WHERE NOT(SABOR= 'Manga' OR TAMANHO='470 ml');
SELECT * FROM tabela_de_produtos WHERE SABOR= 'Manga' AND NOT (TAMANHO='470 ml');

SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja','Manga');
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja' OR SABOR = 'Manga';

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro','São Paulo') AND IDADE>=20;

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro','São Paulo') AND (IDADE BETWEEN 20 AND 22);

SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%' AND EMBALAGEM='PET';

SELECT count(cpf) FROM tabela_de_clientes where NOME like "%Mattos";