USE vendas_sucos;

CREATE TABLE produtos(
CODIGO VARCHAR(10) NOT NULL,
DESCRITOR VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANHO VARCHAR(50) NULL,
EMBALAGEM VARCHAR(50) NULL,
PRECO_LISTA FLOAT NULL,
PRIMARY KEY(CODIGO)
);

CREATE TABLE VENDEDORES(
MATRICULA VARCHAR(5) NOT NULL,
NOME VARCHAR(100) NULL,
BAIRRO VARCHAR(50) NULL,
COMISSAO FLOAT NULL,
DATA_AMISSAO DATE NULL,
FERIA BIT(1) NULL,
PRIMARY KEY(MATRICULA));

ALTER TABLE VENDEDORES RENAME COLUMN DATA_AMISSAO TO DATA_ADMISSAO;
ALTER TABLE VENDEDORES RENAME COLUMN FERIA TO FERIAS;

##Criado via interface visual
CREATE TABLE `vendas_sucos`.`clientes` (
  `CPF` VARCHAR(11) NOT NULL,
  `NOME` VARCHAR(100) NULL,
  `ENDERECO` VARCHAR(150) NULL,
  `BAIRRO` VARCHAR(50) NULL,
  `CIDADE` VARCHAR(50) NULL,
  `ESTADO` VARCHAR(50) NULL,
  `CEP` VARCHAR(8) NULL,
  `DATA_NASCIMENTO` DATE NULL,
  `IDADE` INT NULL,
  `SEXO` VARCHAR(1) NULL,
  `LIMITE_CREDITO` FLOAT NULL,
  `VOLUME_COMPRA` FLOAT NULL,
  `PRIMEIRA_COMPRA` BIT(1) NULL,
  PRIMARY KEY (`CPF`));

CREATE TABLE TABELA_DE_VENDAS(
NUMERO VARCHAR(5) NOT NULL,
DATA DATE NULL,
CPF VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPOSTO FLOAT NULL,
PRIMARY KEY(NUMERO)
);

ALTER TABLE TABELA_DE_VENDAS ADD CONSTRAINT FK_CLIENTES FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);
ALTER TABLE TABELA_DE_VENDAS ADD CONSTRAINT FK_VENDEDORES FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA);

ALTER TABLE tabela_de_vendas RENAME Notas;

CREATE TABLE ITENS_NOTAS(
NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
QUANTIDADE INT NULL,
PRECO FLOAT NULL,
PRIMARY KEY(NUMERO, CODIGO)
);
ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_PRODUTOS FOREIGN KEY (CODIGO) REFERENCES PRODUTOS (CODIGO);
ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_NOTAS FOREIGN KEY (NUMERO) REFERENCES NOTAS (NUMERO);
