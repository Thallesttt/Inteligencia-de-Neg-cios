CREATE TABLE dim_avaliacao (
                sk_avaliacao SERIAL,
                nk_avaliacao INTEGER NOT NULL,
                nota INTEGER NOT NULL,
                classificacao VARCHAR(10) NOT NULL,
                CONSTRAINT sk_avaliacao PRIMARY KEY (sk_avaliacao)
);


CREATE SEQUENCE dim_cliente_sk_cliente_seq;

CREATE TABLE dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
                sexo VARCHAR(10) NOT NULL,
                dt_nascimento DATE NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


ALTER SEQUENCE dim_cliente_sk_cliente_seq OWNED BY dim_cliente.sk_cliente;

CREATE SEQUENCE dim_pizza_sk_pizza_seq;

CREATE TABLE dim_pizza (
                sk_pizza INTEGER NOT NULL DEFAULT nextval('dim_pizza_sk_pizza_seq'),
                nk_pizza INTEGER NOT NULL,
                sabor VARCHAR(50) NOT NULL,
                preco REAL NOT NULL,
                CONSTRAINT sk_pizza PRIMARY KEY (sk_pizza)
);


ALTER SEQUENCE dim_pizza_sk_pizza_seq OWNED BY dim_pizza.sk_pizza;

CREATE TABLE ft_pedido (
                sk_pizza INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_avaliacao INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dd_hora_pedido TIME NOT NULL,
                dd_codpedido INTEGER NOT NULL,
                md_qtd INTEGER NOT NULL,
                md_desconto INTEGER NOT NULL,
                md_valor_total REAL NOT NULL
);


ALTER TABLE ft_pedido ADD CONSTRAINT dim_data_ft_pedido_fk
FOREIGN KEY (sk_data)
REFERENCES dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_pedido ADD CONSTRAINT dim_avaliacao_ft_pedido_fk
FOREIGN KEY (sk_avaliacao)
REFERENCES dim_avaliacao (sk_avaliacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_pedido ADD CONSTRAINT dim_cliente_ft_pedido_fk
FOREIGN KEY (sk_cliente)
REFERENCES dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_pedido ADD CONSTRAINT dim_pizza_ft_pedido_fk
FOREIGN KEY (sk_pizza)
REFERENCES dim_pizza (sk_pizza)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;