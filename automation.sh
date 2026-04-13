#!/bin/bash

set -e

IMAGE_NAME="test-1"
CONTAINER_NAME="test-2"
PROJECT_PATH="/home/antonya/Downloads/docker-demo-with-simple-python-app-master"
PORT_MAPPING="5000:5000"

cd "$PROJECT_PATH"


docker stop "$CONTAINER_NAME" 


docker rm "$CONTAINER_NAME" 


docker build -t "$IMAGE_NAME" .


docker run -d \
  --name "$CONTAINER_NAME" \
  -p "$PORT_MAPPING" \
  "$IMAGE_NAME"


