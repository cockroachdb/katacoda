Now that there is some data in the users table, run a simple select query:

```shell
SELECT * FROM users;
```{{execute T2}}

See if there are any existing indexes:

```shell
SHOW INDEXES FROM users;
```{{execute T2}}

Run a `SELECT` statement that takes advantage of the primary key:

```shell
SELECT * FROM users WHERE id = 1;
```{{execute T2}}

Use `EXPLAIN` to see how the database executed the query:

```shell
EXPLAIN SELECT * FROM users WHERE id = 1;
```{{execute T2}}

