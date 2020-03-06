CREATE TABLE cliente 
(
	id SERIAL NOT NULL,
	nome_razao_social VARCHAR(200),
	nome_fantasia VARCHAR(200),
	cpf_cnpj VARCHAR(20),
	rg_ie VARCHAR(20),
	pessoa VARCHAR(20) NOT NULL,
	situacao VARCHAR(20) NOT NULL,
	data_cadastro timestamp without time zone NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY (id)
);
	
	