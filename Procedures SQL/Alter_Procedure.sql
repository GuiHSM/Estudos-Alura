USE `sucos`;
DROP procedure IF EXISTS `alo_mundo2`;
DELIMITER $$
USE `sucos`$$
CREATE PROCEDURE `alo_mundo2`()
BEGIN 
select 'Alô Mundo!!!!';
END$$
DELIMITER $$

CALL alo_mundo2;

DROP procedure IF EXISTS `alo_mundo2`;
DELIMITER $$
USE `sucos`$$
CREATE PROCEDURE `alo_mundo2`()
BEGIN 
select 'Alô Mundo!!!!,tudo bem?';
END$$
DELIMITER $$

CALL alo_mundo2;