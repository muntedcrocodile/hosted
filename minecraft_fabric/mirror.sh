#!/bin/bash

# Set the service name as a variable
SERVICE_NAME="minecraft_fabric_mirror"

# Stop the Docker service
docker compose stop $SERVICE_NAME

# Delete the data in the ./data_mirror folder
rm -rf ./data_mirror/*

# Copy data from ./data to ./data_mirror
cp -r ./data/* ./data_mirror/

# Start the Docker service
docker compose up -d $SERVICE_NAME