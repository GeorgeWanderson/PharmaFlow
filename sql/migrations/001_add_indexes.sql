-- Índice para melhorar a busca por ID do cliente na tabela de pedidos
CREATE INDEX idx_pedidos_cliente_id ON pedidos (cliente_id);

-- Índice para melhorar a busca por medicamento em itens de pedidos
CREATE INDEX idx_itens_pedido_medicamento_id ON itens_pedido (medicamento_id);

-- Índice para melhorar a busca de pedidos por data
CREATE INDEX idx_pedidos_data_pedido ON pedidos (data_pedido);

-- Índice para melhorar consultas por estoque crítico em medicamentos
CREATE INDEX idx_medicamentos_estoque ON medicamentos (estoque);

-- Índice para melhorar consultas por data de validade de medicamentos
CREATE INDEX idx_medicamentos_data_validade ON medicamentos (data_validade);

-- Índice para melhorar consultas de fornecedores por nome
CREATE INDEX idx_fornecedores_nome ON fornecedores (nome);

-- Índice para melhorar a busca de clientes por e-mail
CREATE INDEX idx_clientes_email ON clientes (email);

-- Índice para melhorar a busca de medicamentos por nome
CREATE INDEX idx_medicamentos_nome ON medicamentos (nome);
