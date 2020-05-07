#Aplicação prática que cria vendas fictícias

SELECT FLOOR((RAND() * (300-15+1))+15);

SELECT f_numero_aleatorio(1, 10);

CREATE TABLE TABELA_ALEATORIOS(NUMERO INT);

CALL tabelaNumeros;

select count(*) from tabela_de_vendedores;

select f_cliente_aleatorio(), f_produto_aleatorio(), f_vendedor_aleatorio();

call p_inserir_venda('20200507', 20, 100);

SELECT A.NUMERO, count(*) as numero_itens, SUM(B.QUANTIDADE*B.PRECO) AS FATURADO FROM notas_fiscais A inner join itens_notas_fiscais b
on a.numero = b.numero where a.data_venda = '20200507'
group by a.numero;

CREATE TABLE TAB_FATURAMENTO (DATA_VENDA DATE NULL, TOTAL_VENDA FLOAT);

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_INSERT AFTER INSERT ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
	CALL p_calculo_faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_UPDATE AFTER UPDATE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
  CALL p_calculo_faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_DELETE AFTER DELETE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
  CALL p_calculo_faturamento;
END//

CALL p_inserir_venda('20200507', 3, 100);

SELECT * FROM TAB_FATURAMENTO WHERE DATA_VENDA = '20200507';

DROP TRIGGER TG_CALCULA_FATURAMENTO_INSERT;
DROP TRIGGER TG_CALCULA_FATURAMENTO_DELETE;
DROP TRIGGER TG_CALCULA_FATURAMENTO_UPDATE;