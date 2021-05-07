Follow the steps below to start 3 instances of MovR. Each instance is pointed at a node in a different region. This will simulate load from that region.

1. In SQL shell in the first terminal, create the `movr` database:

    ```sql
    CREATE DATABASE movr;
    ```{{execute T1}}

1. In **Terminal 2**, run the following command to load the MovR data set. The command options are mostly self-explanatory. We limit the application to 1 thread because using multiple threads quickly overloads this small demo cluster's ability to ingest data. As a result, loading the data takes about 90 seconds on a fast laptop.

    Be sure to replace `<IP address>` in the `--url` string with the IP address you noted in step 1.

    ```shell
    docker run -it --network host --rm cockroachdb/movr:20.11.1 \
        --app-name "movr-load" \
        --url "postgres://root@<IP address>:26257/movr?sslmode=disable" \
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
    ```

1. Still in **Terminal 2**, run the following command to start MovR in the `us-east` region.

    Again, be sure to replace `<IP address>` in the `--url` string with the IP address you noted in step 1.

    ```shell
    docker run -it --network host --rm cockroachdb/movr:20.11.1 \
        --app-name "movr-us-east" \
        --url "postgres://root@<IP address>:26257/movr?sslmode=disable" \
        run \
        --city="boston" \
        --city="new york" \
        --city="washington dc"
    ```

1. In **Terminal 3**, run the following command to start MovR in the `us-west` region.

    Again, be sure to replace `<IP address>` in the `--url` string with the IP address you noted in step 1.

    ```shell
    docker run -it --network host --rm cockroachdb/movr:20.11.1 \
        --app-name "movr-us-west" \
        --url "postgres://root@<IP address>:26260/movr?sslmode=disable" \
        run \
        --city="los angeles" \
        --city="san francisco" \
        --city="seattle"
    ```

1. In **Terminal 4**, run the following command to start MovR in the `eu-west` region.

    Again, be sure to replace `<IP address>` in the `--url` string with the IP address you noted in step 1.

    ```shell
    docker run -it --network host --rm cockroachdb/movr:20.11.1 \
       --app-name "movr-eu-west" \
       --url "postgres://root@[[HOST_IP]]:26264/movr?sslmode=disable" \
       run \
       --city="amsterdam" \
       --city="paris" \
       --city="rome"
    ```

1. Click **Continue**.
