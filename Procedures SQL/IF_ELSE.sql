DROP PROCEDURE IF EXISTS cliente_novo_velho;
DELIMITER $$
CREATE PROCEDURE `cliente_novo_velho`(vCPF VARCHAR(50))
BEGIN
	DECLARE vResultado VARCHAR(20);
	DECLARE vDataNascimento DATE;
	SELECT DATA_DE_NASCIMENTO INTO vDataNascimento FROM tabela_de_clientes WHERE CPF=vCPF;
    IF vDataNascimento < '20000101' THEN
		SET vResultado = 'CLIENTE VELHO';
    ELSE
		SET vResultado = 'CLIENTE NOVO';
    END IF;
    SELECT vResultado;
END $$
DELIMITER $$

CALL cliente_novo_velho('1471156710');
CALL cliente_novo_velho('19290992743');
