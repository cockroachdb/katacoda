# Starting FriendPay

FriendPay is a peer-to-peer payments application. For this scenario, we'll use the FriendPay REST API to demonstrate its functionality and how it interacts with CockroachDB.

Before starting FriendPay, let's make sure our CockroachDB cluster is ready to connect to FriendPay by starting a global cluster:

`cockroach demo --global --nodes 9 --empty --insecure`{{execute T1}}

Let's also add the expected database for FriendPay:

`CREATE DATABASE friendpay;`{{execute T1}}

The last thing we need to do is get the `HOST` of the CockroachDB cluster. You can find that host here:

![](https://imgur.com/sQpoqaN.png)

We'll use that host to set an environmental variable for when we launch our container of the FriendPay application.

In the Terminal 2 tab, replace the `<HOST>` with the host found in the output of the `cockroach demo` call:

`docker run --network="host" -e HOST=<HOST> -p 3000:3000 jowanza/friendpay:latest`

* `docker` is the command for the Docker CLI tool.
* `run` tells Docker that you're interested in running a container with some other configurations.
* `--network="host"` sets the local host as the wider Docker network.
* `-e` is the flag for container environment variables.
* `-p` is the port where we bind our application port to our local network.
* `jowanza/friendpay:latest` is the latest version of the FriendPay application Docker image.

Now we have a running instance of FriendPay, and can move on to explore all of the capabilities of FriendPay.
