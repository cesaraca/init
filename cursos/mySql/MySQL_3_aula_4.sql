SELECT * FROM produtos;

UPDATE produtos SET preco_lista = 5 WHERE codigo = 1000889;

UPDATE produtos SET embalagem = 'PET', TAMANHO = '1 Litro', descritor = 'Sabor da Montanha - 1 Litro - Uva' WHERE codigo = '1000889';

SELECT * FROM produtos WHERE sabor = 'Maracujá';

UPDATE produtos set preco_lista = preco_lista * 1.1 where sabor = 'Maracujá';

UPDATE clientes set endereco = 'R. Jorge Emílio 23', bairro = 'Santo Amaro', cidade = 'São Paulo', estado = 'SP', cep = '8833223' 
where cpf = '19290992743';

SELECT * FROM VENDEDORES;

SELECT * FROM SUCOS_VENDAS.TABELA_DE_VENDEDORES;

SELECT * FROM 
VENDEDORES A 
INNER JOIN SUCOS_VENDAS.TABELA_DE_VENDEDORES B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3);

UPDATE VENDEDORES A INNER JOIN SUCOS_VENDAS.TABELA_DE_VENDEDORES B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3)
SET A.FERIAS = B.DE_FERIAS, A.COMISSAO = B.PERCENTUAL_COMISSAO;

UPDATE CLIENTES A INNER JOIN VENDEDORES B ON A.BAIRRO = B.BAIRRO
SET VOLUME_COMPRA = VOLUME_COMPRA * 1.3;

INSERT INTO PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
  VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
  ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50),
  ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
  ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
  ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
  ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50),
  ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
  ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
  ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
  ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
  ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
  ('1001011','Sabor dos Alpes 1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

SELECT * FROM PRODUTOS WHERE SUBSTRING(DESCRITOR,1,15) = 'Sabor dos Alpes';

DELETE FROM PRODUTOS WHERE CODIGO ='1001000';

DELETE FROM PRODUTOS WHERE TAMANHO = '1 Litro' AND SUBSTRING(DESCRITOR,1,15) = 'Sabor dos Alpes';

SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS;

SELECT CODIGO FROM PRODUTOS WHERE CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS);

DELETE FROM PRODUTOS WHERE CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS);

DELETE A FROM NOTAS A INNER JOIN CLIENTES B ON A.CPF = B.CPF WHERE B.IDADE <= 18;

CREATE TABLE `produtos2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRITOR` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANHO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(50) DEFAULT NULL,
  `PRECO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO produtos2
SELECT * FROM produtos;

UPDATE PRODUTOS2 SET preco_lista =8;

delete from produtos2;

delete from notas;

delete from itens_notas;

start transaction;

SELECT * FROM VENDEDORES;

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;

ROLLBACK;

COMMIT;

START TRANSACTION;
INSERT INTO `vendas_sucos`.`vendedores`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
'99999,
<{NOME: }>,
<{BAIRRO: }>,
<{COMISSAO: }>,
<{DATA_ADMISSAO: }>,
<{FERIAS: }>);
