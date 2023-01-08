DROP PROCEDURE IF EXISTS Reajuste_Comissao;
DELIMITER $$
CREATE PROCEDURE `Reajuste_Comissao`(vComissao float)
BEGIN
Update tabela_de_vendedores SET PERCENTUAL_COMISSAO=vComissao;
END $$
DELIMITER $$

CALL Reajuste_Comissao(0.2);

SELECT * FROM tabela_de_vendedores;
