USE vendas_sucos;

/*
INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
[INTO] tb_name
[PARTITION (partition_name [, partition_name]...)]
[(col_name [,col_name] ...)]
{VALUES / VALUE} (value_list) [, (value_list)] ...
[ON DUPLICATE KEY UPDATE assingment_list]
*/

INSERT INTO PRODUTOS(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA) 
VALUES('1040107', 'Light - 350 ml - Melância', 'Melância', '350 ml', 'Lata', 4.56);

SELECT * FROM PRODUTOS;

INSERT INTO PRODUTOS(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA) 
VALUES('1040108', 'Light - 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00);

INSERT INTO PRODUTOS
VALUES('1040109', 'Light - 350 ml - Açaí', 'Açai', '350 ml', 'Lata', 5.60);

INSERT INTO PRODUTOS
VALUES('1040110', 'Light - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 6.00),
	  ('1040111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50);

INSERT INTO CLIENTES(CPF, NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA)
VALUES 
('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo','SP', '80012212','1990-09-011', 27, 'F', 170000, 24500, 0),
('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa', 'Rio de Janeiro','RJ', '22000000', '2000-02-12', 18, 'M', 100000, 20000, 1),
('2600586709','César Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', 22020001, '2000-03-12', 18, 'M', 120000, 22000, 0);

USE vendas_sucos;

SELECT * FROM sucos_vendas.tabela_de_produtos;

SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR,
EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA AS PRECO_LISTA FROM sucos_vendas.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM produtos);

SELECT CODIGO FROM produtos;

INSERT INTO produtos
SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR,
SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA AS PRECO_LISTA FROM sucos_vendas.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM produtos);

SELECT * FROM produtos;

SELECT * FROM sucos_vendas.tabela_de_clientes;

SELECT CPF, NOME, ENDERECO_1, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA
FROM sucos_vendas.tabela_de_clientes WHERE CPF NOT IN (SELECT CPF FROM vendas_sucos.clientes);

INSERT INTO vendas_sucos.clientes
SELECT CPF, NOME, ENDERECO_1, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA
FROM sucos_vendas.tabela_de_clientes WHERE CPF NOT IN (SELECT CPF FROM vendas_sucos.clientes);

SELECT * FROM vendas_sucos.clientes;

# Inclusão de dados por meio do Form Editor, que aparece quando uma Select de uma tabela é realizado

