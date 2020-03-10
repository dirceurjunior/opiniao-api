CREATE TABLE usuario (
	id SERIAL NOT NULL,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(150) NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY (id)
);

CREATE TABLE permissao (
	id SERIAL NOT NULL,
	descricao VARCHAR(50) NOT NULL,
	CONSTRAINT pk_permissao PRIMARY KEY (id)
);

CREATE TABLE usuario_permissao (
	usuario_id BIGINT NOT NULL,
	permissao_id BIGINT NOT NULL,
	CONSTRAINT pk_usuario_permissao PRIMARY KEY (usuario_id, permissao_id),
	CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
	CONSTRAINT fk_permissao FOREIGN KEY (permissao_id) REFERENCES permissao(id)
);

INSERT INTO usuario (id, nome, email, senha) values (1, 'Administrador', 'admin@algamoney.com', '$2a$10$X607ZPhQ4EgGNaYKt3n4SONjIv9zc.VMWdEuhCuba7oLAL5IvcL5.');
INSERT INTO usuario (id, nome, email, senha) values (2, 'Maria Silva', 'maria@algamoney.com', '$2a$10$Zc3w6HyuPOPXamaMhh.PQOXvDnEsadztbfi6/RyZWJDzimE8WQjaq');

INSERT INTO permissao (id, descricao) values (1, 'ROLE_CADASTRAR_CATEGORIA');
INSERT INTO permissao (id, descricao) values (2, 'ROLE_PESQUISAR_CATEGORIA');

INSERT INTO permissao (id, descricao) values (3, 'ROLE_CADASTRAR_PESSOA');
INSERT INTO permissao (id, descricao) values (4, 'ROLE_REMOVER_PESSOA');
INSERT INTO permissao (id, descricao) values (5, 'ROLE_PESQUISAR_PESSOA');

INSERT INTO permissao (id, descricao) values (6, 'ROLE_CADASTRAR_LANCAMENTO');
INSERT INTO permissao (id, descricao) values (7, 'ROLE_REMOVER_LANCAMENTO');
INSERT INTO permissao (id, descricao) values (8, 'ROLE_PESQUISAR_LANCAMENTO');


INSERT INTO permissao (id, descricao) values (9, 'ROLE_CADASTRAR_PRODUTO');
INSERT INTO permissao (id, descricao) values (10, 'ROLE_REMOVER_PRODUTO');
INSERT INTO permissao (id, descricao) values (11, 'ROLE_PESQUISAR_PRODUTO');

INSERT INTO permissao (id, descricao) values (15, 'ROLE_CADASTRAR_PRODUTO');
INSERT INTO permissao (id, descricao) values (16, 'ROLE_REMOVER_PRODUTO');
INSERT INTO permissao (id, descricao) values (17, 'ROLE_PESQUISAR_PRODUTO');

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

INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 15);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 16);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (1, 17);

-- maria
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (2, 2);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (2, 5);
INSERT INTO usuario_permissao (usuario_id, permissao_id) values (2, 8);