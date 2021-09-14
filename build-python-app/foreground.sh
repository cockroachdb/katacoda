pip install psycopg2-binary
curl https://binaries.cockroachdb.com/cockroach-v21.1.7.linux-amd64.tgz | tar -xz
cp -i cockroach-v21.1.7.linux-amd64/cockroach /usr/local/bin/
mkdir -p /usr/local/lib/cockroach
cp -i cockroach-v21.1.7.linux-amd64/lib/libgeos.so /usr/local/lib/cockroach/
cp -i cockroach-v21.1.7.linux-amd64/lib/libgeos_c.so /usr/local/lib/cockroach/
exec cockroach demo --empty --embedded
