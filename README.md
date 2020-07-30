# Dockeriser
###### Spring boot demo project to integrate with Docker and run on Kubernetes

## How to build

Run `build.sh` script: this will generate the jar and Docker image ready to be run.

## How to run

Execute `docker run -P dockeriser:<tag>` (to bind container port to a random host port) or `docker run -p8080:8080 dockeriser:tag` (to bind it to a specific local port) 

