CREATE TABLE categoria 
(
    id SERIAL NOT NULL,
    descricao character varying(100) NOT NULL,
    categoria_pai_id bigint,
    CONSTRAINT pk_categoria PRIMARY KEY (id)
);

INSERT INTO categoria (descricao, categoria_pai_id)	VALUES ('Lanches', null);
INSERT INTO categoria (descricao, categoria_pai_id)	VALUES ('Pizzas', null);
INSERT INTO categoria (descricao, categoria_pai_id)	VALUES ('Bebidas', null);
INSERT INTO categoria (descricao, categoria_pai_id)	VALUES ('Refrigerantes', 3);


