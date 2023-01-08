USE `sucos`;
DROP procedure IF EXISTS `alo_mundo`;
DELIMITER $$
USE `sucos`$$
CREATE PROCEDURE `alo_mundo`()
BEGIN 
select 'Alô Mundo!!!!';
END$$
DELIMITER $$

CALL alo_mundo;

DROP procedure IF EXISTS `mostra_numero`;
DELIMITER $$
USE `sucos`$$
CREATE PROCEDURE `mostra_numero`()
BEGIN 
select (1+9)/5;
END$$
DELIMITER $$

CALL mostra_numero;

DROP procedure IF EXISTS `mostra_numero_alias`;
DELIMITER $$
USE `sucos`$$
CREATE PROCEDURE `mostra_numero_alias`()
BEGIN 
select (1+9)/5 as RESULTADO;
END$$
DELIMITER $$

CALL mostra_numero_alias;

DROP procedure IF EXISTS `sp_com_funcoes`;
DELIMITER $$
CREATE PROCEDURE `sp_com_funcoes` ()
BEGIN
SELECT CONCAT('Alô Mundo !!!!','.....',(1+9)/5) as ITENS_COMBINADOS; 
END $$
DELIMITER $$

CALL sp_com_funcoes;

DROP procedure IF EXISTS `sp_com_comentarios`;
DELIMITER $$
CREATE PROCEDURE `sp_com_comentarios` ()
BEGIN
/*Vamos exibir itens combinados
entre textos e números*/
-- Usando a função CONCAT
SELECT CONCAT('Alô Mundo !!!!','.....',(1+9)/5) as ITENS_COMBINADOS; 
END $$
DELIMITER $$

CALL sp_com_comentarios;
