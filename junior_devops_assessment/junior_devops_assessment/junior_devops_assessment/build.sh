#!/bin/bash

set -e  # Exit on any error

echo "Rebuilding backend container"
docker-compose build --no-cache backend

echo "Starting"
docker-compose up

