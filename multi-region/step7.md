All of the tables except `promo_codes` are geographically specific, and updated very frequently. For these tables, the right table locality for optimizing access to their data is [`REGIONAL BY ROW`](https://www.cockroachlabs.com/docs/v21.1/multiregion-overview.html#regional-by-row-tables).

Apply this table locality to the remaining tables. These statements use a `CASE` statement to put data for a given city in the right region and can take some time to run since the cluster is under load.

`rides`:

```sql
ALTER TABLE rides ADD COLUMN region crdb_internal_region AS (
  CASE WHEN city = 'amsterdam' THEN 'europe-west1'
       WHEN city = 'paris' THEN 'europe-west1'
       WHEN city = 'rome' THEN 'europe-west1'
       WHEN city = 'new york' THEN 'us-east1'
       WHEN city = 'boston' THEN 'us-east1'
       WHEN city = 'washington dc' THEN 'us-east1'
       WHEN city = 'san francisco' THEN 'us-west1'
       WHEN city = 'seattle' THEN 'us-east1'
       WHEN city = 'los angeles' THEN 'us-east1'
  END
) STORED;
ALTER TABLE rides ALTER COLUMN REGION SET NOT NULL;
ALTER TABLE rides SET LOCALITY REGIONAL BY ROW AS "region";
```{{execute T1}}

`user_promo_codes`:

```sql
ALTER TABLE user_promo_codes ADD COLUMN region crdb_internal_region AS (
  CASE WHEN city = 'amsterdam' THEN 'europe-west1'
       WHEN city = 'paris' THEN 'europe-west1'
       WHEN city = 'rome' THEN 'europe-west1'
       WHEN city = 'new york' THEN 'us-east1'
       WHEN city = 'boston' THEN 'us-east1'
       WHEN city = 'washington dc' THEN 'us-east1'
       WHEN city = 'san francisco' THEN 'us-west1'
       WHEN city = 'seattle' THEN 'us-east1'
       WHEN city = 'los angeles' THEN 'us-east1'
  END
) STORED;
ALTER TABLE user_promo_codes ALTER COLUMN REGION SET NOT NULL;
ALTER TABLE user_promo_codes SET LOCALITY REGIONAL BY ROW AS "region";
```{{execute T1}}

`users`:

```sql
ALTER TABLE users ADD COLUMN region crdb_internal_region AS (
  CASE WHEN city = 'amsterdam' THEN 'europe-west1'
       WHEN city = 'paris' THEN 'europe-west1'
       WHEN city = 'rome' THEN 'europe-west1'
       WHEN city = 'new york' THEN 'us-east1'
       WHEN city = 'boston' THEN 'us-east1'
       WHEN city = 'washington dc' THEN 'us-east1'
       WHEN city = 'san francisco' THEN 'us-west1'
       WHEN city = 'seattle' THEN 'us-east1'
       WHEN city = 'los angeles' THEN 'us-east1'
  END
) STORED;
ALTER TABLE users ALTER COLUMN REGION SET NOT NULL;
ALTER TABLE users SET LOCALITY REGIONAL BY ROW AS "region";
```{{execute T1}}

`vehicle_location_histories`:

```sql
ALTER TABLE vehicle_location_histories ADD COLUMN region crdb_internal_region AS (
  CASE WHEN city = 'amsterdam' THEN 'europe-west1'
       WHEN city = 'paris' THEN 'europe-west1'
       WHEN city = 'rome' THEN 'europe-west1'
       WHEN city = 'new york' THEN 'us-east1'
       WHEN city = 'boston' THEN 'us-east1'
       WHEN city = 'washington dc' THEN 'us-east1'
       WHEN city = 'san francisco' THEN 'us-west1'
       WHEN city = 'seattle' THEN 'us-east1'
       WHEN city = 'los angeles' THEN 'us-east1'
  END
) STORED;
ALTER TABLE vehicle_location_histories ALTER COLUMN REGION SET NOT NULL;
ALTER TABLE vehicle_location_histories SET LOCALITY REGIONAL BY ROW AS "region";
```{{execute T1}}

`vehicles`:

```sql
ALTER TABLE vehicles ADD COLUMN region crdb_internal_region AS (
  CASE WHEN city = 'amsterdam' THEN 'europe-west1'
       WHEN city = 'paris' THEN 'europe-west1'
       WHEN city = 'rome' THEN 'europe-west1'
       WHEN city = 'new york' THEN 'us-east1'
       WHEN city = 'boston' THEN 'us-east1'
       WHEN city = 'washington dc' THEN 'us-east1'
       WHEN city = 'san francisco' THEN 'us-west1'
       WHEN city = 'seattle' THEN 'us-east1'
       WHEN city = 'los angeles' THEN 'us-east1'
  END
) STORED;
ALTER TABLE vehicles ALTER COLUMN REGION SET NOT NULL;
ALTER TABLE vehicles SET LOCALITY REGIONAL BY ROW AS "region";
```{{execute T1}}
