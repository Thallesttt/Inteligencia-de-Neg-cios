CREATE SEQUENCE dim_funcionario_sk_funcionario_seq;

CREATE TABLE dim_funcionario (
                sk_funcionario SERIAL,
                nk_funcionario INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
				etl_versao INTEGER NOT NULL,
				etl_dt_inicio DATE NOT NULL,
				etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_funcionario PRIMARY KEY (sk_funcionario)
);


CREATE SEQUENCE dim_cliente_sk_cliente_seq;

CREATE TABLE dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL,
				cpf VARCHAR(50)NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
				data_nascimento DATE NOT NULL,
				data_cadastro DATE NOT NULL,
                sexo VARCHAR(50) NOT NULL,
                numero INT NOT NULL,
                estado VARCHAR(19) NOT NULL,
				municipio VARCHAR(5) NOT NULL,
	            logradouro VARCHAR(5) NOT NULL,
	            bairro VARCHAR(5) NOT NULL,
				etl_versao INTEGER NOT NULL,
				etl_dt_inicio DATE NOT NULL,
				etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


ALTER SEQUENCE dim_cliente_sk_cliente_seq OWNED BY dim_cliente.sk_cliente;

CREATE SEQUENCE dim_produto_sk_produto_seq;

CREATE TABLE dim_produto (
                sk_produto INTEGER NOT NULL DEFAULT nextval('dim_produto_sk_produto_seq'),
                nk_produto INTEGER NOT NULL,
                modelo VARCHAR(50) NOT NULL,
				marca VARCHAR(50)NOT NULL,
				preco DECIMAL(6,2)NOT NULL,
				descricao VARCHAR(26)NOT NULL,
				nome VARCHAR(21) NOT NULL,
				etl_versao INTEGER NOT NULL,
				etl_dt_inicio DATE NOT NULL,
				etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
);


ALTER SEQUENCE dim_produto_sk_produto_seq OWNED BY dim_produto.sk_produto;

CREATE TABLE ft_venda (
                sk_produto INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_funcionario INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dd_hora_venda TIME NOT NULL,
                dd_codvenda INTEGER NOT NULL,
                md_qtd INTEGER NOT NULL,
                md_desconto INTEGER NOT NULL,
                md_valor_total REAL NOT NULL
);


ALTER TABLE ft_venda ADD CONSTRAINT dim_data_ft_venda_fk
FOREIGN KEY (sk_data)
REFERENCES dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_venda ADD CONSTRAINT dim_funcionario_ft_venda_fk
FOREIGN KEY (sk_funcionario)
REFERENCES dim_funcionario (sk_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_venda ADD CONSTRAINT dim_cliente_ft_venda_fk
FOREIGN KEY (sk_cliente)
REFERENCES dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_venda ADD CONSTRAINT dim_produto_ft_venda_fk
FOREIGN KEY (sk_produto)
REFERENCES dim_produto (sk_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;