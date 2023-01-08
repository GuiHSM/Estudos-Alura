DROP PROCEDURE IF EXISTS teste_select_into;
DELIMITER $$
CREATE PROCEDURE `teste_select_into`()
BEGIN
	DECLARE vNome VARCHAR(50);
    SELECT nome INTO vNome FROM tabela_de_clientes;
    SELECT vNome;
END $$
DELIMITER $$

call teste_select_into;