wget -qO- https://binaries.cockroachdb.com/cockroach-v21.1.0.linux-amd64.tgz | tar  xvz
cp -i cockroach-v21.1.0.linux-amd64/cockroach /usr/local/bin/
cockroach start-single-node --insecure
