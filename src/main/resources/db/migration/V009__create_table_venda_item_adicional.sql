CREATE TABLE venda_item_adicional (

	id SERIAL NOT NULL,
	quantidade BIGINT NOT NULL,
	valor_unitario DECIMAL(10,2),
	valor_unitario_com_desconto DECIMAL(10,2),
			
	produto_id BIGINT NOT NULL,	
	venda_item_id BIGINT,
		
	CONSTRAINT pk_venda_item_adicional PRIMARY KEY (id),
	CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES produto (id),
	CONSTRAINT fk_venda_item FOREIGN KEY (venda_item_id) REFERENCES venda_item(id)
		
);

