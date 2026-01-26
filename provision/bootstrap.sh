#!/bin/bash
set -e

echo "update"
apt update -y
apt upgrade -y

echo "Base packages"
apt install -y \
  curl \
  git \
  htop \
  ca-certificates \
  apt-transport-https

echo "Yep"
