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
