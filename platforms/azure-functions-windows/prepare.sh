#!/bin/sh

set -eux

# This file is only run in CI

ls -lah

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get update
sudo apt-cache policy azure-functions-core-tools
sudo apt-get install azure-functions-core-tools=2.7.1846-1

ls -lah

az login --service-principal -u "$AZURE_SP_NAME" -p "$AZURE_SP_PASSWORD" --tenant "$AZURE_SP_TENANT"

ls -lah
