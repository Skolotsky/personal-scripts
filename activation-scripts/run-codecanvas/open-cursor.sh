#!/bin/bash

$REPO_PATH/activation-scripts/run-codecanvas/run-vscode-and-cursor.sh

echo "Wait 30 seconds to ensure that Thin Client is and can open the Cursor"
sleep 30

echo "Open Cursor"
canvas run-configuration codecanvas "Cursor"
