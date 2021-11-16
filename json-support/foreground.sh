curl https://binaries.cockroachdb.com/cockroach-v21.2.0.linux-amd64.tgz | tar -xz
cp -i cockroach-v21.2.0.linux-amd64/cockroach /usr/local/bin/
cockroach start-single-node --insecure
