CREATE SCHEMA producao;

CREATE TABLE producao.cliente (
  id_cliente SERIAL PRIMARY KEY,
  nome VARCHAR(80),
  cidade VARCHAR(60)
);

CREATE TABLE producao.produto (
  id_produto SERIAL PRIMARY KEY,
  nome VARCHAR(80),
  categoria VARCHAR(40),
  preco NUMERIC(10,2)
);

CREATE TABLE producao.venda (
  id_venda SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES producao.cliente(id_cliente),
  data_venda DATE
);

CREATE TABLE producao.item_venda (
  id_item SERIAL PRIMARY KEY,
  id_venda INT REFERENCES producao.venda(id_venda),
  id_produto INT REFERENCES producao.produto(id_produto),
  quantidade INT
);

INSERT INTO producao.cliente (nome, cidade) VALUES
('Ana', 'João Pessoa'), ('Bruno', 'Cabedelo'), ('Carla', 'Bayeux');

INSERT INTO producao.produto (nome, categoria, preco) VALUES
('Mouse', 'Periféricos', 50.00),
('Teclado', 'Periféricos', 120.00),
('Monitor', 'Telas', 800.00);

INSERT INTO producao.venda (id_cliente, data_venda) VALUES
(1, '2026-11-01'), (2, '2026-11-05'), (3, '2026-12-02');

INSERT INTO producao.item_venda (id_venda, id_produto, quantidade) VALUES
(1, 1, 2), (1, 2, 1), (2, 3, 1), (3, 1, 3);
