USE SUCOS;
ALTER TABLE tbproduto ADD CONSTRAINT PRIMARY KEY (PRODUTO);
ALTER TABLE tbcliente ADD CONSTRAINT PRIMARY KEY (CPF);
ALTER TABLE tbcliente ADD COLUMN (DATA_NASCIMENTO DATE);
ALTER TABLE TABELA_DE_VENDEDORES ADD COLUMN (DATA_ADMISSAO DATE);
ALTER TABLE TABELA_DE_VENDEDORES ADD COLUMN (DE_FERIAS BIT);