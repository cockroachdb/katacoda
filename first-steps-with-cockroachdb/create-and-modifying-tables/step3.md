In the same terminal, open the built-in SQL shell:

```shell
cockroach sql --insecure
```{{execute T2}}

View the available databases:

```sql
SHOW DATABASES;
```{{execute T2}}

View the tables in the `movr` database:

```sql
SHOW TABLES FROM movr;
```{{execute T2}}

Run a `SELECT` statement to get 10 rows from the `movr.users` table:

```sql
SELECT * FROM movr.users LIMIT 10;
```{{execute T2}}
