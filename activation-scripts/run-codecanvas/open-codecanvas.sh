#!/bin/bash

$REPO_PATH/activation-scripts/run-codecanvas/run-codecanvas.sh

echo "Open CodeCanvas"
canvas run-configuration codecanvas "Web Client (debug JS)"
