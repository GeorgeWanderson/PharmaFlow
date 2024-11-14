CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL, 
    descricao TEXT, 
    CONSTRAINT chk_nome CHECK (nome != '') 
);

CREATE TABLE medicamentos (
    medicamento_id INT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL, 
    categoria_id INT, 
    preco DECIMAL(10, 2) NOT NULL, 
    estoque INT NOT NULL DEFAULT 0, 
    validade DATE, 
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id) ON DELETE SET NULL,
    CONSTRAINT chk_preco CHECK (preco > 0) 
);

INSERT INTO categorias (categoria_id, nome, descricao) VALUES
(1, 'Antibióticos', 'Medicamentos usados para tratar infecções bacterianas'),
(2, 'Analgésicos', 'Medicamentos usados para aliviar a dor');

INSERT INTO medicamentos (medicamento_id, nome, categoria_id, preco, estoque, validade) VALUES
(1, 'Amoxicilina', 1, 15.99, 100, '2025-12-31'),
(2, 'Paracetamol', 2, 8.50, 200, '2024-06-30');
