INSERT INTO permissao (id, descricao) values (18, 'ROLE_CADASTRAR_INGREDIENTE');
INSERT INTO permissao (id, descricao) values (19, 'ROLE_REMOVER_INGREDIENTE');
INSERT INTO permissao (id, descricao) values (20, 'ROLE_PESQUISAR_INGREDIENTE');

-- admin
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 18);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 19);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 20);