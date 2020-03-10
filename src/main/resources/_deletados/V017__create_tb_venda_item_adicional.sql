CREATE TABLE venda_item_adicional (

	id SERIAL NOT NULL,
	quantidade BIGINT NOT NULL,
	valor_unitario DECIMAL(10,2),
	valor_unitario_com_desconto DECIMAL(10,2),
			
	ingrediente_id BIGINT NOT NULL,		
	venda_item_id BIGINT NOT NULL,
		
	CONSTRAINT pk_venda_item_adicional PRIMARY KEY (id),
	CONSTRAINT fk_ingrediente FOREIGN KEY (ingrediente_id) REFERENCES ingrediente (id),
	CONSTRAINT fk_venda_item FOREIGN KEY (venda_item_id) REFERENCES venda_item(id)
		
);

