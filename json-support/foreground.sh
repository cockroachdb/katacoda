curl https://binaries.cockroachdb.com/cockroach-v21.1.7.linux-amd64.tgz | tar -xz
cp -i cockroach-v21.1.7.linux-amd64/cockroach /usr/local/bin/
cockroach start-single-node --insecure
