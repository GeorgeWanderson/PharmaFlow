-- Adiciona coluna 'categoria' na tabela 'medicamentos' para classificar os medicamentos (ex: analgésico, antibiótico, etc.)
ALTER TABLE medicamentos
ADD COLUMN categoria VARCHAR(50);

-- Adiciona coluna 'status' na tabela 'clientes' para indicar se o cliente está ativo ou inativo
ALTER TABLE clientes
ADD COLUMN status VARCHAR(20) DEFAULT 'ativo';

-- Adiciona coluna 'data_atualizacao' na tabela 'pedidos' para registrar a última atualização do pedido
ALTER TABLE pedidos
ADD COLUMN data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Adiciona coluna 'data_fabricacao' na tabela 'medicamentos' para registrar a data de fabricação dos medicamentos
ALTER TABLE medicamentos
ADD COLUMN data_fabricacao DATE;

-- Adiciona coluna 'data_entrega' na tabela 'pedidos' para registrar a data prevista de entrega
ALTER TABLE pedidos
ADD COLUMN data_entrega DATE;

-- Adiciona coluna 'tipo_contato' na tabela 'fornecedores' para indicar o tipo de contato preferencial (ex: email, telefone)
ALTER TABLE fornecedores
ADD COLUMN tipo_contato VARCHAR(20) DEFAULT 'email';

-- Adiciona coluna 'prioridade' na tabela 'itens_pedido' para identificar a prioridade de entrega dos itens (ex: alta, média, baixa)
ALTER TABLE itens_pedido
ADD COLUMN prioridade VARCHAR(10) DEFAULT 'média';
