
INSERT INTO public.cliente (id, nome_razao_social, nome_fantasia, cpf_cnpj, rg_ie, pessoa, situacao, data_cadastro) 
		VALUES (1, 'DIRCEU ROZOLEM JUNIOR', NULL, '357.005.868-94', NULL, 'FISICA', 'ATIVO', '2020-03-10 03:00:00');
				
INSERT INTO public.produto (id, nome, codigo_barras, caracteristica, data_cadastro, valor_unitario, situacao, ingrediente, adicional, categoria_id, unidade_id) 
	VALUES (2, 'HAMBÚRGUER', '123456789', NULL, '2020-03-10 18:37:40.555', 2.50, 'ATIVO', 'SIM', 'SIM', 6, 1);
INSERT INTO public.produto (id, nome, codigo_barras, caracteristica, data_cadastro, valor_unitario, situacao, ingrediente, adicional, categoria_id, unidade_id) 
	VALUES (1, 'PÃO DE HAMBÚRGUER', '12345679', NULL, '2020-03-10 18:30:46.939', 1.00, 'ATIVO', 'SIM', 'NAO', 6, 1);
INSERT INTO public.produto (id, nome, codigo_barras, caracteristica, data_cadastro, valor_unitario, situacao, ingrediente, adicional, categoria_id, unidade_id)
 	VALUES (3, 'MAIONESE', '9999999999', NULL, '2020-03-10 18:47:12.197', 1.00, 'ATIVO', 'SIM', 'NAO', 6, 1);
INSERT INTO public.produto (id, nome, codigo_barras, caracteristica, data_cadastro, valor_unitario, situacao, ingrediente, adicional, categoria_id, unidade_id) 
	VALUES (4, 'MUSSARELA', '123456789', NULL, '2020-03-10 18:54:41.802', 2.00, 'ATIVO', 'SIM', 'SIM', 6, 1);
INSERT INTO public.produto (id, nome, codigo_barras, caracteristica, data_cadastro, valor_unitario, situacao, ingrediente, adicional, categoria_id, unidade_id) 
	VALUES (5, 'PRESUNTO', '12345679', NULL, '2020-03-10 18:55:15.936', 1.50, 'ATIVO', 'SIM', 'SIM', 6, 1);
INSERT INTO public.produto (id, nome, codigo_barras, caracteristica, data_cadastro, valor_unitario, situacao, ingrediente, adicional, categoria_id, unidade_id) 
	VALUES (6, 'X-BURGUER', '1245679879', 'LANCHE INICIAL', '2020-03-10 18:56:11', 15.00, 'ATIVO', 'NAO', 'NAO', 1, 1);
INSERT INTO public.produto (id, nome, codigo_barras, caracteristica, data_cadastro, valor_unitario, situacao, ingrediente, adicional, categoria_id, unidade_id) 
	VALUES (7, 'BACON', '12345679', NULL, '2020-03-11 20:03:17.556', 3.00, 'ATIVO', 'SIM', 'SIM', 6, 1);
	
INSERT INTO public.produto_ingrediente (produto_id, ingrediente_id) VALUES (6, 2);
INSERT INTO public.produto_ingrediente (produto_id, ingrediente_id) VALUES (6, 1);
INSERT INTO public.produto_ingrediente (produto_id, ingrediente_id) VALUES (6, 4);
INSERT INTO public.produto_ingrediente (produto_id, ingrediente_id) VALUES (6, 5);
INSERT INTO public.produto_ingrediente (produto_id, ingrediente_id) VALUES (6, 3);	

INSERT INTO public.venda (id, data_criacao, data_venda, operacao, valor_total_com_desconto, valor_total_sem_desconto, tipo_desconto, valor_desconto_venda, observacao, cliente_id, mesa_id) 
	VALUES (1, '2020-02-20 18:02:04', '2020-02-20 18:02:04', 'PEDIDO', -1.00, 0.00, 'PORCENTAGEM', 1.00, NULL, 1, 1);

INSERT INTO public.venda_item (id, quantidade, valor_unitario_sem_desconto, valor_unitario_com_desconto, produto_id, venda_id) 
	VALUES (1, 1, 15.00, 15.00, 6, 1);

INSERT INTO public.venda_item_adicional (id, quantidade, valor_unitario, valor_unitario_com_desconto, produto_id, venda_item_id) 
	VALUES (1, 1, 2.50, 2.50, 2, 1);






