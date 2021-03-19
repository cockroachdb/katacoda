In a same terminal, create a `crdb_uni` database:

```sql
CREATE DATABASE crdb_uni;
```{{execute T2}}

Set `crdb_uni` as the default database so you don't need to reference it explicitly in statements:

```sql
SET DATABASE = crdb_uni;
```{{execute T2}}
