Use the `ALTER TABLE` statement to add a `schedule` column of type `STRING` to the `courses` table:

```sql
ALTER TABLE courses ADD COLUMN schedule STRING;
```{{execute T2}}

View the new schema of the `courses` table:

```sql
SHOW CREATE TABLE courses;
```{{execute T2}}
