This lab and all subsequent labs give you direct access to a remote Linux VM.

Download and extract the CockroachDB archive for Linux:

```shell
wget -qO- https://binaries.cockroachdb.com/cockroach-v20.2.7.linux-amd64.tgz | tar xvz
```{{execute}}

**Tip:** Click on a command to run it in the terminal.

Copy the `cockroach` binary into the `PATH` so you can execute `cockroach` commands from any shell:

```shell
cp -i cockroach-v20.2.7.linux-amd64/cockroach /usr/local/bin/
```{{execute}}
