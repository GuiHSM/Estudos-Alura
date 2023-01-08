DROP PROCEDURE IF EXISTS Quantidade_Notas;
DELIMITER $$
CREATE PROCEDURE `Quantidade_Notas`(vData date)
BEGIN
DECLARE NUMNOTAS INTEGER;
SELECT COUNT(*) INTO NUMNOTAS FROM NOTAS_FISCAIS WHERE DATA_VENDA=vData;
SELECT NUMNOTAS;
END $$
DELIMITER $$

CALL Quantidade_Notas("2017-01-01");