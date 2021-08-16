# Validate the Installation

To begin this scenario, we've installed the same CockroachDB demo we did in the previous scenario. Let's validate the installation before moving forward:

`which cockroach`{{execute T1}}

We can confirm that CockroachDB is installed correctly by starting it and running a query. First run:

`cockroach demo`{{execute T1}}

This will give you a SQL shell to CockroachDB. We can execute a query and validate that the database is functioning properly:

`SELECT * FROM information_schema.sequences;`{{execute T1}}

Now that we're satisfied the database is working correctly, we can exit and move onto running a multiregion cluster.

`exit`{{execute T1}}
