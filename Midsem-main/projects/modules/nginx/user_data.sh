#!/bin/bash
set -e

sudo apt-get update -y
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run --name nginx-server --restart always -p 80:80 -d nginx:latest
