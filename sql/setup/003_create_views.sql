-- View para ver o estoque de medicamentos
CREATE VIEW view_estoque_medicamentos AS
SELECT 
    medicamento_id,
    nome,
    estoque
FROM medicamentos;

-- View para ver o histórico de pedidos com detalhes
CREATE VIEW view_historico_pedidos AS
SELECT 
    p.pedido_id,
    c.nome AS cliente,
    p.data_pedido,
    p.valor_total,
    p.status
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id;
