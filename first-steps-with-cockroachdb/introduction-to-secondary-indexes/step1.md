To get started, you'll create a new table called `users` and insert some data.

```shell
cockroach sql --insecure
```{{execute T2}}

Create the `bank` database:

```sql
CREATE DATABASE bank;
USE bank;
```{{execute T2}}

Create the `users` table:

```sql
CREATE TABLE users (id INT PRIMARY KEY,
                    last_name STRING NOT NULL,
                    first_name STRING NOT NULL,
                    country STRING,
                    city STRING);
```{{execute T2}}

Insert some data into `users`:

```sql
INSERT INTO users (id, last_name, first_name, country, city)
     VALUES (1, 'Cross', 'William', 'USA', 'Jersey City'),
            (2, 'Seldess', 'Jesse', 'USA', 'New York'),
            (3, 'Hirata', 'Lauren', 'USA', 'New York'),
            (4, 'Cross', 'Zachary', 'USA', 'Seattle'),
            (5, 'Shakespeare', 'William', 'UK', 'Stratford-upon-Avon');
```{{execute T2}}

