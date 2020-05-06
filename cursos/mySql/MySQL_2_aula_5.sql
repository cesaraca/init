#Funções de String ou Escalares

#O VÍDEO FUNÇÕES DE STRING FOI PAUSADO EM : 3:40

#Documentação oficial MySQL : https://dev.mysql.com/doc/refman/8.0/en/functions.html

#Simplificação : https://www.w3schools.com/sql/

SELECT LTRIM('             ÓLA') AS RESULTADO;
SELECT RTRIM('OLÁ                        ') AS RESULTADO;
SELECT TRIM('              ÓLA                     ') AS RESULTADO;
SELECT CONCAT('OLÁ', '   ', 'TUDO BEM','?') AS RESULTADO;
SELECT UPPER('olá, tudo bem?');
SELECT SUBSTRING('OLÁ, TUDO BEM?',6) AS RESULTADO;
SELECT SUBSTRING('OLÁ, TUDO BEM?',6,4) AS RESULTADO;
SELECT CONCAT(NOME,' (', CPF,')') AS RESULTADO FROM tabela_de_clientes;

DESCRIBE tabela_de_clientes;

SELECT CONCAT(NOME, ', ESTADO: ',ESTADO, ', CIDADE: ', CIDADE, ', BAIRRO: ',BAIRRO, ', ENDEREÇO: ', ENDERECO_1) AS RESULTADO FROM tabela_de_clientes;

#FUNÇÕES DE DATA

SELECT CURDATE();
SELECT CURRENT_TIME();
SELECT CURRENT_TIMESTAMP();
SELECT YEAR(CURRENT_TIMESTAMP());
SELECT MONTHNAME(CURRENT_TIMESTAMP());
SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2020-01-01') AS RESULTADO;
SELECT DATEDIFF(CURRENT_TIMESTAMP(),'1997-04-20');
SELECT DATE_SUB(current_timestamp(), INTERVAL 5 DAY) AS RESULTADO;
SELECT DISTINCT DATA_VENDA, DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MES, YEAR(DATA_VENDA) AS ANO FROM NOTAS_FISCAIS;

SELECT DISTINCT NOME, TIMESTAMPDIFF(YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE FROM tabela_de_clientes;

#Funções matemáticas

SELECT (23+((25-2)/2)*45) AS RESULTADO;

SELECT CEILING(12.33) AS RESULTADO;

SELECT ROUND( 12.50) AS RESULTADO;

SELECT FLOOR (12.33) AS RESULTADO;

SELECT RAND() AS RESULTADO;

SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE * PRECO AS FATURAMENTO FROM itens_notas_fiscais;

SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO FROM itens_notas_fiscais;

DESCRIBE notas_fiscais;

DESCRIBE itens_notas_fiscais;

SELECT YEAR(DATA_VENDA) AS ANO, FLOOR(SUM(IMPOSTO*(QUANTIDADE*PRECO))) FROM itens_notas_fiscais A INNER JOIN notas_fiscais B ON 
A.NUMERO = B.NUMERO GROUP BY ANO HAVING ANO = 2016;

SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

#Conversão de dados

SELECT current_timestamp() AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', CURRENT_TIMESTAMP()) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%m%y')) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%Y')) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%y')) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%c%y')) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%c/%y')) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y')) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y')) AS RESULTADO;

SELECT CONCAT('O dia de hoje é ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y - %U')) AS RESULTADO;

SELECT CONVERT(23.3, CHAR) AS RESULTADO;

SELECT SUBSTRING(CONVERT (23.3, CHAR),1,1) AS RESULTADO;

DESCRIBE tabela_de_clientes;
DESCRIBE itens_notas_fiscais;
DESCRIBE notas_fiscais;

SELECT CPF, FATURAMENTO FROM 
(SELECT SUM(QUANTIDADE * PRECO) AS FATURAMENTO, NUMERO AS N1 FROM itens_notas_fiscais GROUP BY N1) A
INNER JOIN
(SELECT CPF, NUMERO AS N2  FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF) B
 ON N1 = N2 GROUP BY CPF;

SELECT CONCAT( 'O cliente ', NOME, ' faturou ', FATURAMENTO ,' no ano de 2016 ') AS RESUMO FROM (SELECT CPF, FATURAMENTO FROM 
(SELECT ROUND(SUM(QUANTIDADE * PRECO),2) AS FATURAMENTO, NUMERO AS N1 FROM itens_notas_fiscais GROUP BY N1) A
INNER JOIN
(SELECT CPF, NUMERO AS N2  FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF) B
 ON N1 = N2 GROUP BY CPF) C INNER JOIN tabela_de_clientes D ON C.CPF = D.CPF GROUP BY NOME;

