#!/bin/bash

echo "Start backend services"
.rdo/spaceport/minikube/start-compound.sh

echo "Start frontend"
echo "Run configuration 'webpack-dev-server'"
canvas run-configuration codecanvas "webpack-dev-server"

deployments/kubernetes/.ci/spaceport/wait-healthcheck.sh http://localhost:8000/health
echo "CodeCanvas is up and running"

echo "Open in browser"
echo "Run configuration 'Web Client (debug JS)'"
canvas run-configuration codecanvas "Web Client (debug JS)"
