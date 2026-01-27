#!/bin/bash
set -e

echo "Install Docker"
apt install -y docker.io docker-compose
systemctl enable docker
systemctl start docker
