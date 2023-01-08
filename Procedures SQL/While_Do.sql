CREATE TABLE IF NOT EXISTS TAB_LOOPING(ID INT);

DROP PROCEDURE IF EXISTS looping_while;
DELIMITER $$
CREATE PROCEDURE `looping_while`(vNumInicial INT, vNumFinal INT)
BEGIN
	DECLARE vContador INT;
    DELETE FROM TAB_LOOPING;
    SET vContador=vNumInicial;
    WHILE VcONTADOR<= VnUMfINAL
    DO
		insert into tab_looping values (VcONTADOR);
        SET vContador = vContador+1;
    END WHILE;
END $$

CALL looping_while(0,1000);

SELECT * FROM tab_looping;