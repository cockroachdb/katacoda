Back in the **DB Console**, as the multi-region schema changes complete, you should see changes to the following metrics:

- _SQL Queries_: This number should go up, since the cluster can service more load due to better performance (due to better data locality and lower latency).
- _Service Latency: SQL, 99th percentile_: In general, even on a small demo cluster like this, the P99 latency should drop and also get less spiky over time, as schema changes finish and data is moved around.
- _Replicas per node_: This will increase, since the data needs to be spread across more nodes in order to service the multi-region workload appropriately. There is nothing you need to do about this, except to note that it happens, and is required for CockroachDB's improved multi-region performance features to work.

**Note:** The small demo cluster used in this example is essentially in a state of overload from the start. The performance numbers shown here only reflect the direction of the performance improvements. You should expect to see much better absolute performance numbers [in a production deployment](https://www.cockroachlabs.com/docs/stable/recommended-production-settings.html) than those described here.
