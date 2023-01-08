DROP PROCEDURE IF EXISTS looping_cursor_multiplas_colunas;
DELIMITER $$
CREATE PROCEDURE `looping_cursor_multiplas_colunas`()
BEGIN
	DECLARE fimDoCursor INT DEFAULT 0;
	DECLARE vCidade,vEstado,vCep VARCHAR(50);
    DECLARE vNome,vEndereco VARCHAR(150);
    DECLARE c CURSOR FOR SELECT nome,endereco_1,cidade,estado,cep FROM tabela_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET  fimDoCursor=1;
    OPEN c;
    WHILE fimDoCursor=0
    DO
		FETCH c INTO vNome,vEndereco,vCidade,vEstado,vCep;
        IF fimDoCursor = 0 THEN
			SELECT CONCAT(vNome,' Endereço: ',vEndereco,', ',vCidade,' - ',vEstado,' CEP: ',vCep);
        END IF;
    END WHILE;
    CLOSE c;
    SELECT total as Valor_Total_De_Crédito;
END $$
DELIMITER $$

call looping_cursor_multiplas_colunas;