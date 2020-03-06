INSERT INTO permissao (id, descricao) values (24, 'ROLE_CADASTRAR_VENDA');
INSERT INTO permissao (id, descricao) values (25, 'ROLE_REMOVER_VENDA');
INSERT INTO permissao (id, descricao) values (26, 'ROLE_PESQUISAR_VENDA');

-- admin
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 24);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 25);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 26);