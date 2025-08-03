#!/bin/bash

echo "Starting Docker containers..."
docker-compose up -d

sleep 10

echo "Running tests..."
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)

if [ "$response" == "200" ]; then
    echo "Test passed! Application is running."
else
    echo "Test failed. Status code was $response"
    exit 1
fi

echo "Cleaning up..."
docker-compose down

echo "Done."