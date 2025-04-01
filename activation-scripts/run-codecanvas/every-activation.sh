#!/bin/bash

$REPO_PATH/scripts/create-cursor-run-configuration.sh

echo "Run Sandbox"
canvas run-configuration codecanvas "Run Sandbox"
echo "Wait for Sandbox to open"
until curl -s --head --fail "http://localhost:8001" | grep -q "200 OK"; do
  sleep 1
done
echo "Open Sandbox"
canvas run-configuration codecanvas "Open Sandbox"
canvas run-configuration codecanvas "Cursor"
echo "Run CodeCanvas"
canvas run-configuration codecanvas "Run CodeCanvas"
