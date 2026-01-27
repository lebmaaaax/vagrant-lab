#!/bin/bash
set -e

USER_NAME=admin

id -u $USER_NAME &>/dev/null || useradd -m -s /bin/bash $USER_NAME
usermod -aG sudo,docker $USER_NAME

mkdir -p /home/$USER_NAME/.ssh
chmod 700 /home/$USER_NAME/.ssh
