SELECT DISTINCT SABOR FROM tabela_de_produtos;

-- 'Lima/Limão' - 'Cítrico'
-- 'Laranja' - 'Cítrico'
-- 'Morango/Limão' - 'Cítrico'
-- 'Uva' - 'Neutros'
-- 'Morango' - 'Neutros'
-- 'outros' - 'Acidos'

SELECT SABOR FROM tabela_de_produtos WHERE codigo_do_produto='1000889';

DROP PROCEDURE IF EXISTS acha_tipo_sabor;
DELIMITER $$
CREATE PROCEDURE `acha_tipo_sabor`(vProduto VARCHAR(50))
BEGIN
	DECLARE vSabor VARCHAR(50);
    SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto=vProduto;
    CASE vSabor
    WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
    WHEN 'Laranja' THEN SELECT 'Cítrico';
    WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
    WHEN 'Uva' THEN SELECT 'Neutros';
    WHEN 'Morango' THEN SELECT 'Neutros';
    ELSE SELECT 'Ácidos';
    END CASE;
    SELECT vMensagem;
END $$

CALL acha_sabor_produto('1000889');

CALL acha_tipo_sabor('1000889');