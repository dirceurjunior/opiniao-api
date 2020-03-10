CREATE TABLE unidade (
    id SERIAL NOT NULL,
    abreviacao VARCHAR(10) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    CONSTRAINT pk_unidade PRIMARY KEY (id)
);

INSERT INTO unidade (abreviacao, descricao) VALUES ('UN', 'UNIDADE');
INSERT INTO unidade (abreviacao, descricao) VALUES ('LT', 'LITRO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('PC', 'PEÇA');
INSERT INTO unidade (abreviacao, descricao) VALUES ('CX', 'CAIXA');
INSERT INTO unidade (abreviacao, descricao) VALUES ('MT', 'METRO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('M2', 'METRO QUADRADO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('M3', 'METRO CUBICO');
INSERT INTO unidade (abreviacao, descricao) VALUES ('KG', 'QUILOGRAMA');