DROP PROCEDURE IF EXISTS p_inserir_venda;
DELIMITER $$
CREATE PROCEDURE `p_inserir_venda` (vData DATE, max_itens INT, max_quantidade INT)
BEGIN
	DECLARE vCliente VARCHAR(11);
    DECLARE vProduto VARCHAR(10);
    DECLARE vVendedor VARCHAR(5);
    DECLARE vQuantidade INT;
    DECLARE vPreco FLOAT;
    DECLARE vItens INT;
    DECLARE vNumeroNota INT;
    DECLARE vContador INT DEFAULT 1;
    SELECT MAX(NUMERO)+1 INTO vNumeroNota FROM NOTAS_FISCAIS;
    SET vCliente=f_cliente_aleatorio() ;
    SET vVendedor=f_vendedor_aleatorio();
    INSERT INTO notas_fiscais (CPF,MATRICULA,DATA_VENDA,NUMERO,IMPOSTO)
    VALUES (vCliente, vVendedor, vData, vNumeroNota, 0.18);
    SET vItens = f_numero_aleatorio(1, max_itens);
	WHILE vContador<=vItens
    DO
		SET vProduto = f_produto_aleatorio();
        SET vQuantidade = f_numero_aleatorio(10,max_quantidade);
        SELECT PRECO_DE_LISTA into vPreco FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = vProduto;
		INSERT INTO itens_notas_fiscais (NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE,PRECO) 
        VALUES (vNumeroNota,vProduto,vQuantidade, vPreco);
        SET vContador=vContador+1;
    END WHILE;
END $$
DELIMITER $$

CALL p_inserir_venda('20220517',30,100);

SELECT A.NUMERO, COUNT(*) AS NUMERO_ITENS, SUM(B.QUANTIDADE*B.PRECO) AS FATURADO 
FROM NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO= B.NUMERO WHERE A.DATA_VENDA = '20220517'
GROUP BY A.NUMERO;

DROP PROCEDURE IF EXISTS p_inserir_venda;
DELIMITER $$
CREATE PROCEDURE `p_inserir_venda` (vData DATE, max_itens INT, max_quantidade INT)
BEGIN
	DECLARE vCliente VARCHAR(11);
    DECLARE vProduto VARCHAR(10);
    DECLARE vVendedor VARCHAR(5);
    DECLARE vQuantidade INT;
    DECLARE vPreco FLOAT;
    DECLARE vItens INT;
    DECLARE vNumeroNota INT;
    DECLARE vContador INT DEFAULT 1;
    DECLARE vNumItensNota INT;
    SELECT MAX(NUMERO)+1 INTO vNumeroNota FROM NOTAS_FISCAIS;
    SET vCliente=f_cliente_aleatorio() ;
    SET vVendedor=f_vendedor_aleatorio();
    INSERT INTO notas_fiscais (CPF,MATRICULA,DATA_VENDA,NUMERO,IMPOSTO)
    VALUES (vCliente, vVendedor, vData, vNumeroNota, 0.18);
    SET vItens = f_numero_aleatorio(1, max_itens);
	WHILE vContador<=vItens
    DO
		SET vProduto = f_produto_aleatorio();
        SELECT COUNT(*) INTO vNumItensNota FROM itens_notas_fiscais
        WHERE NUMERO = vNumeroNota AND CODIGO_DO_PRODUTO = vProduto;
        IF vNumItensNota = 0 THEN
			SET vQuantidade = f_numero_aleatorio(10,max_quantidade);
			SELECT PRECO_DE_LISTA into vPreco FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = vProduto;
			INSERT INTO itens_notas_fiscais (NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE,PRECO) 
			VALUES (vNumeroNota,vProduto,vQuantidade, vPreco);
		END IF;
		SET vContador=vContador+1;
    END WHILE;
END $$
DELIMITER $$

CALL p_inserir_venda('20220517',30,100);

SELECT A.NUMERO, COUNT(*) AS NUMERO_ITENS, SUM(B.QUANTIDADE*B.PRECO) AS FATURADO 
FROM NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO= B.NUMERO WHERE A.DATA_VENDA = '20220517'
GROUP BY A.NUMERO;

SELECT * FROM tabela_de_produtos;