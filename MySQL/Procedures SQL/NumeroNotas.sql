SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS NumeroNotas;
DELIMITER $$
CREATE FUNCTION `NumeroNotas` (vDate DATE)
RETURNS INT
BEGIN
  DECLARE NUMNOTAS INT;
  SELECT COUNT(*) INTO NUMNOTAS FROM notas_fiscais WHERE DATA_VENDA = '20170101';
RETURN NUMNOTAS;
END$$
DELIMITER $$

SELECT NumeroNotas('20170101');