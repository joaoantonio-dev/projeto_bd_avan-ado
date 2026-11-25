CREATE DATABASE producao;
USE producao;

CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80),
  cidade VARCHAR(60)
);

CREATE TABLE produto (
  id_produto INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80),
  categoria VARCHAR(40),
  preco DECIMAL(10,2)
);

CREATE TABLE venda (
  id_venda INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT,
  data_venda DATE,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_venda (
  id_item INT PRIMARY KEY AUTO_INCREMENT,
  id_venda INT,
  id_produto INT,
  quantidade INT,
  FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO cliente (nome, cidade) VALUES
('Ana', 'João Pessoa'), ('Bruno', 'Cabedelo'), ('Carla', 'Bayeux');

INSERT INTO produto (nome, categoria, preco) VALUES
('Mouse', 'Periféricos', 50.00),
('Teclado', 'Periféricos', 120.00),
('Monitor', 'Telas', 800.00);

INSERT INTO venda (id_cliente, data_venda) VALUES
(1, '2026-11-01'), (2, '2026-11-05'), (3, '2026-12-02');

INSERT INTO item_venda (id_venda, id_produto, quantidade) VALUES
(1, 1, 2), (1, 2, 1), (2, 3, 1), (3, 1, 3);
