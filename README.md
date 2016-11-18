# docker-python

The base Docker image for my Python projects

This is basically just a thin wrapper around python3:alpine to make the
environment inside the container more me-friendly.

* Adds Bash
* Adds iPython
* Adds a custom shell
* Tweaks the iPython config to not ask for confirmation on exit.

