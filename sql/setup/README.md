## Setup

Esta pasta contém os scripts SQL necessários para configurar o banco de dados inicial do projeto farmacêutico. Esses scripts incluem a criação de tabelas, inserção de dados iniciais e a criação de views que facilitam as consultas.

### Estrutura dos Arquivos

Os arquivos de configuração estão organizados em uma ordem lógica de execução:

- **001_create_tables.sql**: Este script cria as tabelas principais do banco de dados, incluindo tabelas para `clientes`, `medicamentos`, `fornecedores`, `pedidos` e `itens_pedido`. Ele define as colunas, tipos de dados e relacionamentos entre as tabelas para criar o esquema básico do sistema.

- **002_insert_initial_data.sql**: Este script insere dados de exemplo nas tabelas criadas, ajudando a iniciar o banco de dados com informações úteis para testes. Ele inclui registros de clientes, medicamentos, fornecedores e exemplos de pedidos, permitindo que o sistema funcione imediatamente para desenvolvimento e teste.

- **003_create_views.sql**: Este script cria views que simplificam consultas comuns ao banco de dados. Ele inclui views como `view_estoque_medicamentos`, que lista os medicamentos com informações de estoque, e `view_historico_pedidos`, que fornece um histórico detalhado de pedidos com informações de clientes.

### Como Executar a Configuração

1. **Preparação do Ambiente**: Certifique-se de ter acesso ao banco de dados onde deseja configurar o sistema e as permissões adequadas para criar tabelas e inserir dados.

2. **Execução dos Scripts**: Recomenda-se executar os scripts na ordem numérica para garantir que o esquema e os dados sejam configurados corretamente. Você pode executar os scripts diretamente em uma ferramenta de gerenciamento de banco de dados ou no terminal SQL.

3. **Ordem de Execução**:
   - Primeiro, execute `001_create_tables.sql` para criar o esquema do banco de dados.
   - Em seguida, execute `002_insert_initial_data.sql` para popular o banco de dados com dados de exemplo.
   - Finalmente, execute `003_create_views.sql` para configurar as views.

### Exemplo de Execução

Para executar um dos scripts de configuração no terminal SQL (exemplo em PostgreSQL):

```sql
\i path/to/001_create_tables.sql
```

Ou, para executar todos os scripts de configuração na ordem correta (verifique a compatibilidade com seu sistema):

```bash
for file in ./setup/*.sql; do psql -U usuario -d banco_de_dados -f "$file"; done
```

### Observações

- **Verificação**: Após a execução dos scripts, é recomendado verificar se as tabelas e os dados foram criados corretamente. Para isso, utilize consultas básicas de `SELECT` em cada tabela.
- **Ambiente de Teste**: Os dados de exemplo incluídos em `002_insert_initial_data.sql` são adequados para ambientes de desenvolvimento e teste. Em um ambiente de produção, você pode optar por não executar esse script ou substituí-lo por dados reais.

### Próximos Passos

Após configurar o banco de dados com esses scripts, você pode começar a usar o banco para desenvolvimento, implementar testes ou realizar migrações adicionais conforme necessário.

---