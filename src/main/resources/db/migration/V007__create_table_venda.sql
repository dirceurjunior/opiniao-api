CREATE TABLE venda (
	id SERIAL NOT NULL,
	data_criacao timestamp without time zone NOT NULL,
	data_venda timestamp without time zone NOT NULL,
	operacao VARCHAR(20) NOT NULL,
	valor_total_com_desconto DECIMAL(10,2),
	valor_total_sem_desconto DECIMAL(10,2) NOT NULL,
	tipo_desconto VARCHAR(20),
	valor_desconto_venda DECIMAL(10,2),
	observacao VARCHAR(100),
		
	cliente_id BIGINT NOT NULL,
	
	mesa_id BIGINT, 
	
	CONSTRAINT pk_venda PRIMARY KEY (id),
	CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	CONSTRAINT fk_mesa FOREIGN KEY (mesa_id) REFERENCES mesa(id)
);

