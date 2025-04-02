#!/bin/bash

# Check if a URL is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

URL=$1

until curl -s --head --fail "$URL" | grep -q "200 OK"; do
  sleep 1
done