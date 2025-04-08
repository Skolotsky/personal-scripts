#!/bin/bash

echo "Working directory: $PWD"

export REPO_PATH=$PWD

cd /mnt/jetbrains/work/codecanvas

# avoid races with ide startup
sleep 5

$REPO_PATH/activation-scripts/run-codecanvas/open-sandbox.sh &
$REPO_PATH/activation-scripts/run-codecanvas/open-storybook.sh &
$REPO_PATH/activation-scripts/run-codecanvas/open-cursor.sh &
$REPO_PATH/activation-scripts/run-codecanvas/open-codecanvas.sh &
