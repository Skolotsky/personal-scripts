#!/bin/bash

echo "Run Sandbox"
canvas run-configuration codecanvas "Run Sandbox"

echo "Wait for Sandbox to be ready"
$REPO_PATH/scripts/waitFor.sh "http://localhost:8001"
