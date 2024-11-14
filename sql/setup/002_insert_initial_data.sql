-- Dados de exemplo para clientes
INSERT INTO clientes (cliente_id, nome, email, telefone, endereco) VALUES
(1, 'Farmácia Vida', 'contato@farmaciavida.com', '123456789', 'Rua das Flores, 100'),
(2, 'Distribuidora Saúde', 'atendimento@distribuidorasaude.com', '987654321', 'Avenida Central, 200');

-- Dados de exemplo para medicamentos
INSERT INTO medicamentos (medicamento_id, nome, descricao, preco, estoque, data_validade) VALUES
(1, 'Paracetamol', 'Analgésico e antitérmico', 12.50, 200, '2025-05-01'),
(2, 'Ibuprofeno', 'Anti-inflamatório', 18.00, 150, '2024-12-31');

-- Dados de exemplo para fornecedores
INSERT INTO fornecedores (fornecedor_id, nome, telefone, email, endereco) VALUES
(1, 'Fornecedor ABC', '99998888', 'abc@fornecedor.com', 'Rua dos Insumos, 300'),
(2, 'Fornecedor XYZ', '88887777', 'xyz@fornecedor.com', 'Avenida dos Medicamentos, 400');
