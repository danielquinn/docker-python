# docker-django

The base Docker image for my Django projects

This is basically just a thin wrapper around python:3-alpine to make the
environment inside the container more me-friendly.

* Adds Bash, iPython, postgresql-dev and postgresql-client
* Adds a custom shell
* Tweaks the iPython config to not ask for confirmation on exit.
