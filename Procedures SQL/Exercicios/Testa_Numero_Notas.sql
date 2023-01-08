DROP PROCEDURE IF EXISTS Testa_Numero_Notas;
DELIMITER $$
CREATE PROCEDURE `Testa_Numero_Notas`(vData date)
BEGIN
	DECLARE STATUS VARCHAR(11);
	DECLARE NUMNOTAS INTEGER;
	SELECT COUNT(*) INTO NUMNOTAS FROM NOTAS_FISCAIS WHERE DATA_VENDA=vData;
    IF NUMNOTAS>70 THEN
		SET STATUS='Muita nota';
    ELSE
		SET STATUS='Pouca nota';
    END IF;
	SELECT STATUS,NUMNOTAS;
END $$
DELIMITER $$

CALL Testa_Numero_Notas("2017-01-01");
CALL Testa_Numero_Notas("2017-01-22");