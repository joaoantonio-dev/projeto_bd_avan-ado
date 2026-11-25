SELECT c.nome, SUM(f.valor_total) AS total
FROM homologacao.fato_vendas f
JOIN homologacao.dim_cliente c ON c.id_cliente = f.id_cliente
GROUP BY c.nome;
