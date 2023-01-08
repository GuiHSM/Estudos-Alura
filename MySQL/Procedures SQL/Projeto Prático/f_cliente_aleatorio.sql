DROP FUNCTION IF EXISTS f_cliente_aleatorio;
DELIMITER $$
CREATE FUNCTION `f_cliente_aleatorio` ()
RETURNS VARCHAR(11)
BEGIN
  DECLARE vRetorno VARCHAR(11);
  DECLARE num_max_tabela INT;
  DECLARE num_aleatorio INT;
  SELECT COUNT(8) INTO num_max_tabela FROM tabela_de_clientes;
  SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
  SET num_aleatorio = num_aleatorio -1;
  SELECT CPF INTO vRetorno FROM tabela_de_clientes LIMIT num_aleatorio,1;
RETURN vRetorno;
END $$
DELIMITER $$

SELECT f_cliente_aleatorio();