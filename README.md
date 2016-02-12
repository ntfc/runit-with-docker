This is a simple example on how to start services with `runit`.

There is a service that will only run once, and it's intended to be the script
that checks if everything is installed and configured (database, filesystem).

After this service runs, all other services can start.

# Building and running

```
cd runit-docker
git submodule init
git submodule update
make
cd ..
docker build -t runit-test .
docker run -t -i runit-test
... # the test service is executed, and dep is executed afterwards
docker restart
... # on restart, the test service is not executed, but dep executes
```
