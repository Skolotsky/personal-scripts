#!/bin/bash

echo "Start backend services"
.rdo/spaceport/minikube/start-compound.sh

echo "Start frontend"
echo "Run CodeCanvas Web Client"
canvas run-configuration codecanvas "webpack-dev-server"

echo "Wait for CodeCanvas Web Client to be ready"
./deployments/kubernetes/.ci/spaceport/wait-healthcheck.sh http://localhost:8000/health
echo "CodeCanvas is up and running"
