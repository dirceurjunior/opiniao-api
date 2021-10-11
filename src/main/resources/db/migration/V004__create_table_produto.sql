CREATE TABLE produto (
    id SERIAL NOT NULL,
    nome character varying(150) NOT NULL,
    codigo_barras VARCHAR(30),
    caracteristica VARCHAR(200),
	data_cadastro timestamp without time zone NOT NULL,
	valor_unitario DECIMAL(10,2) NOT NULL,	
	situacao VARCHAR(20) NOT NULL,
	ingrediente VARCHAR(20) NOT NULL,
	adicional VARCHAR(20) NOT NULL,
	categoria_id BIGINT NOT NULL,
	unidade_id BIGINT NOT NULL,
	
	CONSTRAINT pk_produto PRIMARY KEY (id),
	CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categoria (id),
	CONSTRAINT fk_unidade FOREIGN KEY (unidade_id) REFERENCES unidade (id)
 );
 