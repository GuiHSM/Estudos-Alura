DROP PROCEDURE IF EXISTS Calcula_Idade;
DELIMITER $$
CREATE PROCEDURE `Calcula_Idade`()
BEGIN
UPDATE tabela_de_clientes SET IDADE=TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());
END $$
DELIMITER $$

call Calcula_Idade;

SELECT * FROM tabela_de_clientes;