select * from tabela_de_vendedores;
select * from notas_fiscais;

select * from tabela_de_vendedores A
inner join notas_fiscais B
on A.matricula = B.matricula;

select a.matricula, a.nome, count(*) from 
tabela_de_vendedores A
inner join notas_fiscais B
on A.matricula = B.matricula
group by a.matricula, a.nome;

select A.matricula, A.nome, count(*) from 
tabela_de_vendedores A, notas_fiscais B
where A.matricula = B.matricula
group by a.matricula, a.nome;

use sucos_vendas;

SELECT 
    a.codigo_do_produto AS 'Código',
    b.nome_do_produto AS 'Nome',
    COUNT(QUANTIDADE) AS 'Quantidade',
    PRECO_DE_LISTA AS 'Preço Unitário',
    COUNT(QUANTIDADE) * PRECO_DE_LISTA AS 'Total Vendas'
FROM
    itens_notas_fiscais a
        INNER JOIN
    tabela_de_produtos b ON a.CODIGO_DO_PRODUTO = b.CODIGO_DO_PRODUTO
GROUP BY a.CODIGO_DO_PRODUTO , b.NOME_DO_PRODUTO;

SELECT
	YEAR(DATA_VENDA) as "Ano",
    COUNT(QUANTIDADE)*PRECO as "Valor"
FROM 
	notas_fiscais NF
		INNER JOIN
	itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

USE SUCOS_VENDAS;

SELECT COUNT(*) FROM tabela_de_clientes;

SELECT CPF, COUNT(8) FROM notas_fiscais GROUP BY CPF;

SELECT DISTINCT
	A.CPF, 
	A.NOME, 
	B.CPF 
FROM 
	tabela_de_clientes A
		INNER JOIN
	notas_fiscais B
ON A.CPF = B.CPF;

SELECT DISTINCT
	A.CPF, 
	A.NOME, 
	B.CPF 
FROM 
	tabela_de_clientes A
		LEFT JOIN
	notas_fiscais B
ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA) = 2015;

SELECT DISTINCT
	A.CPF, 
	A.NOME, 
	B.CPF 
FROM 
	notas_fiscais B
		RIGHT JOIN
	tabela_de_clientes A
ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

SELECT * FROM tabela_de_clientes;

SELECT
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
tabela_de_vendedores.DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
FROM
	tabela_de_vendedores
		INNER JOIN
	tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
tabela_de_vendedores.DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
FROM
	tabela_de_vendedores
		LEFT JOIN
	tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
tabela_de_vendedores.DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
FROM
	tabela_de_vendedores
		RIGHT JOIN
	tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
tabela_de_vendedores.DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
FROM
	tabela_de_vendedores
		CROSS JOIN
	tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT DISTINCT
BAIRRO
FROM
tabela_de_clientes
UNION
SELECT DISTINCT
BAIRRO
FROM
tabela_de_vendedores;

SELECT DISTINCT
BAIRRO,
NOME,
'CLIENTE' AS TIPO
FROM
tabela_de_clientes
UNION
SELECT DISTINCT
BAIRRO, 
NOME,
'VENDEDOR' AS TIPO
FROM
tabela_de_vendedores;

SELECT
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
tabela_de_vendedores.DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
FROM
	tabela_de_vendedores
		LEFT JOIN
	tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT
tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
tabela_de_vendedores.DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
FROM
	tabela_de_vendedores
		RIGHT JOIN
	tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

# SUBCONSULTA:  SELECT X,Y FROM TAB1 WHERE Y IN (SELECT Y FROM TAB2)
# SUBCONSULTA2: SELECT X, SUM(Y) AS NEW_Y FROM TAB1 GROUP BY X; -> SELECT Z.X, Z.NEW_Y FROM (SELECT X, SUM(Y) AS NEW_Y FROM TAB1 GROUP BY X) Z WHERE Z.NEW_Y =3;

SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos GROUP BY EMBALAGEM) X
WHERE X.PRECO_MAXIMO >= 10;

SELECT CPF, X.CONTADOR FROM (SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) X 
WHERE X.CONTADOR > 2000;

#VIEW -> SELECT X, SUM(Y) AS NEW_Y FROM TAB1 GROUP BY X; -> VW_VIEW
# SELECT VM_VIEW.X, TAB3.W FROM VW_VIEW INNER JOIN TAB3 ON VW_VIEW, NEW_Y = TAB3.Y;

SELECT EMBALAGEM, MAIOR_PRECO FROM (VW_MAIORES_EMBALAGEN) WHERE MAIOR_PRECO >=10;

SELECT A.NOME_DO_PRODUTO, A.PRECO_DE_LISTA, A.EMBALAGEM, B.MAIOR_PRECO
FROM tabela_de_produtos A INNER JOIN vw_maiores_embalagen B
ON A.EMBALAGEM = B.EMBALAGEM;