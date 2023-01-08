DROP PROCEDURE IF EXISTS inclui_novo_produto_parametro;
DELIMITER $$
CREATE PROCEDURE `inclui_novo_produto_parametro` (vCodigo varchar(50),
vNome varchar(50),
vSabor varchar(50),
vTamanho varchar(50),
vEmbalagem varchar(50),
vPreco DECIMAL(10,2))
BEGIN
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo,vNome,vSabor,vTamanho,vEmbalagem,vPreco);
END$$
DELIMITER $$

CALL inclui_novo_produto_parametro('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50);
CALL inclui_novo_produto_parametro('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50);

DROP PROCEDURE IF EXISTS inclui_novo_produto_parametro;
DELIMITER $$
CREATE PROCEDURE `inclui_novo_produto_parametro` (vCodigo varchar(50),
vNome varchar(50),
vSabor varchar(50),
vTamanho varchar(50),
vEmbalagem varchar(50),
vPreco DECIMAL(10,2))
BEGIN
DECLARE mensagem VARCHAR(50);
DECLARE EXIT HANDLER FOR 1062
BEGIN
	SET mensagem = 'Produto com chave primária!!';
	SELECT mensagem;
END;
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo,vNome,vSabor,vTamanho,vEmbalagem,vPreco);
SET mensagem = 'Produto incluido com sucesso!!';
SELECT mensagem;
END$$

DELIMITER $$

CALL inclui_novo_produto_parametro('2001004','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50);
CALL inclui_novo_produto_parametro('2001004','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50);