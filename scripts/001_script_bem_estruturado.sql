-- Criando a tabela de categorias de medicamentos
CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY, -- Chave primária
    nome VARCHAR(255) NOT NULL, -- Nome da categoria
    descricao TEXT, -- Descrição da categoria
    CONSTRAINT chk_nome CHECK (nome != '') -- Garantindo que o nome não seja vazio
);

-- Criando a tabela de medicamentos
CREATE TABLE medicamentos (
    medicamento_id INT PRIMARY KEY, -- Chave primária
    nome VARCHAR(255) NOT NULL, -- Nome do medicamento
    categoria_id INT, -- Chave estrangeira para a tabela de categorias
    preco DECIMAL(10, 2) NOT NULL, -- Preço do medicamento
    estoque INT NOT NULL DEFAULT 0, -- Estoque disponível do medicamento
    validade DATE, -- Data de validade do medicamento
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id) ON DELETE SET NULL,
    CONSTRAINT chk_preco CHECK (preco > 0) -- Garantindo que o preço seja positivo
);

-- Inserindo dados de exemplo nas tabelas
INSERT INTO categorias (categoria_id, nome, descricao) VALUES
(1, 'Antibióticos', 'Medicamentos usados para tratar infecções bacterianas'),
(2, 'Analgésicos', 'Medicamentos usados para aliviar a dor');

INSERT INTO medicamentos (medicamento_id, nome, categoria_id, preco, estoque, validade) VALUES
(1, 'Amoxicilina', 1, 15.99, 100, '2025-12-31'),
(2, 'Paracetamol', 2, 8.50, 200, '2024-06-30');
