DROP PROCEDURE IF EXISTS cursos_primeiro_contato;
DELIMITER $$
CREATE PROCEDURE `cursos_primeiro_contato`()
BEGIN
	DECLARE vNome VARCHAR(50);
    DECLARE c CURSOR FOR SELECT nome FROM tabela_de_clientes limit 4;
    OPEN c;
    FETCH c INTO vNome;
    SELECT vNome;
    FETCH c INTO vNome;
    SELECT vNome;
    FETCH c INTO vNome;
    SELECT vNome;
    FETCH c INTO vNome;
    SELECT vNome;
    FETCH c INTO vNome;
    SELECT vNome;
    CLOSE c;
END $$
DELIMITER $$

call cursos_primeiro_contato;

DROP PROCEDURE IF EXISTS cursor_looping;
DELIMITER $$
CREATE PROCEDURE `cursor_looping`()
BEGIN
	DECLARE fimDoCursor INT DEFAULT 0;
	DECLARE vNome VARCHAR(50);
    DECLARE c CURSOR FOR SELECT nome FROM tabela_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET  fimDoCursor=1;
    OPEN c;
    WHILE fimDoCursor=0
    DO
		FETCH c INTO vNome;
        IF fimDoCursor = 0 THEN
			SELECT vNome;
        END IF;
    END WHILE;
    CLOSE c;
END $$
DELIMITER $$

call cursor_looping;