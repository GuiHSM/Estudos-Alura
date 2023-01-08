-- MySQL Script generated by MySQL Workbench
-- Tue Dec 20 15:21:37 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema vendas_sucos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendas_sucos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas_sucos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `vendas_sucos` ;

-- -----------------------------------------------------
-- Table `vendas_sucos`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sucos`.`clientes` (
  `CPF` VARCHAR(11) NOT NULL,
  `NOME` VARCHAR(100) NULL DEFAULT NULL,
  `ENDERECO` VARCHAR(150) NULL DEFAULT NULL,
  `BAIRRO` VARCHAR(50) NULL DEFAULT NULL,
  `CIDADE` VARCHAR(50) NULL DEFAULT NULL,
  `ESTADO` VARCHAR(50) NULL DEFAULT NULL,
  `CEP` VARCHAR(8) NULL DEFAULT NULL,
  `DATA_NASCIMENTO` DATE NULL DEFAULT NULL,
  `IDADE` INT NULL DEFAULT NULL,
  `SEXO` VARCHAR(1) NULL DEFAULT NULL,
  `LIMITE_CREDITO` FLOAT NULL DEFAULT NULL,
  `VOLUME_COMPRA` FLOAT NULL DEFAULT NULL,
  `PRIMEIRA_COMPRA` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vendas_sucos`.`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sucos`.`vendedores` (
  `MATRICULA` VARCHAR(5) NOT NULL,
  `NOME` VARCHAR(100) NULL DEFAULT NULL,
  `BAIRRO` VARCHAR(50) NULL DEFAULT NULL,
  `COMISSAO` FLOAT NULL DEFAULT NULL,
  `DATA_ADMISSAO` DATE NULL DEFAULT NULL,
  `FERIAS` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vendas_sucos`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sucos`.`notas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `DATA` DATE NULL DEFAULT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `MATRICULA` VARCHAR(5) NOT NULL,
  `IMPOSTO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  INDEX `FK_CLIENTES` (`CPF` ASC) VISIBLE,
  INDEX `FK_VENDEDORES` (`MATRICULA` ASC) VISIBLE,
  CONSTRAINT `FK_CLIENTES`
    FOREIGN KEY (`CPF`)
    REFERENCES `vendas_sucos`.`clientes` (`CPF`),
  CONSTRAINT `FK_VENDEDORES`
    FOREIGN KEY (`MATRICULA`)
    REFERENCES `vendas_sucos`.`vendedores` (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vendas_sucos`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sucos`.`produtos` (
  `CODIGO` VARCHAR(10) NOT NULL,
  `DESCRITO` VARCHAR(100) NULL DEFAULT NULL,
  `SABOR` VARCHAR(50) NULL DEFAULT NULL,
  `TAMANHO` VARCHAR(50) NULL DEFAULT NULL,
  `EMBALAGEM` VARCHAR(50) NULL DEFAULT NULL,
  `PRECO_LISTA` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vendas_sucos`.`itens_notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sucos`.`itens_notas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `CODIGO` VARCHAR(10) NOT NULL,
  `QUANTIDADE` INT NULL DEFAULT NULL,
  `PRECO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`, `CODIGO`),
  INDEX `FK_PRODUTOS` (`CODIGO` ASC) VISIBLE,
  CONSTRAINT `FK_NOTAS`
    FOREIGN KEY (`NUMERO`)
    REFERENCES `vendas_sucos`.`notas` (`NUMERO`),
  CONSTRAINT `FK_PRODUTOS`
    FOREIGN KEY (`CODIGO`)
    REFERENCES `vendas_sucos`.`produtos` (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
