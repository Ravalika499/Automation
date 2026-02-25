#!/bin/bash
IMAGE_NAME="devops-hello-world"
PORT=8080
echo "Building Docker image: $IMAGE_NAME..."
docker build -t $IMAGE_NAME ../app/
echo "Starting container on port $PORT..."
docker run -d -p $PORT:$PORT --name test-container $IMAGE_NAME
sleep 3
curl http://localhost:$PORT
docker stop test-container
docker rm test-container
echo "Done!"
