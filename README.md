# ezcfg-docker

This repository includes the dockerfile as well as th encessary application files for creating the docker image for the Ezcfg application.

To build the docker file for the Ezcfg application in k8s, run the following docker command:


docker buildx build . --builder=kube -t docker.lib.umd.edu/ezcfg-webapp:<tag> --push


Make sure you have the "build" namespace.
