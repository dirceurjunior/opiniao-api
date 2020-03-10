
INSERT INTO usuario (id, nome, email, senha) values (1, 'Administrador', 'admin@algamoney.com', '$2a$10$X607ZPhQ4EgGNaYKt3n4SONjIv9zc.VMWdEuhCuba7oLAL5IvcL5.');
INSERT INTO usuario (id, nome, email, senha) values (2, 'Maria Silva', 'maria@algamoney.com', '$2a$10$Zc3w6HyuPOPXamaMhh.PQOXvDnEsadztbfi6/RyZWJDzimE8WQjaq');

INSERT INTO permissao (id, descricao) values (1, 'ROLE_CADASTRAR_CATEGORIA');
INSERT INTO permissao (id, descricao) values (2, 'ROLE_PESQUISAR_CATEGORIA');
INSERT INTO permissao (id, descricao) values (3, 'ROLE_PESQUISAR_CATEGORIA');

INSERT INTO permissao (id, descricao) values (4, 'ROLE_CADASTRAR_CLIENTE');
INSERT INTO permissao (id, descricao) values (5, 'ROLE_REMOVER_CLIENTE');
INSERT INTO permissao (id, descricao) values (6, 'ROLE_PESQUISAR_CLIENTE');

INSERT INTO permissao (id, descricao) values (7, 'ROLE_CADASTRAR_PRODUTO');
INSERT INTO permissao (id, descricao) values (8, 'ROLE_REMOVER_PRODUTO');
INSERT INTO permissao (id, descricao) values (9, 'ROLE_PESQUISAR_PRODUTO');

INSERT INTO permissao (id, descricao) values (10, 'ROLE_CADASTRAR_MESA');
INSERT INTO permissao (id, descricao) values (11, 'ROLE_REMOVER_MESA');
INSERT INTO permissao (id, descricao) values (12, 'ROLE_PESQUISAR_MESA');

INSERT INTO permissao (id, descricao) values (13, 'ROLE_CADASTRAR_VENDA');
INSERT INTO permissao (id, descricao) values (14, 'ROLE_REMOVER_VENDA');
INSERT INTO permissao (id, descricao) values (15, 'ROLE_PESQUISAR_VENDA');

-- admin
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 1);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 2);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 3);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 4);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 5);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 6);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 7);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 8);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 9);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 10);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 11);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 12);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 13);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 14);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 15);

-- ------------------------------------------------------------UNIDADES

INSERT INTO unidade (abreviacao, descricao) VALUES ('UN', 'UNIDADE');
INSERT INTO unidade (abreviacao, descricao) VALUES ('LT', 'LITRO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('PC', 'PEÇA');
INSERT INTO unidade (abreviacao, descricao) VALUES ('CX', 'CAIXA');
INSERT INTO unidade (abreviacao, descricao) VALUES ('MT', 'METRO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('M2', 'METRO QUADRADO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('M3', 'METRO CUBICO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('KG', 'QUILOGRAMA');
