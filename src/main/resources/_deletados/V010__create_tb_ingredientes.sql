CREATE TABLE ingrediente (
    id SERIAL NOT NULL,
    adicional VARCHAR(20) NOT NULL,
    nome character varying(100) NOT NULL,
    valor_de_custo DECIMAL(10,2),
    valor_de_venda DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_ingrediente PRIMARY KEY (id)
);

