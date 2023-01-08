DROP PROCEDURE IF EXISTS Mais_Um_Campo;
DELIMITER $$
CREATE PROCEDURE `Mais_Um_Campo`(vMes INT, vAno INT)
BEGIN
	DECLARE fimDoCursor INT DEFAULT 0;
	DECLARE vQuantidade INT;
    DECLARE vPreco,vFaturamento FLOAT;
    DECLARE c CURSOR FOR SELECT INF.QUANTIDADE, INF.PRECO FROM ITENS_NOTAS_FISCAIS INF
	INNER JOIN NOTAS_FISCAIS  NF ON NF.NUMERO = INF.NUMERO
	WHERE MONTH(NF.DATA_VENDA) = vMes AND YEAR(NF.DATA_VENDA) = vAno;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET  fimDoCursor=1;
    SET vFaturamento= 0;
    OPEN c;
    WHILE fimDoCursor=0
    DO
		FETCH c INTO vQuantidade,vPreco;
        IF fimDoCursor = 0 THEN
			SET vFaturamento= vFaturamento + vPreco*vQuantidade;
        END IF;
    END WHILE;
    CLOSE c;
    SELECT vFaturamento as Faturamento;
END $$
DELIMITER $$

call Mais_Um_Campo(2,2017);