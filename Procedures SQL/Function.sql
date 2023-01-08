SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS f_acha_tipo_sabor;
DELIMITER $$
CREATE FUNCTION `f_acha_tipo_sabor` (vSabor VARCHAR(50))
RETURNS VARCHAR(20)
BEGIN
  DECLARE vRetorno VARCHAR(20) DEFAULT "";
  CASE vSabor
    WHEN 'Lima/Limão' THEN SET vRetorno='Cítrico';
    WHEN 'Laranja' THEN SET vRetorno='Cítrico';
    WHEN 'Morango/Limão' THEN SET vRetorno= 'Cítrico';
    WHEN 'Uva' THEN SET vRetorno='Neutros';
    WHEN 'Morango' THEN SET vRetorno= 'Neutros';
    ELSE SET vRetorno= 'Ácidos';
END CASE;
RETURN vRetorno;
END$$
DELIMITER $$

SELECT f_acha_tipo_sabor('Uva');

SELECT NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor(SABOR) FROM tabela_de_produtos;
SELECT NOME_DO_PRODUTO, SABOR FROM tabela_de_produtos WHERE f_acha_tipo_sabor(SABOR)='Neutros';