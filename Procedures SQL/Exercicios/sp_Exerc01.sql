DROP PROCEDURE IF EXISTS sp_Exerc01;
DELIMITER $$
CREATE PROCEDURE `sp_Exerc01` ()
BEGIN
DECLARE Cliente varchar(10) DEFAULT 'Nome Base';
DECLARE Idade integer DEFAULT '0';
DECLARE DataNascimento DATE DEFAULT localtimestamp;
DECLARE Custo Decimal(4,2) DEFAULT 0.0;
SELECT Cliente, Idade, DataNascimento, Custo;
SET Cliente='João';
SET Idade=10;
SET DataNascimento = '2007-01-10';
SET Custo = 10.23;
SELECT Cliente, Idade, DataNascimento, Custo;
END$$
DELIMITER $$

CALL sp_Exerc01;