ALTER TABLE venda ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id);
	
CREATE TABLE venda_item (

	id SERIAL NOT NULL,
	quantidade BIGINT NOT NULL,
	valor_unitario_sem_desconto DECIMAL(10,2),
	valor_unitario_com_desconto DECIMAL(10,2),
			
	produto_id BIGINT NOT NULL,
	venda_id BIGINT NOT NULL,
	
	CONSTRAINT pk_venda_item PRIMARY KEY (id),
	CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES produto (id),
	CONSTRAINT fk_venda FOREIGN KEY (venda_id) REFERENCES venda(id)
		
);

