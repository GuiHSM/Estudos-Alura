DROP PROCEDURE IF EXISTS acha_sabor_produto;
DELIMITER $$
CREATE PROCEDURE `acha_sabor_produto`(vProduto VARCHAR(50))
BEGIN
DECLARE vSabor VARCHAR(50);
set vSabor = 'Melancia';
SELECT vSabor;
END $$
DELIMITER $$

CALL acha_sabor_produto('1000889');

DROP PROCEDURE IF EXISTS acha_sabor_produto;
DELIMITER $$
CREATE PROCEDURE `acha_sabor_produto`(vProduto VARCHAR(50))
BEGIN
DECLARE vSabor VARCHAR(50);
SELECT SABOR into vSabor FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO=vProduto;
SELECT vSabor;
END $$
DELIMITER $$

CALL acha_sabor_produto('1000889');