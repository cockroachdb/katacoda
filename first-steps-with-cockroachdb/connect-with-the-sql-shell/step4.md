Create a table called `students` with the following columns:

- `id` of type `UUID` (primary key)
- `name` of type `STRING`

```sql
CREATE TABLE students (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name STRING
);
```{{execute T2}}

Create a second table called `courses`, this time with a compound primary key:

```sql
CREATE TABLE courses (
  sys_id UUID DEFAULT gen_random_uuid(),
  course_id INT,
  name STRING,
  PRIMARY KEY (sys_id, course_id)
);
```{{execute T2}}

Use the `SHOW CREATE TABLE` statement to verify the schema of these tables:

```sql
SHOW CREATE TABLE students;
```{{execute T2}}

```sql
SHOW CREATE TABLE courses;
```{{execute T2}}
