
SELECT * FROM tabela_de_produtos;

-- >= 12,00 ----Caro
-- Entre 7 e 12 em conta
-- < 7 barato

SELECT PRECO_DE_LISTA FROM tabela_de_produtos WHERE codigo_do_produto = '1000889';




DROP PROCEDURE IF EXISTS acha_status_preco;
DELIMITER $$
CREATE PROCEDURE `acha_status_preco`(vProduto VARCHAR(50))
BEGIN
	DECLARE vPreco FLOAT;
	DECLARE vMensagem VARCHAR(30);
	SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos WHERE codigo_do_produto = vProduto;
    IF vPreco >=12 THEN
		SET vMensagem = 'Produto Caro';
    ELSEIF vPreco>=7 AND vPreco< 12 THEN
		SET vMensagem = 'Produto Em Conta';
	ELSE
		SET vMensagem = 'Produto Barato';
    END IF;
    SELECT vMensagem;
END $$

CALL acha_status_preco('1000889');
CALL acha_status_preco('1086543');
CALL acha_status_preco('326779');