# Dockeriser
###### Spring boot demo project to integrate with Docker and run on Kubernetes

## How to build

Run `build.sh` script: this will generate the jar and Docker image ready to be run.

## How to run

Execute `docker run -P <image-tag>` (to bind container port to a random host port) or `docker run -p8080:8080 <image-tag>` (to bind it to a specific local port)

Note: `<image-tag>` is the GCR url that is printed at the end the execution of `build.sh`.

## Consuming Secrets and Config Maps variables

The values injected into the containers are available using environent variables. The application consumes them in two ways:

- Directly from the envs using System.getEnv()
- Using Spring properties.

The first option is straightforward. You can see this on `DockeriserApplication.kt`

You can see the second option in these files:

- [`src/main/application.yaml`](https://github.com/sescotti/dockeriser/blob/part-2/src/main/resources/application.yaml)
- [src/main/kotlin/com/example/dockeriser/SimpleService.kt](https://github.com/sescotti/dockeriser/blob/part-2/src/main/kotlin/com/example/dockeriser/SimpleService.kt)
- [src/main/kotlin/com/example/dockeriser/EnvironmentProperties.kt](https://github.com/sescotti/dockeriser/blob/part-2/src/main/kotlin/com/example/dockeriser/EnvironmentProperties.kt)

