CREATE TABLE unidade (
    id SERIAL NOT NULL,
    abreviacao VARCHAR(10) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    CONSTRAINT pk_unidade PRIMARY KEY (id)
);

