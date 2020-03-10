INSERT INTO permissao (id, descricao) values (15, 'ROLE_CADASTRAR_PRODUTO');
INSERT INTO permissao (id, descricao) values (16, 'ROLE_REMOVER_PRODUTO');
INSERT INTO permissao (id, descricao) values (17, 'ROLE_PESQUISAR_PRODUTO');

-- admin
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 15);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 16);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 17);