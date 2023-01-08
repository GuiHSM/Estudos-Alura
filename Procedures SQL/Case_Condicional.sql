DROP PROCEDURE IF EXISTS acha_status_preco_case;
DELIMITER $$
CREATE PROCEDURE `acha_status_preco_case`(vProduto VARCHAR(50))
BEGIN
	DECLARE vPreco FLOAT;
	DECLARE vMensagem VARCHAR(30);
	SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos WHERE codigo_do_produto = vProduto;
    CASE
    WHEN vPreco >=12 THEN SET vMensagem = 'Produto Caro';
    WHEN vPreco>=7 AND vPreco< 12 THEN SET vMensagem = 'Produto Em Conta';
	ELSE SET vMensagem = 'Produto Barato';
    END CASE;
    SELECT vMensagem;
END $$

CALL acha_status_preco_case('1000889');
CALL acha_status_preco_case('1086543');
CALL acha_status_preco_case('326779');