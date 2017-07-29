# docker-django

The base Docker image for my Django projects

This is basically just a thin wrapper around python:3 to make the environment
inside the container more me-friendly.

## Alpine

* Adds Bash

## Debian

* Adds Bash and net-tools

## Alpine & Debian

* Adds a iPython and custom prompt
* Tweaks the iPython config to not ask for confirmation on exit.
