# Data Dictionary

Este documento contém a descrição detalhada das tabelas e colunas utilizadas no banco de dados do projeto farmacêutico. Ele serve como um guia para compreender a estrutura e as relações das tabelas no sistema.

## Tabelas

### Tabela `clientes`

| Coluna           | Tipo de Dados | Descrição                                                  |
|------------------|---------------|------------------------------------------------------------|
| `cliente_id`     | INT           | Identificador único para cada cliente.                     |
| `nome`           | VARCHAR(100)  | Nome completo do cliente.                                  |
| `email`          | VARCHAR(100)  | Endereço de e-mail do cliente.                             |
| `telefone`       | VARCHAR(15)   | Número de telefone do cliente.                             |
| `status`         | VARCHAR(20)   | Indica se o cliente está ativo ou inativo.                 |
| `data_cadastro`  | DATE          | Data em que o cliente foi cadastrado no sistema.           |

### Tabela `medicamentos`

| Coluna             | Tipo de Dados | Descrição                                                  |
|--------------------|---------------|------------------------------------------------------------|
| `medicamento_id`   | INT           | Identificador único para cada medicamento.                 |
| `nome`             | VARCHAR(100)  | Nome do medicamento.                                       |
| `categoria`        | VARCHAR(50)   | Categoria do medicamento (ex.: Analgésico, Antibiótico).   |
| `preco`            | DECIMAL(10,2) | Preço unitário do medicamento.                             |
| `estoque`          | INT           | Quantidade disponível em estoque.                          |
| `data_fabricacao`  | DATE          | Data de fabricação do medicamento.                         |
| `data_validade`    | DATE          | Data de validade do medicamento.                           |

### Tabela `fornecedores`

| Coluna           | Tipo de Dados | Descrição                                               |
|------------------|---------------|---------------------------------------------------------|
| `fornecedor_id`  | INT           | Identificador único para cada fornecedor.               |
| `nome`           | VARCHAR(100)  | Nome do fornecedor.                                     |
| `email`          | VARCHAR(100)  | Endereço de e-mail do fornecedor.                       |
| `telefone`       | VARCHAR(15)   | Número de telefone do fornecedor.                       |
| `tipo_contato`   | VARCHAR(20)   | Canal preferencial de contato (ex.: e-mail, telefone).  |
| `endereco`       | VARCHAR(200)  | Endereço completo do fornecedor.                        |

### Tabela `pedidos`

| Coluna             | Tipo de Dados | Descrição                                                 |
|--------------------|---------------|-----------------------------------------------------------|
| `pedido_id`        | INT           | Identificador único para cada pedido.                     |
| `cliente_id`       | INT           | Identificador do cliente associado ao pedido.             |
| `data_pedido`      | DATE          | Data em que o pedido foi realizado.                       |
| `valor_total`      | DECIMAL(10,2) | Valor total do pedido.                                    |
| `data_entrega`     | DATE          | Data prevista para a entrega do pedido.                   |
| `data_atualizacao` | TIMESTAMP     | Data e hora da última atualização do pedido.              |

### Tabela `itens_pedido`

| Coluna           | Tipo de Dados | Descrição                                                |
|------------------|---------------|----------------------------------------------------------|
| `item_id`        | INT           | Identificador único para cada item no pedido.            |
| `pedido_id`      | INT           | Identificador do pedido ao qual o item pertence.         |
| `medicamento_id` | INT           | Identificador do medicamento adicionado ao pedido.       |
| `quantidade`     | INT           | Quantidade do medicamento no pedido.                     |
| `preco_unitario` | DECIMAL(10,2) | Preço unitário do medicamento no momento do pedido.      |
| `prioridade`     | VARCHAR(10)   | Prioridade de entrega do item (ex.: alta, média, baixa). |

## Relacionamentos Entre Tabelas

- **`clientes` e `pedidos`**: A tabela `clientes` se relaciona com `pedidos` através da coluna `cliente_id`, onde cada cliente pode ter múltiplos pedidos.
- **`pedidos` e `itens_pedido`**: A tabela `pedidos` se relaciona com `itens_pedido` por meio da coluna `pedido_id`, com cada pedido podendo ter múltiplos itens.
- **`medicamentos` e `itens_pedido`**: A tabela `medicamentos` se relaciona com `itens_pedido` através da coluna `medicamento_id`, onde cada item de pedido se refere a um medicamento específico.
- **`fornecedores`**: Os fornecedores são independentes, mas fornecem medicamentos, o que poderia ser expandido em um relacionamento futuro caso seja necessário.

## Considerações

- **Integridade Referencial**: As colunas de chave estrangeira (`cliente_id`, `pedido_id`, `medicamento_id`) devem ter restrições para garantir a integridade dos dados.
- **Consistência de Dados**: Os campos `estoque`, `preco` e `data_validade` em `medicamentos` devem ser verificados periodicamente para garantir dados consistentes e atualizados.

Esse dicionário de dados descreve os principais componentes do banco de dados, facilitando o entendimento da estrutura e dos relacionamentos para desenvolvedores, administradores e outros usuários do sistema.

--- 