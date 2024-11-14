CREATE TABLE funcionarios (
    id_funcionario INT,
    nome_funcionario VARCHAR(150),
    cpf_funcionario VARCHAR(14),
    salario_funcionario DECIMAL(10, 2),
    data_admissao DATE,
    data_nascimento DATE
);

INSERT INTO funcionarios VALUES
(1, 'Carlos Souza', '123.456.789-00', 2500.50, '2020-01-15', '1990-05-20'),
(2, 'Juliana Silva', '987.654.321-00', 3000.00, '2021-03-22', '1992-07-10'),
(3, 'Roberto Costa', '159.753.468-00', 3500.75, '2019-08-12', '1988-11-02');

CREATE TABLE departamentos (
    id_departamento INT,
    nome_departamento VARCHAR(100),
    chefe_departamento INT
);

INSERT INTO departamentos VALUES
(1, 'Financeiro', 1),
(2, 'TI', 2),
(3, 'RH', 3);

CREATE TABLE projetos (
    id_projeto INT,
    nome_projeto VARCHAR(200),
    id_departamento INT,
    data_inicio DATE,
    data_fim DATE,
    orcamento DECIMAL(12, 2)
);

INSERT INTO projetos VALUES
(1, 'Projeto A', 1, '2023-01-10', '2023-12-31', 50000.00),
(2, 'Projeto B', 2, '2023-05-15', '2024-06-20', 100000.00),
(3, 'Projeto C', 3, '2023-08-01', '2024-02-28', 75000.00);

CREATE TABLE funcionarios_projetos (
    id_funcionario INT,
    id_projeto INT,
    horas_trabalhadas INT
);

INSERT INTO funcionarios_projetos VALUES
(1, 1, 120),
(2, 2, 160),
(3, 3, 140);

CREATE TABLE vendas (
    id_venda INT,
    id_funcionario INT,
    id_projeto INT,
    valor DECIMAL(12, 2),
    data_venda DATE
);

INSERT INTO vendas VALUES
(1, 1, 1, 15000.00, '2023-01-15'),
(2, 2, 2, 25000.00, '2023-03-22'),
(3, 3, 3, 20000.00, '2023-08-12');

UPDATE funcionarios SET salario_funcionario = 3000.00 WHERE nome_funcionario = 'Carlos Souza';

UPDATE departamentos SET chefe_departamento = 2 WHERE id_departamento = 1;

UPDATE projetos SET orcamento = 55000.00 WHERE id_projeto = 1;

DELETE FROM funcionarios WHERE id_funcionario = 3;

DELETE FROM departamentos WHERE id_departamento = 3;

CREATE VIEW vw_funcionarios_projetos AS
SELECT f.nome_funcionario, p.nome_projeto, fp.horas_trabalhadas
FROM funcionarios f, projetos p, funcionarios_projetos fp
WHERE f.id_funcionario = fp.id_funcionario AND p.id_projeto = fp.id_projeto;

SELECT * FROM vw_funcionarios_projetos;

DELETE FROM vendas WHERE id_venda = 3;

UPDATE vendas SET valor = 22000.00 WHERE id_venda = 2;

CREATE TABLE funcionarios_bonus (
    id_funcionario INT,
    bonus DECIMAL(10, 2),
    data_pagamento DATE
);

INSERT INTO funcionarios_bonus VALUES
(1, 500.00, '2023-12-10'),
(2, 600.00, '2023-12-15'),
(3, 700.00, '2023-12-20');

UPDATE funcionarios_bonus SET bonus = 650.00 WHERE id_funcionario = 2;

CREATE PROCEDURE adicionar_bonus(
    IN p_id_funcionario INT,
    IN p_bonus DECIMAL(10, 2)
)
BEGIN
    INSERT INTO funcionarios_bonus (id_funcionario, bonus, data_pagamento) 
    VALUES (p_id_funcionario, p_bonus, CURDATE());
END;

CALL adicionar_bonus(3, 800.00);

CREATE FUNCTION calcular_media_salario() RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE media DECIMAL(10, 2);
    SELECT AVG(salario_funcionario) INTO media FROM funcionarios;
    RETURN media;
END;

SELECT calcular_media_salario();

CREATE TRIGGER atualizar_salario_funcionario
BEFORE UPDATE ON funcionarios
FOR EACH ROW
BEGIN
    IF NEW.salario_funcionario < 1500.00 THEN
        SET NEW.salario_funcionario = 1500.00;
    END IF;
END;

CREATE INDEX idx_nome_funcionario ON funcionarios(nome_funcionario);

CREATE TABLE logs (
    id_log INT,
    descricao_log TEXT,
    data_log DATETIME
);

INSERT INTO logs VALUES
(1, 'Salário atualizado para Carlos Souza', '2023-12-01 08:00:00'),
(2, 'Departamento de TI alterado', '2023-12-02 09:00:00'),
(3, 'Venda realizada', '2023-12-03 10:00:00');
