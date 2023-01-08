SELECT RAND();
-- (ALEATORIO()*(MAX-MIN+1))+MIN
-- MIN =15, MAX=300
SELECT FLOOR((RAND()*(300-15+1))+15);

SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS f_numero_aleatorio;
DELIMITER $$
CREATE FUNCTION `f_numero_aleatorio` (min INT, max INT)
RETURNS INTEGER
BEGIN
  DECLARE vRetorno INT;
  SELECT FLOOR((RAND()*(max-min+1))+min) INTO vRetorno;
RETURN vRetorno;
END $$
DELIMITER $$

SELECT f_numero_aleatorio(15,300);