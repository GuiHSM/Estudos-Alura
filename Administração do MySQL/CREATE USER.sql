DROP USER if exists 'admin02'@'localhost';
CREATE USER 'admin02'@'localhost' identified BY 'admin02';
GRANT ALL PRIVILEGES ON *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

DROP USER if exists 'root'@'localhost';

DROP USER if exists 'cliente02'@'localhost';
CREATE USER 'cliente02'@'localhost' identified by 'cliente02';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE ON *.* TO 'cliente02'@'localhost';

DROP USER if exists 'read02'@'localhost';
CREATE USER 'read02'@'localhost' identified by 'read02';
GRANT SELECT, EXECUTE ON *.* TO 'read02'@'localhost';

DROP USER if exists 'backup02'@'localhost';
CREATE USER 'backup02'@'localhost' identified by 'backup02';
GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'backup02'@'localhost';

DROP USER if exists 'admingeneric02'@'%';
CREATE USER 'admingeneric02'@'%' identified BY 'admingeneric02';
GRANT ALL PRIVILEGES ON *.* TO 'admingeneric02'@'%' WITH GRANT OPTION;

DROP USER if exists 'cliente04'@'%';
CREATE USER 'cliente04'@'%' identified by 'cliente04';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE ON sucos.* TO 'cliente04'@'%';

DROP USER if exists 'cliente05'@'%';
CREATE USER 'cliente05'@'%' identified by 'cliente05';
GRANT SELECT, INSERT, UPDATE, DELETE ON sucos.tabela_de_clientes TO 'cliente05'@'%';

SHOW GRANTS FOR 'cliente05'@'%';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'cliente05'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE ON *.* TO 'cliente05'@'%';

DROP USER if exists 'cliente06'@'%';
CREATE USER 'cliente06'@'%' IDENTIFIED BY 'cliente06';
GRANT SELECT, INSERT, UPDATE, DELETE ON sucos.tabela_de_clientes to 'cliente06'@'%';
GRANT SELECT ON sucos.tabela_de_produtos to 'cliente06'@'%';