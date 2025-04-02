#!/bin/bash

$REPO_PATH/activation-scripts/run-codecanvas/run-vscode-and-cursor.sh

echo "Wait 10 seconds to ensure that Thin Client is and can open the Cursor"
sleep 10

echo "Open Cursor"
canvas run-configuration codecanvas "Cursor"
