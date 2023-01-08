DROP PROCEDURE IF EXISTS Comparativo_Vendas_Case_Cond;
DELIMITER $$
CREATE PROCEDURE `Comparativo_Vendas_Case_Cond`(vData1 Date, vData2 Date)
BEGIN
	DECLARE vFaturamento1 FLOAT;
	DECLARE vFaturamento2 FLOAT;
	DECLARE vMensagem VARCHAR(50);
	SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA INTO vFaturamento1 FROM 
	NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
	ON A.NUMERO = B.NUMERO
	WHERE A.DATA_VENDA = vData1;
    SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA INTO vFaturamento2 FROM 
	NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
	ON A.NUMERO = B.NUMERO
	WHERE A.DATA_VENDA = vData2;
    CASE WHEN (vFaturamento1-vFaturamento2)/vFaturamento1 > 0.1 THEN SET vMensagem = 'Verde';
    WHEN (vFaturamento1-vFaturamento2)/vFaturamento1 < 0.1 AND (vFaturamento1-vFaturamento2)/vFaturamento1 > -0.1 THEN SET vMensagem = 'Amarela';
	ELSE SET vMensagem = 'Vermelho';
    END CASE;
    SELECT vMensagem;
END $$

CALL Comparativo_Vendas_Case_Cond(20170301,20170302);
CALL Comparativo_Vendas_Case_Cond(20170301,20170303);
CALL Comparativo_Vendas_Case_Cond(20170302,20170301);