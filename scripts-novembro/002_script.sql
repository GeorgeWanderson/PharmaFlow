-- Consulta que poderia causar bloqueios em tabelas grandes sem o uso de NOLOCK
SELECT f.id_funcionario, f.nome_funcionario, f.salario_funcionario, p.nome_projeto, v.valor
FROM funcionarios f
INNER JOIN funcionarios_projetos fp ON f.id_funcionario = fp.id_funcionario
INNER JOIN projetos p ON fp.id_projeto = p.id_projeto
INNER JOIN vendas v ON v.id_funcionario = f.id_funcionario
WHERE f.salario_funcionario > 2500
AND p.data_inicio < '2023-01-01'
AND v.data_venda > '2023-01-01';

-- Atualização de dados sem controle de bloqueio
UPDATE funcionarios
SET salario_funcionario = salario_funcionario + 500
WHERE id_funcionario IN (SELECT id_funcionario FROM funcionarios_projetos WHERE id_projeto = 1);

-- Inserção de dados sem controle de bloqueio
INSERT INTO vendas (id_funcionario, id_projeto, valor, data_venda)
VALUES (2, 2, 20000.00, '2023-02-01');
