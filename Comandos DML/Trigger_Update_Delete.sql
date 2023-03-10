USE vendas_sucos;

SELECT * FROM NOTAS;
SELECT * FROM ITENS_NOTAS;
SELECT * FROM TAB_FATURAMENTO;

UPDATE ITENS_NOTAS SET QUANTIDADE =200 WHERE NUMERO = '0101' AND CODIGO = '1002334';

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_UPDATE AFTER UPDATE ON ITENS_NOTAS
FOR EACH ROW BEGIN
DELETE FROM TAB_FATURAMENTO;
INSERT INTO TAB_FATURAMENTO
SELECT A.DATA, SUM(B.QUANTIDADE*B.PRECO) AS TOTAL_VENDA FROM
NOTAS A INNER JOIN ITENS_NOTAS B
ON A.NUMERO=B.NUMERO
GROUP BY A.DATA;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_DELETE AFTER DELETE ON ITENS_NOTAS
FOR EACH ROW BEGIN
DELETE FROM TAB_FATURAMENTO;
INSERT INTO TAB_FATURAMENTO
SELECT A.DATA, SUM(B.QUANTIDADE*B.PRECO) AS TOTAL_VENDA FROM
NOTAS A INNER JOIN ITENS_NOTAS B
ON A.NUMERO=B.NUMERO
GROUP BY A.DATA;
END//


DELETE FROM ITENS_NOTAS WHERE NUMERO = '0101' AND CODIGO = '1002334';