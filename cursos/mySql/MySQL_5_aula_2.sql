# Tabelas temporárias armazenadas em disco
show global status like 'Created_tmp_disk_tables'; 

#Tabelas temporárias armazenadas na memória
show global status like 'Created_tmp_tables';

SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';

SET GLOBAL tmp_table_size = 45000000;

use sakila;

CREATE TABLE DEFAULT_TABLE (ID INT, NOME VARCHAR(100));

ALTER TABLE DEFAULT_TABLE ENGINE = MyISAM;

CREATE TABLE DEFAULT_TABLE2 (ID INT, NOME VARCHAR(100)) ENGINE = MEMORY;

DROP DATABASE sucos_vendas;

USE SUCOS_VENDAS;

SELECT A.NOME_DO_PRODUTO FROM tabela_de_produtos A; #QUERY_COST : 3.85

SELECT A.NOME_DO_PRODUTO, C.QUANTIDADE FROM tabela_de_produtos A INNER JOIN ITENS_NOTAS_FISCAIS C 
ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO; #QUERY_COST : 56.587,82

SELECT A.NOME_DO_PRODUTO,  YEAR(B.DATA_VENDA) AS ANO, SUM(C.QUANTIDADE) from tabela_De_produtos A 
INNER JOIN ITENS_NOTAS_FISCAIS C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS B ON B.NUMERO = C.NUMERO; #QUERY_COST : 205.326,15

USE SUCOS_VENDAS;

SELECT * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '20170101';

SELECT A.NOME_DO_PRODUTO, C.QUANTIDADE FROM tabela_de_produtos2 A INNER JOIN ITENS_NOTAS_FISCAIS2 C 
ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO;


EXPLAIN FORMAT = JSON SELECT * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '20170101';

CREATE TABLE `itens_notas_fiscais2` (
  `NUMERO` int NOT NULL,
  `CODIGO_DO_PRODUTO` varchar(10) NOT NULL,
  `QUANTIDADE` int NOT NULL,
  `PRECO` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `notas_fiscais2` (
  `CPF` varchar(11) NOT NULL,
  `MATRICULA` varchar(5) NOT NULL,
  `DATA_VENDA` date DEFAULT NULL,
  `NUMERO` int NOT NULL,
  `IMPOSTO` float NOT NULL,
  PRIMARY KEY (`NUMERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `tabela_de_produtos2` (
  `CODIGO_DO_PRODUTO` varchar(10) NOT NULL,
  `NOME_DO_PRODUTO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(20) DEFAULT NULL,
  `TAMANHO` varchar(10) DEFAULT NULL,
  `SABOR` varchar(20) DEFAULT NULL,
  `PRECO_DE_LISTA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO itens_notas_fiscais2 SELECT * FROM itens_notas_fiscais;

insert into notas_fiscais2 select * from notas_fiscais;

insert into tabela_de_produtos2 select * from tabela_de_produtos;

SELECT * FROM NOTAS_FISCAIS WHERE DATA_VENDA ='20170101';

ALTER TABLE NOTAS_FISCAIS ADD INDEX(DATA_VENDA);

SELECT * FROM NOTAS_FISCAIS2 WHERE DATA_VENDA ='20170101';

CREATE USER 'admin02'@'localhost' identified by 'admin02';

GRANT ALL PRIVILEGES ON *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

DROP USER 'root'@'localhost';

CREATE USER 'user02'@'localhost' identified by 'user02';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE ON *.* TO 'user02'@'localhost';


CREATE USER 'read02'@'localhost' identified by 'read02';

GRANT SELECT, EXECUTE ON *.* TO 'read02'@'localhost';

CREATE USER 'back02'@'localhost' identified by 'back02';

GRANT SELECT, RELOAD, replication client, lock tables  ON *.* TO 'back02'@'localhost';

CREATE USER 'admingeneric02'@'%' identified by 'admingeneric02';

GRANT ALL PRIVILEGES  ON *.* TO 'admingeneric02'@'%';

CREATE USER 'user04'@'%' IDENTIFIED BY 'user04';
grant select, insert, update, delete, execute, lock tables, create temporary tables 
ON SUCOS_VENDAS.* TO 'user04'@'%';

CREATE USER 'user05'@'%' identified by 'user05';

grant select, insert, update, delete
on sucos_vendas.tabela_de_clientes to 'user05';

grant select
on sucos_vendas.tabela_de_produtos to 'user05'@'%';

select * from mysql.user;

SHOW GRANTS FOR 'user02'@'localhost';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user02'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE temporary tables, lock tables, EXECUTE ON *.* TO 'user02'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON sucos_vendas.* TO  'user02'@'localhost';