Back in the SQL shell, switch to the `movr` database:

```sql
USE movr;
```{{execute T1}}

Then run the following statements to tell CockroachDB about the database's regions. This information is necessary so that CockroachDB can later move data around to optimize access to particular data from particular regions. For more information about how this works at a high level, see [Database Regions](https://www.cockroachlabs.com/docs/v21.1/multiregion-overview.html#database-regions).

```sql
ALTER DATABASE movr PRIMARY REGION "us-east1";
ALTER DATABASE movr ADD REGION "europe-west1";
ALTER DATABASE movr ADD REGION "us-west1";
```{{execute T1}}
