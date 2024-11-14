# Projeto Farmacêutico - Sistema de Gestão de Medicamentos

Este projeto SQL visa criar um sistema de banco de dados para uma empresa farmacêutica, focando no gerenciamento de clientes, medicamentos, fornecedores, pedidos e itens de pedidos. O sistema foi projetado para atender às necessidades de uma empresa farmacêutica em relação ao controle de estoque, pedidos de clientes e relacionamento com fornecedores.

## Objetivo do Projeto

O sistema foi criado para oferecer:
- **Gerenciamento de Estoque de Medicamentos**: Controle de quantidades, datas de fabricação e validade dos medicamentos.
- **Gestão de Pedidos e Clientes**: Processamento de pedidos de clientes e histórico de compras.
- **Administração de Fornecedores**: Registro de fornecedores e gerenciamento do contato preferencial.
- **Desempenho Otimizado**: Estrutura de índices para melhorar a eficiência das consultas frequentes.

## Estrutura de Pastas

A estrutura de diretórios está organizada da seguinte forma:

```plaintext
projeto-farmaceutico/
│
├── migrations/
│   ├── 001_add_indexes.sql
│   ├── 002_alter_table_add_column.sql
│   └── ...
│
├── setup/
│   ├── 001_create_tables.sql
│   ├── 002_insert_initial_data.sql
│   └── 003_create_views.sql
│
├── docs/
│   └── data_dictionary.md
│
└── README.md
```

- **`migrations/`**: Contém scripts SQL que realizam migrações, como adicionar índices e colunas ao banco de dados. Útil para modificações e evolução do esquema de dados.
- **`setup/`**: Contém scripts de configuração inicial para criar tabelas, inserir dados iniciais e criar views. Esses scripts são usados para configurar o banco de dados do zero.
- **`docs/`**: Documentação sobre o banco de dados, incluindo o dicionário de dados para detalhar a estrutura e os relacionamentos das tabelas.

## Configuração do Banco de Dados

Para configurar o banco de dados do projeto farmacêutico, siga as etapas abaixo.

### Pré-requisitos

- Um servidor de banco de dados SQL (ex.: PostgreSQL, MySQL).
- Permissões para criar e alterar tabelas no banco de dados.
- Cliente SQL (ex.: `psql` para PostgreSQL, `mysql` para MySQL).

### Passos para Configuração

1. **Criar o Banco de Dados**: Primeiro, crie um banco de dados vazio onde as tabelas serão configuradas.
2. **Executar Scripts de Configuração Inicial**:
   - Execute os scripts na pasta `setup/` na ordem numerada:
     - `001_create_tables.sql`: Cria o esquema inicial de tabelas.
     - `002_insert_initial_data.sql`: Insere dados de exemplo nas tabelas.
     - `003_create_views.sql`: Cria views para simplificar consultas comuns.
3. **Aplicar Migrações**:
   - Depois de configurar as tabelas iniciais, aplique os scripts de migração na pasta `migrations/` para atualizar o banco de dados conforme necessário.
   - Siga a ordem numerada dos scripts para garantir que as alterações sejam aplicadas corretamente.

### Exemplo de Execução

Para executar todos os scripts de configuração em um banco de dados PostgreSQL:

```bash
for file in ./setup/*.sql; do psql -U usuario -d banco_de_dados -f "$file"; done
```

E, para executar os scripts de migração:

```bash
for file in ./migrations/*.sql; do psql -U usuario -d banco_de_dados -f "$file"; done
```

## Documentação

Para obter informações detalhadas sobre a estrutura de dados, consulte o arquivo [data_dictionary.md](docs/data_dictionary.md) na pasta `docs/`. Esse arquivo descreve cada tabela, coluna e relacionamentos entre as tabelas do banco de dados.

## Estrutura das Tabelas

O projeto contém as seguintes tabelas principais:

- **`clientes`**: Armazena informações dos clientes, como nome, email, telefone e status.
- **`medicamentos`**: Contém dados sobre os medicamentos, incluindo estoque, data de fabricação e validade.
- **`fornecedores`**: Armazena informações sobre os fornecedores.
- **`pedidos`**: Registra cada pedido realizado pelos clientes.
- **`itens_pedido`**: Detalha os itens incluídos em cada pedido.

## Considerações Finais

- **Segurança**: Em ambientes de produção, garanta que os dados sejam protegidos e que as permissões de acesso estejam configuradas adequadamente.
- **Backup e Recuperação**: Faça backups regulares do banco de dados, especialmente antes de executar scripts de migração.
- **Testes**: Realize testes após a execução de cada script para verificar se as alterações foram aplicadas corretamente.

## Contribuições

Contribuições são bem-vindas! Se desejar contribuir, por favor, faça um fork do repositório e crie uma branch com suas modificações. Lembre-se de seguir a estrutura de nomeação para novos scripts SQL e documente as mudanças no `README.md` e `data_dictionary.md`.

---