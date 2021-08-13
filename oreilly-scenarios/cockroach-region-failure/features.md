# CockroachDB Demo Application Features

To begin, let's start a multiregion cluster:

`cockroach demo --nodes 9 --empty --insecure`{{execute T1}}

From here, we can check all of our nodes and regions:

`\demo ls`{{execute T1}}

We can also see which regions our cluster is deployed in:

`SHOW REGIONS FROM CLUSTER;`{{execute T1}}

You may have noticed that each node in our `ls` command had a number associated with it. With that number, we can issue commands to CockroachDB to interface with the nodes in the cluster.

We can also shut down a node:

`\demo shutdown 3`{{execute T1}}

We can list the nodes to see that 3 is no longer listed:

`\demo ls`{{execute T1}}

We can now restart the node we shut down:

`\demo restart 3`{{execute T1}}

We can also decommission a node:

`\demo decommission 3`{{execute T1}}

We can also create new nodes in new regions:

`\demo add region=us-central1,zone=a`{{execute T1}}

We can check our list of nodes to validate the new addition to the cluster:

`\demo ls`{{execute T1}}

We'll use these features to simulate nodes coming online and going offline in our application.

`exit`{{execute T1}}
