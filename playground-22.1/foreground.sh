echo 'Installing CockroachDB v22.1 and supporting spatial libraries...'

curl https://binaries.cockroachdb.com/cockroach-v22.1.0-beta.3.linux-amd64.tgz | tar -xz
cp -i cockroach-v22.1.0-beta.3.linux-amd64/cockroach /usr/local/bin/
mkdir -p /usr/local/lib/cockroach
cp -i cockroach-v22.1.0-beta.3.linux-amd64/lib/libgeos.so /usr/local/lib/cockroach/
cp -i cockroach-v22.1.0-beta.3.linux-amd64/lib/libgeos_c.so /usr/local/lib/cockroach/

echo 'Starting a secure single-node cluster...'

mkdir certs my-safe-directory
cockroach cert create-ca --certs-dir=certs --ca-key=my-safe-directory/ca.key
cockroach cert create-node localhost $(hostname) --certs-dir=certs --ca-key=my-safe-directory/ca.key
cockroach cert create-client root --certs-dir=certs --ca-key=my-safe-directory/ca.key
cockroach start-single-node --certs-dir=certs --background

echo 'Loading a sample database...'

cockroach workload init movr 'postgres://root@localhost:26257?sslmode=verify-full&sslrootcert=certs/ca.crt&sslcert=certs/client.root.crt&sslkey=certs/client.root.key'

echo 'Creating a user for accessing the DB Console...'

cockroach sql --certs-dir=certs --execute="CREATE USER max WITH PASSWORD 'roach'; GRANT admin TO max;"

echo 'Opening an interactive SQL shell and listing tables in the sample database...'

exec cockroach sql --database=movr --certs-dir=certs --embedded
SHOW TABLES;
