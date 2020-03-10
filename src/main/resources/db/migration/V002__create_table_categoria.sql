CREATE TABLE categoria 
(
    id SERIAL NOT NULL,
    descricao character varying(100) NOT NULL,
    categoria_pai_id bigint,
    CONSTRAINT pk_categoria PRIMARY KEY (id)
);



