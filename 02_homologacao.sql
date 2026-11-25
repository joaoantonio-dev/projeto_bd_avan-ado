CREATE SCHEMA homologacao;

CREATE TABLE homologacao.dim_cliente (
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(80)
);

CREATE TABLE homologacao.dim_produto (
  id_produto INT PRIMARY KEY,
  nome VARCHAR(80)
);

CREATE TABLE homologacao.fato_vendas (
  id_venda INT PRIMARY KEY,
  id_cliente INT REFERENCES homologacao.dim_cliente(id_cliente),
  id_produto INT REFERENCES homologacao.dim_produto(id_produto),
  data_venda DATE,
  quantidade INT,
  valor_total NUMERIC(10,2)
);

CREATE VIEW producao.vw_dim_cliente AS
SELECT id_cliente, nome FROM producao.cliente;

CREATE VIEW producao.vw_dim_produto AS
SELECT id_produto, nome FROM producao.produto;

CREATE VIEW producao.vw_fato_vendas AS
SELECT v.id_venda, v.id_cliente, v.id_produto, v.data_venda, v.quantidade, v.quantidade * p.preco AS valor_total
FROM producao.venda v
JOIN producao.produto p ON p.id_produto = v.id_produto;

INSERT INTO homologacao.dim_cliente SELECT * FROM producao.vw_dim_cliente;
INSERT INTO homologacao.dim_produto SELECT * FROM producao.vw_dim_produto;
INSERT INTO homologacao.fato_vendas SELECT * FROM producao.vw_fato_vendas;
