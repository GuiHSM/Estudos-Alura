DROP PROCEDURE IF EXISTS acha_tipo_sabor_erro;
DELIMITER $$
CREATE PROCEDURE `acha_tipo_sabor_erro`(vProduto VARCHAR(50))
BEGIN
	DECLARE vSabor VARCHAR(50);
    SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto=vProduto;
    CASE vSabor
    WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
    WHEN 'Laranja' THEN SELECT 'Cítrico';
    WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
    WHEN 'Uva' THEN SELECT 'Neutros';
    WHEN 'Morango' THEN SELECT 'Neutros';
    END CASE;
    SELECT vMensagem;
END $$

SELECT CODIGO_do_PRODUTO, SABOR FROM tabela_de_produtos;

CALL acha_sabor_produto('1004327');

CALL acha_tipo_sabor_erro('1004327');

DROP PROCEDURE IF EXISTS acha_tipo_sabor_erro;
DELIMITER $$
CREATE PROCEDURE `acha_tipo_sabor_erro`(vProduto VARCHAR(50))
BEGIN
	DECLARE vSabor VARCHAR(50);
    DECLARE msgErro VARCHAR(30);
    DECLARE CONTINUE HANDLER FOR 1339 SET msgErro = 'O case não está completo.';
    SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto=vProduto;
    CASE vSabor
    WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
    WHEN 'Laranja' THEN SELECT 'Cítrico';
    WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
    WHEN 'Uva' THEN SELECT 'Neutros';
    WHEN 'Morango' THEN SELECT 'Neutros';
    END CASE;
    SELECT msgErro;
END $$

CALL acha_tipo_sabor_erro('1004327');