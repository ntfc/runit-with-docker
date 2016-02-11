This is a simple example on how to start services with `runit`.

There is a service that will only run once, and it's intended to be the script
that checks if everything is installed and configured (database, filesystem).

After this service runs, all other services can start.
