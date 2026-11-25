DROP SCHEMA IF EXISTS homologacao CASCADE;
DROP SCHEMA IF EXISTS producao CASCADE;

CREATE SCHEMA producao;

CREATE TABLE producao.cliente (
  id_cliente SERIAL PRIMARY KEY,
  nome VARCHAR(80)
);

CREATE TABLE producao.produto (
  id_produto SERIAL PRIMARY KEY,
  nome VARCHAR(80),
  preco NUMERIC(10,2)
);

CREATE TABLE producao.venda (
  id_venda SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES producao.cliente(id_cliente),
  id_produto INT REFERENCES producao.produto(id_produto),
  quantidade INT,
  data_venda DATE
);

INSERT INTO producao.cliente (nome) VALUES ('Ana'), ('Bruno');
INSERT INTO producao.produto (nome, preco) VALUES ('Mouse', 50), ('Teclado', 120);
INSERT INTO producao.venda (id_cliente, id_produto, quantidade, data_venda) VALUES
(1, 1, 2, '2026-11-01'),
(1, 2, 1, '2026-11-02'),
(2, 1, 3, '2026-11-05');
