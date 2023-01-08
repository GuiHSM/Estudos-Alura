USE sucos;
DROP PROCEDURE IF EXISTS exibe_variavel;
DELIMITER $$
CREATE PROCEDURE `exibe_variavel` ()
BEGIN
declare texto char(15) default 'Alô Mundo !!!!';
SELECT texto;
END$$
DELIMITER $$

CALL exibe_variavel;

DROP PROCEDURE IF EXISTS tipo_de_dados
DELIMITER $$
CREATE PROCEDURE `tipo_de_dados` ()
BEGIN
declare v varchar(5) default 'TEXTO';
declare i integer default 10;
declare d decimal(4,2) default 56.12;
declare dt date default '2019-03-01';
SELECT v,i,d,dt;
END$$
DELIMITER $$

CALL tipo_de_dados;

DROP PROCEDURE IF EXISTS data_hora_local;
DELIMITER $$
CREATE PROCEDURE `data_hora_local` ()
BEGIN
declare ts datetime default localtimestamp;
SELECT ts;
END$$
DELIMITER $$

CALL data_hora_local;

DROP PROCEDURE IF EXISTS sem_declaracao;
DELIMITER $$
CREATE PROCEDURE `sem_declaracao` ()
BEGIN
SELECT TEXTO;
END$$
DELIMITER $$

CALL sem_declaracao;

DROP PROCEDURE IF EXISTS mesmo_tipo_dados;
DELIMITER $$
CREATE PROCEDURE `mesmo_tipo_dados` ()
BEGIN
DECLARE data_1, data_2 DATE DEFAULT '2014-09-13';
SELECT data_1,data_2;
END$$
DELIMITER $$

CALL mesmo_tipo_dados;

DROP PROCEDURE IF EXISTS atribui_valor;
DELIMITER $$
CREATE PROCEDURE `atribui_valor` ()
BEGIN
DECLARE texto varchar(30) DEFAULT 'Texto Inicial';
SELECT texto;
SET texto = 'Texto Modificado';
SELECT texto;
END$$
DELIMITER $$

CALL atribui_valor;