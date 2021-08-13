# Exploring FriendPay

When we launched our instance of FriendPay, several tables were created to support the application. Let's explore some of these tables and their schemas.

First, let's switch our database to the `friendpay` database we created earlier (when you click to execute the command, it will automatically open in the correct terminal):

`USE friendpay;`{{execute T1}}

List all the tables in the database:

`SHOW TABLES;`{{execute T1}}

We should see the following tables:

* `Balances`: This table keeps the balances for users.
* `SequelizeMeta`: This table stores metadata for the ORM we use in FriendPay and can be ignored.
* `Transactions`: This table stores all transactions in FriendPay.
* `Users`: This table stores all user information.

## Create Users

To get started, we need to create some users in FriendPay. Similar to before, commands will execute in the correct tab when you click on them. 

This first request will create a user with the handle `kjackson`.

`curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"firstName": "kevin", "lastName": "jackson", "email": "k.jackson@gmail.com", "handle":"kjackson"}'\
  http://localhost:3000/createUser | jq`{{execute T3}}

This will create another user with the handle `rwonder`:

`curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"firstName": "robert", "lastName": "wonder", "email": "r.wonder@gmail.com", "handle":"rwonder"}'\
  http://localhost:3000/createUser | jq`{{execute T3}}

 We can return to our CockroachDB tab to confirm that users were added to the database:

 `SELECT * from "Users";`{{execute T1}}

 We can also see that each of these users were given $500 on account creation: 

 `SELECT * from "Balances";`{{execute T1}}

## Transfer Funds

Now that we have created two users, let's send money. We will send $100 from `rwonder` to  `kjackson`.

`curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"fromUser": "rwonder", "toUser": "kjackson", "amount": 100}' \
  http://localhost:3000/transferFunds | jq`{{execute T3}}
  
 ## Confirm Transfer

 We can confirm the transfer in two places by checking the balances of each user.

Once for `rwonder`:

`curl http://localhost:3000/balance?handle=rwonder | jq`{{execute T3}}

And once for `kjackson`:

`curl http://localhost:3000/balance?handle=kjackson | jq`{{execute T3}}

## Check Transaction Log

Finally, since we only have two users, we can check the transaction log for one of them: 

`curl  http://localhost:3000/transactions?handle=rwonder | jq`{{execute T3}}

We've gotten a good idea of how FriendPay works and how it connects with CockroachDB. Now we know enough to move onto what happens in a multiregion and global environment.
