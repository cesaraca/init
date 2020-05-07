USE SUCOS_VENDAS;

call mostra_numero;

call mostra_numero_alias;

call nao_faz_nada;

call ola_mundo;

call sp_com_comentarios;

call alo_mundo2;

call exibe_variavel;

call tipos_dados;

call data_hora_local;

call sem_declaracao;

call mesmo_tipo_dados;

call atribui_valor;

call sp_Exerc01;

USE `sucos_vendas`;
DROP procedure IF EXISTS `manipulacao_dados`;
DELIMITER $$

USE `sucos_vendas`$$
CREATE PROCEDURE `manipulacao_dados` ()
BEGIN
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
     VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
         ('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
         ('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
         ('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
         ('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
         ('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
         ('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
         ('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
         ('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
         ('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
         ('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
         ('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

         SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
         UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

         SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
         DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

         SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
END$$
DELIMITER ;

CALL manipulacao_dados;

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor do Mar';

call inclui_novo_produto;

call Calcula_Idade;

select * from tabela_de_clientes;

call inclui_produto_parametro('4000004', 'Sabor do Pantanal 1 Litro - Melância', 'Melância', '1 Litro', 'PET', 4.76);

call Reajuste_Comissao(0.9);
use sucos_vendas;
call acha_sabor_produto('1013793');

CALL Quantidade_Notas;

SELECT * FROM notas_fiscais;

call cliente_novo_velho('19290992743');

call Testa_Numero_Notas('2015-01-02');

SELECT * FROM TABELA_DE_PRODUTOS;

-- >=12.00 --- CARO
-- >=7 E <= 12 --- EM CONTA
-- < 7 --- BARATO

SELECT PRECO_DE_LISTA FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';

CALL acha_status_preco ('326779');

CALL Comparativo_Vendas('20150101', '20150305');

SELECT SABOR FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';

'Lima/Limão' - 'Cítrico'
'Laranja' - 'Cítrico'
'Morango/Limão' - 'Cítrico'
'Uva' - 'Neutros'
'Morango' - 'Neutros'
'outros' - 'Ácidos'

CALL acha_sabor_produto('1000889');

CALL acha_tipo_sabor('1000889');

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `acha_status_preco_case`(vProduto varchar(50))
BEGIN
	DECLARE vPreco FLOAT;
    DECLARE vMensagem Varchar(30);
    SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos 
    WHERE CODIGO_DO_PRODUTO = vProduto;
    
    CASE
    WHEN vPreco > 12 THEN SET vMensagem = 'Produto Caro';
    WHEN vPreco >= 7 AND vPreco < 12 THEN SET vMensagem = 'Produto em Conta';
    WHEN vPreco < 7 THEN SET vMensagem = 'Produto Barato';
    END CASE;
    SELECT vMensagem;

END$$

DELIMITER ;
;

CALL acha_status_preco_case('1000889');
CALL acha_status_preco('1000889');

CREATE TABLE TB_LOOPING (ID INT);

CALL looping_while(1,10);

call soma_dias_notas('2017-01-01', '2017-01-10');

CALL Soma_Dias_Nots2s;

CALL teste_select_into();

CALL cursor_primeiro_contato;

select nome from tabela_de_clientes limit 4;

CALL cursor_looping;

SET GLOBAL log_bin_trust_function_creators = 1;

SELECT f_acha_tipo_sabor('Laranja');

SELECT NOME_DO_PRODUTO, SABOR FROM TABELA_DE_PRODUTOS;

SELECT NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor(SABOR) AS TIPO FROM TABELA_DE_PRODUTOS;

CALL faturamento_total(2015,1);

SET GLOBAL log_bin_trust_function_creators = 1;

SELECT conta_notas('2015-01-01');

