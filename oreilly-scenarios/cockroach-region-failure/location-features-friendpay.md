# Location Features of FriendPay

When we create a new user in FriendPay, we assign them a US-specific time zone (one of the following):

* `PST` for Pacific Standard Time
* `MST` for Mountain Standard Time
* `CST` for Central Standard Time
* `EST` for Eastern Standard Time

We can use this assignment to do some geopartitioning of our data. The advantages of geopartitioning are:

* Allowing replication based on that specific key (in our case, time zone)
* Improve performance for queries on that partitioning key

Let's add some geopartitioning to our tables for FriendPay.
