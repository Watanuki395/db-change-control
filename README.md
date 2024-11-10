# db-change-control



.
├── changelogs/
│   ├── phases/
│   │   ├── phase1-sprint-2/
│   │   │   ├── squad1/
│   │   │   │   ├── alter_table_adding_column_colname.sql
│   │   │   ├── squad2/
│   │   │   │   └── create_table_new_entity.sql
│   │   │   ├── changelog-phase1-sprint-2.yaml
│   │   └── phase2-sprint-3/
│   │       ├── squad1/
│   │       │   ├── update_table_modifying_column_colname.sql
│   │       ├── changelog-phase2-sprint-3.yaml
│   ├── immutable/
│   │   ├── 2023-10-05_initial_schema.sql
│   │   └── 2023-10-10_data_population.sql
│   ├── mutable/
│   │   ├── views/
│   │   └── create_or_replace_view_my_view.sql
│   ├── functions/
│   │   └── create_or_replace_function_my_function.sql
│   └── changelog-master.yaml
└── sql/
│    ├── hotfixes/
│    │   └── 20241018.sql
│    ├── backup/
│    │   ├── backup_scripts/
│    │   └── bk-script-v1.sql



databaseChangeLog:
  - include:
      file: changelogs/phases/phase1-sprint-2/changelog-phase1-sprint-2.yaml
  - include:
      file: changelogs/phases/phase2-sprint-3/changelog-phase2-sprint-3.yaml



databaseChangeLog:  
  - changeSet:
      id: create-clients-table
      author: gesalas
      labels: squad-1
      context: development
      changes:
        - sqlFile:
            path:  squad1/tables/clients_tb_creation.sql
            relativeToChangelogFile: true
        - tagDatabase:
            tag: phase15-sprint1

  - changeSet:
      id: create-insert-user-fn
      author: johnsmith
      labels: squad-2
      context: development
      runOnChange: true
      changes:
        - sqlFile:
            path: ../../mutables/functions/fn_insert_or_update_client.sql
            relativeToChangelogFile: true
            splitStatements: false
            stripComments: true
        - tagDatabase:
            tag: phase15-sprint1
            
  - changeSet:
      id: alter-roles-tb-adding-description-col
      author: gesalas
      labels: squad-1
      changes:
        - sqlFile:
            path:  squad1/alter_roles_tb_adding_description_col.sql
            relativeToChangelogFile: true





sql/
├── V1__initial_schema.sql
├── V2__add_column_to_users.sql
├── V3__modify_orders_table.sql
└── R__refresh_views.sql


[sqlfluff]
dialect = postgres           # Especifica el dialecto SQL usado (PostgreSQL)
max_line_length = 120        # Longitud máxima de línea de código
exclude_rules = L009         # Excluye reglas específicas que no son relevantes
tab_space_size = 4           # Tamaño de la tabulación (4 espacios)
indent_unit = space          # Define el uso de espacios para la indentación



repos:
  - repo: https://github.com/sqlfluff/sqlfluff
    rev: v1.0.0  # Versión de SQLFluff
    hooks:
      - id: sqlfluff-lint
        args: ["--dialect", "postgres"]
      - id: sqlfluff-fix
        args: ["--dialect", "postgres"]
