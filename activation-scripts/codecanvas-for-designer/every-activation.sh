#!/bin/bash

echo "Working directory: $PWD"

REPO_PATH=$PWD

cd /mnt/jetbrains/work/codecanvas

$REPO_PATH/scripts/create-vscode-run-configuration.sh

echo "Run Stroybook"
canvas run-configuration codecanvas "Run Stroybook"

echo "Run Sandbox"
canvas run-configuration codecanvas "Run Sandbox"

echo "Wait for Storybook to open"
$REPO_PATH/scripts/waitFor.sh "http://localhost:8001"

echo "Open Storybook"
canvas run-configuration codecanvas "Open Stroybook"

echo "Wait for Sandbox to open"
$REPO_PATH/scripts/waitFor.sh "http://localhost:8001"

echo "Open K/JS Sandbox"
canvas run-configuration codecanvas "Open K/JS Sandbox"

echo "Run CodeCanvas"
canvas run-configuration codecanvas "Run CodeCanvas"
