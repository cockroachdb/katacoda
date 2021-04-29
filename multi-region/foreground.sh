wget -qO- https://binaries.cockroachdb.com/cockroach-v21.1.0-beta.4.linux-amd64.tgz | tar  xvz
cp -i cockroach-v21.1.0-beta.4.linux-amd64/cockroach /usr/local/bin/
mkdir -p /usr/local/lib/cockroach
cp -i cockroach-v21.1.0-beta.4.linux-amd64/lib/libgeos.so /usr/local/lib/cockroach/
cp -i cockroach-v21.1.0-beta.4.linux-amd64/lib/libgeos_c.so /usr/local/lib/cockroach/
docker pull cockroachdb/movr:20.11.1
socat TCP4-LISTEN:8081,fork,reuseaddr TCP4:127.0.0.1:8080 &
exec cockroach demo --global --nodes 9 --empty --insecure
