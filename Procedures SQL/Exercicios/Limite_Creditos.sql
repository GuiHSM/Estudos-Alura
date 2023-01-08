DROP PROCEDURE IF EXISTS Limite_Creditos;
DELIMITER $$
CREATE PROCEDURE `Limite_Creditos`()
BEGIN
	DECLARE fimDoCursor INT DEFAULT 0;
	DECLARE total FLOAT;
	DECLARE atual FLOAT;
    DECLARE c CURSOR FOR SELECT LIMITE_DE_CREDITO FROM tabela_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET  fimDoCursor=1;
    SET total=0;
    OPEN c;
    WHILE fimDoCursor=0
    DO
		FETCH c INTO atual;
        IF fimDoCursor = 0 THEN
			SET total= total+atual;
        END IF;
    END WHILE;
    CLOSE c;
    SELECT total as Valor_Total_De_Crédito;
END $$
DELIMITER $$

call Limite_Creditos;