#!/bin/bash

aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 896836667748.dkr.ecr.ap-southeast-1.amazonaws.com
docker stop nodejs || true
docker rm nodejs || true
echo "Pulling and running the new Docker container..."
docker run -d -p 8080:8080 896836667748.dkr.ecr.ap-southeast-1.amazonaws.com/wlo-private-repo:latest