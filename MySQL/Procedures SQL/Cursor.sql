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
    CLOSE c;
END $$
DELIMITER $$

call cursos_primeiro_contato;