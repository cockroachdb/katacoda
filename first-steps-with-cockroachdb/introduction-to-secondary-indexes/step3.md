Now try running a different select query and see how it uses the index:

```shell
EXPLAIN SELECT * FROM users WHERE last_name = 'Cross' AND first_name = 'William';
```{{execute T2}}

You should see from the explain plan that this required the use of a full table scan, which is bad for performance. Create a secondary index to provide the database with a more effficient way of executing this query: 

```sql
CREATE INDEX my_index ON users (last_name, first_name);
```{{execute T2}}

Confirm that the index has been created:

```sql
SHOW INDEXES FROM users;;
```{{execute T2}}

When you run the query again, you should see that it takes advantage of the new index:

```sql
EXPLAIN SELECT * FROM users WHERE last_name = 'Cross' AND first_name = 'William';
```{{execute T2}}
