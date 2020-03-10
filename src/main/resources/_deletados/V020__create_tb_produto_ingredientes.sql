CREATE TABLE produto_ingredientes (
	produto_id BIGINT NOT NULL,
	ingrediente_id BIGINT NOT NULL,
	CONSTRAINT pk_produto_ingredientes PRIMARY KEY (produto_id, ingrediente_id),
	CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES produto(id),
	CONSTRAINT fk_ingrediente FOREIGN KEY (ingrediente_id) REFERENCES ingrediente(id)
);