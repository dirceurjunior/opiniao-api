INSERT INTO permissao (id, descricao) values (21, 'ROLE_CADASTRAR_CLIENTE');
INSERT INTO permissao (id, descricao) values (22, 'ROLE_REMOVER_CLIENTE');
INSERT INTO permissao (id, descricao) values (23, 'ROLE_PESQUISAR_CLIENTE');

-- admin
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 21);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 22);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 23);