Follow the steps below to start 3 instances of MovR. Each instance is pointed at a node in a different region. This will simulate load from that region.

In the SQL shell, create the `movr` database:

```sql
CREATE DATABASE movr;
```{{execute}}

In terminal 2, load the MovR data set. The command options are mostly self-explanatory. We limit the application to 1 thread because using multiple threads quickly overloads this small demo cluster's ability to ingest data. As a result, loading the data takes about 90 seconds on a fast laptop.

```shell
docker run -it --rm cockroachdb/movr:20.11.1 \
    --app-name "movr-load" \
    --url "postgres://root@docker.for.mac.localhost:26257/movr?sslmode=disable" \
    --num-threads 1 \
    load \
    --num-users 100 \
    --num-rides 100 \
    --num-vehicles 10 \
    --city "boston" \
    --city "new york" \
    --city "washington dc" \
    --city="amsterdam" \
    --city="paris" \
    --city="rome" \
    --city="los angeles" \
    --city="san francisco" \
    --city="seattle"
```{{execute T2}}

Still in terminal 2, run MovR in the `us-east` region:

```shell
docker run -it --rm cockroachdb/movr:20.11.1 \
    --app-name "movr-us-east" \
    --url "postgres://root@docker.for.mac.localhost:26257/movr?sslmode=disable" \
    run \
    --city="boston" \
    --city="new york" \
    --city="washington dc"
```{{execute T2}}

In terminal 3, run MovR in the `us-west` region:

```shell
docker run -it --rm cockroachdb/movr:20.11.1 \
    --app-name "movr-us-west" \
    --url "postgres://root@docker.for.mac.localhost:26260/movr?sslmode=disable" \
    run \
    --city="los angeles" \
    --city="san francisco" \
    --city="seattle"
```{{execute T3}}

In terminal 4, run MovR in the `eu-west` region:

```shell
docker run -it --rm cockroachdb/movr:20.11.1 \
   --app-name "movr-eu-west" \
   --url "postgres://root@docker.for.mac.localhost:26264/movr?sslmode=disable" \
   run \
   --city="amsterdam" \
   --city="paris" \
   --city="rome"
```{{execute T4}}
