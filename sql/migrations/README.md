## Migrations

Esta pasta contém scripts de migração SQL para o projeto farmacêutico. Esses scripts realizam alterações no esquema de banco de dados, como a adição de colunas, índices e modificações de tabelas, de forma a garantir que a estrutura do banco atenda às necessidades do sistema em constante evolução.

### Estrutura dos Arquivos

Cada arquivo de migração é numerado sequencialmente para facilitar o rastreamento e a ordem de execução. Abaixo está uma descrição de cada arquivo de migração:

- **001_add_indexes.sql**: Este script adiciona índices às tabelas principais para melhorar o desempenho de consultas comuns. Índices foram adicionados em colunas usadas frequentemente em `JOINs` e filtros `WHERE`, como IDs de clientes, medicamentos e datas de pedidos.

- **002_alter_table_add_column.sql**: Este script adiciona novas colunas às tabelas para atender a novos requisitos de negócios. As colunas incluem campos como `categoria` em `medicamentos`, `status` em `clientes`, `data_entrega` em `pedidos`, entre outros, fornecendo mais informações sobre os dados e facilitando novas funcionalidades, como rastreio de data de fabricação e prioridade de entrega.

### Como Executar as Migrações

1. Certifique-se de ter acesso ao banco de dados e permissões adequadas para modificar o esquema.
2. Recomenda-se que as migrações sejam executadas na ordem numérica dos arquivos para evitar conflitos de dependência.
3. Execute cada script de migração individualmente no ambiente de banco de dados, ou utilize uma ferramenta de versionamento de banco de dados que possa automatizar esse processo.

### Considerações sobre Migração

- **Backup**: É altamente recomendável fazer backup do banco de dados antes de executar qualquer script de migração, especialmente em ambientes de produção.
- **Testes**: Após cada migração, realize testes para garantir que as alterações funcionaram conforme o esperado e que o banco de dados está funcionando corretamente.
- **Ordem de Execução**: Siga a ordem de numeração dos arquivos para garantir a integridade do esquema do banco de dados.

### Exemplo de Execução

No terminal do seu banco de dados, execute um dos scripts de migração da seguinte forma (exemplo em PostgreSQL):

```sql
\i path/to/001_add_indexes.sql
```

Ou, para executar todos os scripts de uma vez (verifique a compatibilidade com seu sistema):

```bash
for file in ./migrations/*.sql; do psql -U usuario -d banco_de_dados -f "$file"; done
```

### Futuras Migrações

Novas migrações deverão ser adicionadas seguindo a mesma convenção de numeração e nomeação para garantir um processo organizado e padronizado. Ao criar novos scripts, siga a sequência de numeração e documente cada alteração neste arquivo `README.md`.

---
