-- Edge Case 1: Verificar medicamentos com estoque crítico (menos de 10 unidades)
SELECT 
    medicamento_id, 
    nome, 
    estoque 
FROM 
    medicamentos
WHERE 
    estoque < 10;

-- Edge Case 2: Verificar medicamentos que estão vencidos
SELECT 
    medicamento_id, 
    nome, 
    data_validade 
FROM 
    medicamentos
WHERE 
    data_validade < CURRENT_DATE;

-- Edge Case 3: Consultar clientes com informações incompletas (sem e-mail ou telefone)
SELECT 
    cliente_id, 
    nome, 
    email, 
    telefone 
FROM 
    clientes
WHERE 
    email IS NULL OR telefone IS NULL;

-- Edge Case 4: Verificar pedidos com valor total anormal (acima de R$ 10.000,00)
SELECT 
    pedido_id, 
    cliente_id, 
    valor_total, 
    data_pedido 
FROM 
    pedidos
WHERE 
    valor_total > 10000;

-- Edge Case 5: Pedidos com itens duplicados (mesmo medicamento em mais de um item)
SELECT 
    pedido_id, 
    medicamento_id, 
    COUNT(*) AS qtd_itens 
FROM 
    itens_pedido
GROUP BY 
    pedido_id, medicamento_id
HAVING 
    COUNT(*) > 1;

-- Edge Case 6: Verificar pedidos sem itens associados
SELECT 
    p.pedido_id, 
    p.cliente_id, 
    p.data_pedido 
FROM 
    pedidos p
LEFT JOIN 
    itens_pedido i ON p.pedido_id = i.pedido_id
WHERE 
    i.item_id IS NULL;

-- Edge Case 7: Verificar pedidos com quantidade de itens muito alta (mais de 100 unidades em um item)
SELECT 
    pedido_id, 
    medicamento_id, 
    quantidade 
FROM 
    itens_pedido
WHERE 
    quantidade > 100;

-- Edge Case 8: Verificar medicamentos sem pedidos relacionados (nunca vendidos)
SELECT 
    m.medicamento_id, 
    m.nome 
FROM 
    medicamentos m
LEFT JOIN 
    itens_pedido i ON m.medicamento_id = i.medicamento_id
WHERE 
    i.item_id IS NULL;

-- Edge Case 9: Clientes com múltiplos pedidos no mesmo dia (possível duplicidade de pedido)
SELECT 
    cliente_id, 
    COUNT(*) AS qtd_pedidos, 
    DATE(data_pedido) AS data_pedido 
FROM 
    pedidos
GROUP BY 
    cliente_id, DATE(data_pedido)
HAVING 
    COUNT(*) > 1;

-- Edge Case 10: Medicamentos com preço muito alto (acima de R$ 5.000,00)
SELECT 
    medicamento_id, 
    nome, 
    preco 
FROM 
    medicamentos
WHERE 
    preco > 5000;
