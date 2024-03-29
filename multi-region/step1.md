In this tutorial, you will experience CockroachDB's multi-region capabilities. Specifically, you will:

1. Get access to a simulated, multi-region CockroachDB cluster.
1. Run a workload on the cluster using our fictional vehicle-sharing application called [MovR](https://www.cockroachlabs.com/docs/v21.1/movr.html).
1. See the effects of network latency on SQL query performance in the default (non-multi-region) configuration.
1. Configure the cluster for good multi-region performance by issuing SQL statements that choose the right **survival goals** and **table localities**.

To get you started, we're installing CockroachDB and MovR and then using the `cockroach demo` command to simulate a 9-node demo cluster spread across 3 regions, with network latency between regions simulated as well.

Once you see a prompt like `root@127.61.177.245:26257/defaultdb>`:

1. Take note of the IP address (the number between `@` and `:` following the colon). You will use it in your app's connection string in step 3.
2. Click **Continue**.
