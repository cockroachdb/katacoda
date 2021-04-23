Now that you have load hitting the cluster from different regions, check how the service latencies look before you do any multi-region configuration from SQL. This is the "before" case in the "before and after".

In the DB Console, click **Metrics** on the left and hover over the **Service Latency: SQL, 99th percentile** timeseries graph. You should see the effects of network latency on this workload.

- For each of the 3 nodes that we are pointing the movr workload at, the max latency of 99% of queries are in the 1-2 seconds range.
- The SQL latency is high because of the network latency between regions.
