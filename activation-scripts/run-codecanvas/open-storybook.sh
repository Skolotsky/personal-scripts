#!/bin/bash

echo "Run Stroybook"
canvas run-configuration codecanvas "Run Stroybook"

echo "Wait for Storybook to be ready"
$REPO_PATH/scripts/waitFor.sh "http://localhost:6006"

echo "Open Storybook"
canvas run-configuration codecanvas "Open Stroybook"
