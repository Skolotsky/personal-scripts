#!/bin/bash

echo "Run Storybook"
canvas run-configuration codecanvas "Run Storybook"

echo "Wait for Storybook to be ready"
$REPO_PATH/scripts/waitFor.sh "http://localhost:6006"
