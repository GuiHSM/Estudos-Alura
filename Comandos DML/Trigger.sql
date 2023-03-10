USE VENDAS_SUCOS;
CREATE TABLE TAB_FATURAMENTO
(DATA_VENDA DATE NULL, TOTAL_VENDA FLOAT);

SELECT * FROM TAB_FATURAMENTO;

SELECT * FROM NOTAS;
SELECT * FROM ITENS_NOTAS;
SELECT * FROM CLIENTE;
SELECT * FROM PRODUTOS;

INSERT INTO NOTAS (NUMERO, DATA, CPF, MATRICULA, IMPOSTO)
VALUES ('0100','2019-05-08', '1471156710','235',0.10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0100', '1000889',100,10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0100', '1002334',100,10);

INSERT INTO NOTAS (NUMERO, DATA, CPF, MATRICULA, IMPOSTO)
VALUES ('0101','2019-05-08', '1471156710','235',0.10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0101', '1000889',100,10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0101', '1002334',100,10);



DELETE FROM TAB_FATURAMENTO;
INSERT INTO TAB_FATURAMENTO
SELECT A.DATA, SUM(B.QUANTIDADE*B.PRECO) AS TOTAL_VENDA FROM
NOTAS A INNER JOIN ITENS_NOTAS B
ON A.NUMERO=B.NUMERO
GROUP BY A.DATA;

SELECT * FROM TAB_FATURAMENTO;

DELETE FROM ITENS_NOTAS;
DELETE FROM NOTAS;

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_INSERT AFTER INSERT ON ITENS_NOTAS
FOR EACH ROW BEGIN
DELETE FROM TAB_FATURAMENTO;
INSERT INTO TAB_FATURAMENTO
SELECT A.DATA, SUM(B.QUANTIDADE*B.PRECO) AS TOTAL_VENDA FROM
NOTAS A INNER JOIN ITENS_NOTAS B
ON A.NUMERO=B.NUMERO
GROUP BY A.DATA;
END//

SELECT * FROM TAB_FATURAMENTO;

DELETE FROM ITENS_NOTAS;
DELETE FROM NOTAS;

INSERT INTO NOTAS (NUMERO, DATA, CPF, MATRICULA, IMPOSTO)
VALUES ('0100','2019-05-08', '1471156710','235',0.10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0100', '1000889',100,10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0100', '1002334',100,10);

INSERT INTO NOTAS (NUMERO, DATA, CPF, MATRICULA, IMPOSTO)
VALUES ('0101','2019-05-08', '1471156710','235',0.10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0101', '1000889',100,10);
INSERT INTO ITENS_NOTAS (NUMERO,CODIGO,QUANTIDADE, PRECO)
VALUES ('0101', '1002334',100,10);

DELETE FROM ITENS_NOTAS;
DELETE FROM NOTAS;

SELECT * FROM TAB_FATURAMENTO;
commit;

