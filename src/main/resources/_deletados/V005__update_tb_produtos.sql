
ALTER TABLE produto 
	ADD COLUMN codigo_barras VARCHAR(30),
	ADD COLUMN caracteristica VARCHAR(200),
	ADD COLUMN dataCadastro timestamp without time zone NOT NULL,
	ADD COLUMN valor_unitario DECIMAL(10,2) NOT NULL,	
	ADD COLUMN tipo_situacao VARCHAR(20) NOT NULL,
	ADD COLUMN categoria_id BIGINT NOT NULL,
	ADD COLUMN unidade_id BIGINT NOT NULL,
	
	ADD CONSTRAINT pk_produto PRIMARY KEY (id),
	ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categoria (id),
	ADD CONSTRAINT fk_unidade FOREIGN KEY (unidade_id) REFERENCES unidade (id);
	
	
