# Exploring FriendPay via CockroachDB

Now that we have grasped some of the ways we can simulate failure in CockroachDB, as well as the value of geopartitioning in CockroachDB, let's combine that knowledge and see how our application responds to load.

## Start a Cockroach Cluster

Let's start a Cockroach cluster. We'll do it a little differently than we have in the past, because we need to create specific locality to demo these features:

`cockroach demo --nodes 9 --empty --insecure --demo-locality=region=us-east1,zone=1:region=us-east1,zone=2:region=us-west1,zone=1:region=us-west1,zone=2:region=us-west2,zone=1:region=us-west2,zone=2:region=us-east2,zone=1:region=us-east2,zone=2:region=us-east2,zone=3`{{execute T1}}

Be sure to record the `HOST` of the Cockroach cluster. You can find that host here:

![](https://imgur.com/sQpoqaN.png)

Now, let's create the `friendpay` schema:

`CREATE DATABASE friendpay PRIMARY REGION "us-east2" REGIONS "us-east1", "us-east2", "us-west1","us-west2";`{{execute T1}}

We'll also make sure we're using the `friendpay` schema in subsequent calls:

`use friendpay;`{{execute T1}}

## Start FriendPay

Use the `HOST` collected before to start FriendPay. In a *new tab*, run the following command:

`docker run --network="host" -e HOST=<HOST> -p 3000:3000 jowanza/friendpay:latest`

By starting the application, FriendPay has run migration and created the necessary tables. Now we can geopartition them.

## Setting a Database Region

We will set a primary region for our database, which will enable us to utilize [*survival goals*)](https://www.cockroachlabs.com/docs/v21.1/multiregion-overview.html#survival-goals). 

We'll set our primary region to `us-east2`:

`ALTER DATABASE "friendpay" SET PRIMARY REGION "us-east1";`{{execute T1}}

## Setting Survival Goals

We will set a survival goal to survive a region failure. CockroachDB will automatically manage our replication in the background to handle this type of failure:

`ALTER DATABASE "friendpay" SURVIVE REGION FAILURE;`{{execute T1}}

## Set Table Locality

Next, we'll use the regional tables feature in CockroachDB to improve the performance for reads and writes for a specific region:

`ALTER TABLE "Users" SET LOCALITY REGIONAL BY TABLE IN PRIMARY REGION;`{{execute T1}}

## Set Regional by Row Table

For our `Balances` table, we'll set the locality regional by row. This setting automatically optimizes row-level access for different regions.

`ALTER TABLE "Balances" SET LOCALITY REGIONAL BY ROW;`{{execute T1}}

## Set a Global Table

Finally, we'll create a global table from the `Transactions` table. Global tables enable low-latency reads from any region. Since transactions in FriendPay can happen across all time zones, any application that uses transactions can benefit from this optimization:

`ALTER TABLE "Transactions" SET LOCALITY GLOBAL;`{{execute T1}}
  
## Start FriendPay Simulator

The FriendPay Simulator is a small application that simulates traffic to the FriendPay application. For our use case, it will simply create new users every 2 seconds:

`docker run --network="host"  jowanza/friendpaysimulator`{{execute  T3}}

## Start Chaos

Let's return to the CockroachDB console and start to simulate some chaos: 

`\demo ls`{{execute T1}}

Let's remove nodes 3 and 5:

`\demo shutdown 5`{{execute T1}}
`\demo shutdown 3`{{execute T1}}

Now let's bring them back:

`\demo restart 3`{{execute T1}}
`\demo restart 5`{{execute T1}}

## Observe

Return to Terminal 3 as you make these changes.

From the CockroachDB dashboard, we can see the performance degradation in our application as regions come and go. We can also see in the logs for the FriendPay Simulator that performance takes a hit when we take regions out. One thing to note is that CockroachDB is resilient to these failures—even though we may see slight bumps in latency, we don't see any data loss.

A final note: while this environment and demo are helpful for learning, none of these tools are suitable for production.
